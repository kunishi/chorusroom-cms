<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-relax.xsl,v 1.3 2000/12/24 01:40:10 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
  xmlns:cr="http://www.chorusroom.org/chars"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.xml.gr.jp/xmlns/relaxCore">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:template match="/">
    <xsl:element name="module">
      <xsl:attribute name="moduleVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="relaxCoreVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:element name="interface"/>
      <xsl:element name="hedgeRule">
	<xsl:attribute name="name">
	  <xsl:text>character</xsl:text>
	</xsl:attribute>
	<xsl:element name="choice">
	  <xsl:attribute name="occurs">
	    <xsl:text>?</xsl:text>
	  </xsl:attribute>
	  <xsl:apply-templates select="//cr:char-set"/>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cr:char-set">
    <xsl:apply-templates xmlns:xlink="http://www.w3.org/1999/xlink"
			 select="document(string(./@xlink:href))/characters"/>
  </xsl:template>

  <xsl:template match="characters">
    <xsl:apply-templates select="character"/>
  </xsl:template>

  <xsl:template match="character">
    <xsl:element name="ref">
      <xsl:attribute name="label">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
