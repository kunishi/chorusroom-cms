<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-relax.xsl,v 1.1 2000/12/22 11:38:37 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:template match="characters">
    <xsl:element name="module">
      <xsl:attribute name="moduleVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="relaxCoreVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="xmlns">
	<xsl:text>http://www.xml.gr.jp/xmlns/relaxCore</xsl:text>
      </xsl:attribute>
      <xsl:element name="interface"/>
      <xsl:element name="hedgeRule">
	<xsl:attribute name="name">
	  <xsl:text>character</xsl:text>
	</xsl:attribute>
	<xsl:apply-templates select="character"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="character">
    <xsl:element name="ref">
      <xsl:attribute name="label">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
