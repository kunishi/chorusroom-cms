<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:char="http://www.chorusroom.org/character">

  <xsl:output method="xml"
	      indent="yes"/>

  <xsl:template match="char:all-characters">
    <char:characters>
      <xsl:apply-templates select="char:char-set"/>
    </char:characters>
  </xsl:template>

  <xsl:template match="char:char-set">
    <xsl:apply-templates select="document(./@xlink:href)/*/char:character"/>
  </xsl:template>

  <xsl:template match="char:character">
    <char:character>
      <xsl:apply-templates select="@*"/>
    </char:character>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:attribute name="{name(.)}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
