<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: xhtml1-chorusroom.src.xsl,v 1.9 2001/08/06 02:07:40 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.lib.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:r="http://www.chorusroom.org/resource"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns:xml="http://www.w3.org/XML/1998/namespace"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="cr p char r">

  <xsl:param name="output-encoding"/>
  <xsl:param name="suffix"/>
  <xsl:include href="common.xsl"/>
  <xsl:include href="dummy-char-conv.xsl"/>
  <xsl:include href="resource.xsl"/>

  <xsl:output method="xml"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:template match="*[name()='head']" priority="1.0">
    <head>
      <xsl:apply-templates select="@*"/>
      <xsl:call-template name="additional-header"/>
      <xsl:apply-templates select="node()"/>
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
    <xsl:element name="{name(.)}" namespace="{namespace-uri(.)}">
      <xsl:apply-templates select="@*[not(name(.)='xmlns:*')]"/>
      <xsl:apply-templates select="node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
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
