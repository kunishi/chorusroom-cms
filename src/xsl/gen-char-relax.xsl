<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-relax.xsl,v 1.4 2000/12/25 14:24:31 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
  xmlns:cr="http://www.chorusroom.org/xml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.xml.gr.jp/xmlns/relaxCore">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:variable name="char-list" xmlns:xlink="http://www.w3.org/1999/xlink" select="document(//cr:char-set/@xlink:href)/cr:characters/cr:character"/>

  <xsl:template match="/">
    <xsl:element name="module">
      <xsl:attribute name="moduleVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="relaxCoreVersion">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="targetNamespace">
	<xsl:text>http://www.chorusroom.org/character</xsl:text>
      </xsl:attribute>
      <xsl:element name="interface"/>
      <xsl:element name="hedgeRule">
	<xsl:attribute name="label">
	  <xsl:text>character</xsl:text>
	</xsl:attribute>
	<xsl:element name="choice">
	  <xsl:attribute name="occurs">
	    <xsl:text>?</xsl:text>
	  </xsl:attribute>
	  <xsl:for-each select="$char-list">
	    <xsl:element name="ref">
	      <xsl:attribute name="label">
		<xsl:value-of select="@nickname"/>
	      </xsl:attribute>
	    </xsl:element>
	  </xsl:for-each>
	</xsl:element>
      </xsl:element>
      <xsl:apply-templates select="$char-list"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="cr:char-set"/>

  <xsl:template match="cr:characters">
    <xsl:apply-templates select="cr:character"/>
  </xsl:template>

  <xsl:template match="cr:character">
    <xsl:element name="tag">
      <xsl:attribute name="name">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
    </xsl:element>
    <xsl:element name="elementRule">
      <xsl:attribute name="role">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
      <xsl:element name="empty"/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
