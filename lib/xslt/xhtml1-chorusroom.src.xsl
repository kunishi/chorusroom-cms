<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: xhtml1-chorusroom.src.xsl,v 1.15 2003/02/05 11:40:04 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:c="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:r="http://www.chorusroom.org/resource"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:rss="http://purl.org/rss/1.0/"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="c p r rdf dc rss">

  <xsl:import href="common.xsl"/>
  <xsl:param name="output-encoding"/>
  <xsl:param name="suffix"/>
  <xsl:param name="template">menu-default.xml</xsl:param>
  <xsl:include href="google-search.xsl"/>
  <xsl:include href="resource.xsl"/>
  <xsl:include href="xinclude.xsl"/>
  <xsl:include href="xhtml1-choir-links.xsl"/>
  <xsl:include href="xhtml1-links.xsl"/>

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="*[local-name()='head']" priority='1.0'>
    <head>
      <xsl:apply-templates select="@*"/>
      <xsl:call-template name="additional-header"/>
      <xsl:apply-templates select="node()"/>
    </head>
  </xsl:template>

  <xsl:template match="*[local-name()='body']" priority='1.0'>
    <body>
      <xsl:apply-templates select="@*"/>
      <xsl:call-template name="body-header" />
      <xsl:apply-templates select="node()"/>
      <xsl:call-template name="sidemenu"/>
      <xsl:call-template name="footer"/>
    </body>
  </xsl:template>

  <!-- side menu -->
  <xsl:template name="sidemenu">
    <xsl:apply-templates select="document(concat('../../../xml/templates/',$template))"/>
  </xsl:template>

  <xsl:template match="*[local-name()='span' and @class='menu']"
		priority='1.0'>
    <xsl:apply-templates select="document(concat('../../../xml/templates/',$template))"/>
  </xsl:template>

  <!-- Google search -->
  <xsl:template match="*[local-name()='span' and @class='google']"
		priority='1.0'>
    <xsl:call-template name="google-search">
      <xsl:with-param name="keyword"></xsl:with-param>
      <xsl:with-param name="wwwsearch">false</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- RSS news -->
  <xsl:template match="*[local-name()='span' and @class='rssnews']"
		priority="1.0">
    <ul>
      <xsl:apply-templates select="document('../../../xml/info/news.rss')//rss:item"/>
    </ul>
  </xsl:template>

  <xsl:template match="rss:item">
    <li>
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
    </li>
  </xsl:template>

  <!-- copy xhtml elements -->
  <xsl:template match="*">
    <xsl:element name="{local-name(.)}" namespace="{namespace-uri(.)}">
      <xsl:apply-templates select="@*[not(name()='xmlns:*')]"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{local-name()}" namespace="{namespace-uri()}">
      <xsl:choose>
        <xsl:when test="contains(., '%%TOPDIR%%')">
          <xsl:value-of select="concat(substring-before(., '%%TOPDIR%%'),
                                $topdir,
                                substring-after(., '%%TOPDIR%%'))"/>
        </xsl:when>
        <xsl:when test="contains(., '%%IMAGEDIR%%')">
          <xsl:value-of select="concat(substring-before(., '%%IMAGEDIR%%'),
                                $imagedir,
                                substring-after(., '%%IMAGEDIR%%'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
