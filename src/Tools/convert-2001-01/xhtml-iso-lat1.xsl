<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns:char="http://www.chorusroom.org/character"
		extension-element-prefixes="xt">

    <xsl:output method="text"/>

    <xsl:template match="char:characters">
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="char:character">
      <xsl:text disable-output-escaping="yes">&lt;!ENTITY </xsl:text>
      <xsl:value-of select="@nickname"/>
      <xsl:text disable-output-escaping="yes"> &quot;&amp;#60;cr:</xsl:text>
      <xsl:value-of select="@nickname"/>
      <xsl:text disable-output-escaping="yes">/&amp;#62;&quot;&gt;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
