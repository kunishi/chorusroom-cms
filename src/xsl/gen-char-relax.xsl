<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-relax.xsl,v 1.5 2001/01/03 05:20:26 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.xml.gr.jp/xmlns/relaxCore"
		exclude-result-prefixes="cr">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:variable name="char-list" xmlns:xlink="http://www.w3.org/1999/xlink" select="document(//cr:char-set/@xlink:href)/cr:characters/cr:character"/>

  <xsl:template match="/">
    <module moduleVersion="1.0" relaxCoreVersion="1.0" targetNamespace="http://www.chorusroom.org/character">
      <interface/>
      <hedgeRule label="character">
	<choice occurs="?">
	  <xsl:for-each select="$char-list">
	    <ref>
	      <xsl:attribute name="label">
		<xsl:value-of select="@nickname"/>
	      </xsl:attribute>
	    </ref>
	  </xsl:for-each>
	</choice>
      </hedgeRule>
      <xsl:apply-templates select="$char-list"/>
    </module>
  </xsl:template>

  <xsl:template match="cr:char-set"/>

  <xsl:template match="cr:characters">
    <xsl:apply-templates select="cr:character"/>
  </xsl:template>

  <xsl:template match="cr:character">
    <tag>
      <xsl:attribute name="name">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
    </tag>
    <elementRule>
      <xsl:attribute name="role">
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
      <xsl:element name="empty"/>
    </elementRule>
  </xsl:template>

</xsl:stylesheet>
