<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-utf8-char-conv.xsl,v 1.3 2000/12/24 03:03:36 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cr="http://www.chorusroom.org/chars">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:template match="cr:characters">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="xmlns">
	<xsl:text>http://www.w3.org/1999/xhtml</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates select="cr:character"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cr:character">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">
	<xsl:value-of select="@cr:nickname"/>
      </xsl:attribute>
      <xsl:element name="xsl:text">
	<xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	<xsl:value-of select="@cr:utf8-encoding"/>
	<xsl:text>;</xsl:text>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
