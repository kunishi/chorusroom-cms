<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-conv-utf8.xsl,v 1.1 2001/01/03 05:20:26 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml">

  <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:template match="cr:all-characters">
    <axsl:stylesheet>
      <xsl:apply-templates/>
    </axsl:stylesheet>
  </xsl:template>

  <xsl:template match="cr:char-set">
    <xsl:apply-templates xmlns:xlink="http://www.w3.org/1999/xlink"
			 select="document(@xlink:href)/cr:characters"/>
  </xsl:template>

  <xsl:template match="cr:characters">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:character">
    <axsl:template>
      <xsl:attribute name="match">
	<xsl:text>cr:</xsl:text>
	<xsl:value-of select="@nickname"/>
      </xsl:attribute>
      <axsl:text>
	<xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	<xsl:value-of select="@utf8-codepoint"/>
	<xsl:text>;</xsl:text>
      </axsl:text>
    </axsl:template>
  </xsl:template>
</xsl:stylesheet>
