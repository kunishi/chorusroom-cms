<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-ascii-char-conv.xsl,v 1.2 2000/12/22 08:04:24 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.chorusroom.org/chars">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:template match="characters">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="xmlns">
	<xsl:text>http://www.w3.org/1999/xhtml</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates select="character"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="character">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
      <xsl:element name="xsl:text">
	<xsl:value-of select="@alternative"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
