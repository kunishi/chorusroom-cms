<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:rss="http://purl.org/rss/1.0/"
		xmlns="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="rdf dc rss"
		version="1.0">
  
  <xsl:include href="common.xsl"/>
  <xsl:output method="xml" indent="yes"/>

  <!-- 
  <xsl:template match="/">
    <html>
      <head>
	<title>新着情報</title>
      </head>
      <body>
	<h1>新着情報</h1>
	<p>
	  最新の15件の更新情報を掲載しています。この新着情報は
	  <a href="news.rss"><img src="/image/rdf.png" alt=""/> RSS1.0</a>でも提供しています。
	</p>
	<xsl:apply-templates select="//rss:items"/>
      </body>
    </html>
  </xsl:template>
  -->

  <xsl:template match="rss:items">
    <ul>
      <xsl:for-each select=".//rdf:li">
	<li>
	  <xsl:apply-templates select="."/>
	</li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="rdf:li">
    <xsl:apply-templates select="//rss:item[@rdf:about=current()/@rdf:resource]"/>
  </xsl:template>

  <xsl:template match="rss:item">
    <a>
      <xsl:attribute name="href">
	<xsl:value-of select="@rdf:about"/>
      </xsl:attribute>
      <xsl:value-of select="rss:title"/>
    </a>
    <xsl:if test="dc:date">
      <xsl:text> (</xsl:text><xsl:value-of select="dc:date"/><xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="rss:description">
      <br />
      <xsl:value-of select="rss:description"/>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
