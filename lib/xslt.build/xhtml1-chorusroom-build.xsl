<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:cr='http://www.chorusroom.org/xml'
  xmlns:p='http://www.chorusroom.org/piece'
  xmlns:char='http://www.chorusroom.org/character'
  xmlns:r='http://www.chorusroom.org/resource'
  xmlns:xml='http://www.w3.org/XML/1998/namespace'
  xmlns='http://www.w3.org/1999/xhtml'
  exclude-result-prefixes='cr p char r'>

  <xsl:include href='resource.xsl'/>
  <xsl:param name="topdir">/</xsl:param>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="output-encoding">utf-8</xsl:param>

  <xsl:output method='xml' indent='yes' encoding='utf-8'/>

  <xsl:variable name="maintainerName" select="document('../dtd/resource.xml')/r:resources/r:resource[@name='maintainerName']/@value"/>
  <xsl:variable name="maintainerJName" select="document('../dtd/resource.xml')/r:resources/r:resource[@name='maintainerJName']/@value"/>
  <xsl:variable name="maintainerEmail" select="document('../dtd/resource.xml')/r:resources/r:resource[@name='maintainerEmail']/@value"/>

  <xsl:template name="additional-header">
    <link rev="made">
      <xsl:attribute name="href">
	<xsl:value-of select="concat('mailto:',$maintainerEmail)"/>
      </xsl:attribute>
    </link>
  </xsl:template>

  <xsl:template name="footer">
    <hr/>
    <div class="footer">
      <address>
        <a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat('mailto:', $maintainerEmail)"/>
	  </xsl:attribute>
          <xsl:choose>
            <xsl:when test="$output-encoding='iso-8859-1'">
	      <xsl:value-of select="$maintainerName"/>
            </xsl:when>
            <xsl:otherwise>
	      <xsl:value-of select="$maintainerJName"/>
            </xsl:otherwise>
          </xsl:choose>
	  <xsl:text> &lt;</xsl:text>
	  <xsl:value-of select="$maintainerEmail"/>
	  <xsl:text>&gt;</xsl:text>
        </a>
      </address>
      <p>
        <xsl:text>Copyright (C) 2000,2001,2002 </xsl:text>
	<xsl:value-of select="$maintainerName"/>
	<xsl:text>.  All rights reserved.</xsl:text>
      </p>
    </div>
  </xsl:template>

  <xsl:template match='*[name()="head"]' priority='1.0'>
    <head>
      <xsl:apply-templates select='@*'/>
      <xsl:call-template name='additional-header'/>
      <xsl:apply-templates select='node()'/>
    </head>
  </xsl:template>

  <xsl:template match="*[name()='body']" priority="1.0">
    <body>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
      <xsl:call-template name="footer"/>
    </body>
  </xsl:template>

  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:choose>
      <xsl:when test="contains(., '%%TOPDIR%%')">
        <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
          <xsl:value-of select="concat(substring-before(., '%%TOPDIR%%'),
                                $topdir,
                                substring-after(., '%%TOPDIR%%'))"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="contains(., '%%IMAGEDIR%%')">
        <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
          <xsl:value-of select="concat(substring-before(., '%%IMAGEDIR%%'),
                                $imagedir,
                                substring-after(., '%%IMAGEDIR%%'))"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy>
          <xsl:apply-templates/>
        </xsl:copy>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
