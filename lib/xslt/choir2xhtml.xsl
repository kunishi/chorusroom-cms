<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:c='http://www.chorusroom.org/choir'
  xmlns:cr='http://www.chorusroom.org/character'
  xmlns:xhtml='http://www.w3.org/1999/xhtml'
  exclude-result-prefixes='c cr'>

  <xsl:import href="common.xsl"/>

  <xsl:param name="template">menu-choirlink.xml</xsl:param>

  <xsl:output method='xml' indent='yes' encoding='utf-8'/>

  <xsl:template match='/'>
    <xhtml:html>
      <xhtml:head>
        <xhtml:title>
          <xsl:text>合唱の部屋:合唱団リンク:</xsl:text>
          <xsl:value-of select='c:choir/c:name'/>
        </xhtml:title>
	<xsl:call-template name="additional-header"/>
      </xhtml:head>
      <xhtml:body>
	<xsl:call-template name="body-header"/>
	<xhtml:div class="body">
	  <xhtml:h1>
	    <xsl:value-of select='c:choir/c:name'/>
	  </xhtml:h1>
	  <xhtml:table border='1'>
	    <xhtml:tbody>
	      <xhtml:tr>
		<xhtml:th align='left'>種別</xhtml:th>
		<xhtml:td>
		  <xsl:apply-templates select='c:choir/c:kind' />
		</xhtml:td>
	      </xhtml:tr>
	      <xhtml:tr>
		<xhtml:th align='left'>主な活動地域(都道府県)</xhtml:th>
		<xhtml:td>
		  <xsl:value-of select='c:choir/c:prefecture'/>
		</xhtml:td>
	      </xhtml:tr>
	      <xhtml:tr>
		<xhtml:th align='left'>ホームページURL</xhtml:th>
		<xhtml:td>
		  <xsl:for-each select="c:choir/c:url">
		    <xsl:apply-templates select="."/>
		    <xsl:if test="not(position()=last())">
		      <xhtml:br/>
		    </xsl:if>
		  </xsl:for-each>
		</xhtml:td>
	      </xhtml:tr>
	      <xhtml:tr>
		<xhtml:th align='left'>コメント</xhtml:th>
		<xhtml:td>
		  <xsl:value-of select='c:choir/c:comment'/>
		</xhtml:td>
	      </xhtml:tr>
	    </xhtml:tbody>
	  </xhtml:table>
	</xhtml:div>
	<xsl:apply-templates select="document(concat('../../../xml/templates/',$template))/xhtml:div">
	  <xsl:with-param name="choir-name">
	    <xsl:value-of select="c:choir/c:name"/>
	  </xsl:with-param>
	</xsl:apply-templates>
	<xsl:call-template name="footer"/>
      </xhtml:body>
    </xhtml:html>
  </xsl:template>

  <xsl:template match="xhtml:*[local-name()='span' and @class='google']"
		priority="1.0">
    <xsl:param name="choir-name"></xsl:param>
    <xsl:call-template name='google-search-www'>
      <xsl:with-param name='keyword'>
	<xsl:value-of select='$choir-name'/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="xhtml:*">
    <xsl:param name="choir-name"></xsl:param>
    <xsl:element name="{local-name(.)}" namespace="{namespace-uri(.)}">
      <xsl:apply-templates select="@*[not(name()='xmlns:*')]"/>
      <xsl:apply-templates select="node()">
	<xsl:with-param name="choir-name">
	  <xsl:value-of select="$choir-name"/>
	</xsl:with-param>
      </xsl:apply-templates>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{local-name()}" namespace="{namespace-uri()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match='c:kind'>
    <xsl:choose>
      <xsl:when test='.="general"'>
	<xhtml:a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/General/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>一般</xsl:text>
	</xhtml:a>
      </xsl:when>
      <xsl:when test='.="univ"'>
	<xhtml:a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Univ/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>大学</xsl:text>
	</xhtml:a>
      </xsl:when>
      <xsl:when test='.="company"'>
	<xhtml:a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Company/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>職場</xsl:text>
	</xhtml:a>
      </xsl:when>
      <xsl:when test='.="highschool"'>
	<xhtml:a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Highschool/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>中学・高校</xsl:text>
	</xhtml:a>
      </xsl:when>
      <xsl:when test='.="children"'>
	<xhtml:a>
	  <xsl:attribute name="href">
	    <xsl:text>/links/Choir/Children/</xsl:text>
	  </xsl:attribute>
	  <xsl:text>児童合唱</xsl:text>
	</xhtml:a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>そのほか</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="c:url">
    <xhtml:a>
      <xsl:attribute name='href'>
	<xsl:value-of select='.'/>
      </xsl:attribute>
      <xsl:value-of select='.'/>
    </xhtml:a>
  </xsl:template>

  <xsl:include href="google-search.xsl"/>

</xsl:stylesheet>
