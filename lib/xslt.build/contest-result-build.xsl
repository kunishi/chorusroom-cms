<?xml version='1.0' encoding='utf-8'?>
<!-- $Id: contest-result-build.xsl,v 1.4 2002/08/08 03:40:00 kunishi Exp $ -->
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:lxslt='http://xml.apache.org/xslt'
  xmlns:redirect='org.apache.xalan.lib.Redirect'
  xmlns:c='http://www.chorusroom.org/xml'
  xmlns:p='http://www.chorusroom.org/piece'
  xmlns:cr='http://www.chorusroom.org/character'
  extension-element-prefixes='redirect'
  exclude-result-prefixes=''>

  <xsl:param name="output-base"/>
  <xsl:param name="docBaseURI"/>
  <xsl:param name='outDir'/>

  <xsl:output method='xml' indent='yes' encoding='utf-8'/>

  <xsl:template match='/'>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match='processing-instruction()' priority='1'/>

  <xsl:template match='c:result'>
    <redirect:open select='concat($outDir, @output, ".xml")'/>
    <redirect:write select='concat($outDir, @output, ".xml")'>
      <xsl:apply-templates select='/c:competition' mode='result'>
        <xsl:with-param name='select' select='@output'/>
      </xsl:apply-templates>
    </redirect:write>
    <redirect:close select='concat($outDir, @output, ".xml")'/>
    <xsl:if test='.//c:scores'>
      <redirect:open select='concat($outDir, @output, "-score.xml")'/>
      <redirect:write select='concat($outDir, @output, "-score.xml")'>
        <xsl:apply-templates select="/c:competition" mode="score">
          <xsl:with-param name='select' select='@output'/>
        </xsl:apply-templates>
      </redirect:write>
      <redirect:close select='concat($outDir, @output, "-score.xml")'/>
    </xsl:if>
  </xsl:template>

  <xsl:template match='/' mode='result'>
    <xsl:param name='select'/>
    <xsl:processing-instruction name="xml-stylesheet">
      href="../../../../xsl/test.xsl" type="text/xml"
    </xsl:processing-instruction>
    <xsl:apply-templates mode='result'>
      <xsl:with-param name='select' select='$select'/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match='c:competition' mode='result' priority='1.0'>
    <xsl:param name='select'/>
    <xsl:element name='{concat("c:", local-name())}'
      namespace='http://www.chorusroom.org/xml'>
      <xsl:apply-templates select='@*|c:cvs-id|c:competition-name|c:result[@output=$select]' mode='result'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='c:result' mode='result' priority='1.0'>
    <xsl:element name="{concat('c:', local-name())}"
      namespace='http://www.chorusroom.org/xml'>
      <xsl:if test='.//c:scores'>
        <xsl:element name='c:scoreTableRef' namespace='http://www.chorusroom.org/xml'>
          <xsl:attribute name='href'>
            <xsl:value-of select='concat(@output, "-score")'/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
      <xsl:apply-templates select='@*|node()' mode='result'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='c:cvs-id' mode="result" priority='1.0'/>

  <xsl:template match='c:reporter' mode='result' priority='1.0'>
    <xsl:choose>
      <xsl:when test='@anonymous="true"'>
        <c:repoter><xsl:text>匿名希望</xsl:text></c:repoter>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name='{concat("c:", local-name())}'>
          <xsl:apply-templates select='c:reporter-name' mode='result'/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='c:reporter-name' mode='result' priority='1.0'>
    <xsl:choose>
      <xsl:when test="@penname">
	<xsl:value-of select="@penname"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='c:pieceRef' mode='result' priority='1.0'>
    <xsl:variable name="number" select="@number"/>
    <xsl:apply-templates
      select='document(concat($docBaseURI,"/",@href))
              //c:givenProgram[./c:givenProgramNumber=$number]/p:*'
      mode='result'/>
  </xsl:template>

  <xsl:template match='c:scores' mode='result' priority='1.0'/>

  <xsl:template match='c:*' mode='result'>
    <xsl:element name='{concat("c:", local-name())}'
      namespace='http://www.chorusroom.org/xml'>
      <xsl:apply-templates select='@*|node()' mode='result'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='p:*' mode='result'>
    <xsl:element name='{concat("p:", local-name())}'
      namespace='http://www.chorusroom.org/piece'>
      <xsl:apply-templates select='@*|node()' mode='result'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='cr:*' mode='result'>
    <xsl:element name='{concat("cr:", local-name())}'
      namespace='http://www.chorusroom.org/character'>
      <xsl:apply-templates select='@*|node()' mode='result'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='@*|text()' mode='result'>
    <xsl:copy>
      <xsl:apply-templates select='.' mode='result'/>
    </xsl:copy>
  </xsl:template>

  <!-- score -->
  <xsl:template match='/' mode='score'>
    <xsl:param name='select'/>
    <xsl:processing-instruction name="xml-stylesheet">
      href="../../../../xsl/test-score.xsl" type="text/xml"
    </xsl:processing-instruction>
    <xsl:apply-templates mode='score' select='c:competition'>
      <xsl:with-param name='select' select='$select'/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="c:competition" mode="score">
    <xsl:param name='select'/>
    <xsl:element name='{concat("c:", local-name())}'
      namespace='http://www.chorusroom.org/xml'>
      <xsl:apply-templates select="@*|c:cvs-id|c:competition-name|c:result[@output=$select]"
        mode='score'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="processing-instruction()" priority='1' mode="score"/>

  <xsl:template match="c:result" mode="score" priority='1.0'>
    <xsl:element name='{concat("c:", local-name())}'> 
      <xsl:apply-templates select="@*|c:section[c:choir/c:scores]|c:referee"
        mode="score"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="c:cvs-id" mode="score" priority='1.0'/>

  <xsl:template match="c:choir" mode="score" priority='1.0'>
    <xsl:element name='{concat("c:", local-name())}'>
      <xsl:apply-templates select="@*|c:choir-name|c:prize|c:special-prize|
                                   c:scores"
        mode="score"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="c:competition-name|c:section|c:referee|
                       c:section-name|c:choir-name|c:prize|c:special-prize|
                       c:scores|c:score|c:total-score|c:score-note"
    mode="score">
    <xsl:element name='{concat("c:", local-name())}'>
      <xsl:apply-templates select="@*|node()" mode="score"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='p:*' mode='score'>
    <xsl:element name='{concat("p:", local-name())}'
      namespace='http://www.chorusroom.org/piece'>
      <xsl:apply-templates select='@*|node()' mode='score'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='cr:*' mode='score'>
    <xsl:element name='{concat("cr:", local-name())}'
      namespace='http://www.chorusroom.org/character'>
      <xsl:apply-templates select='@*|node()' mode='score'/>
    </xsl:element>
  </xsl:template>

  <xsl:template match='@*|text()' mode='score'>
    <xsl:copy>
      <xsl:apply-templates select='.' mode='score'/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
