<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: character.xsl,v 1.1 2001/01/03 05:20:25 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:char="http://www.chorusroom.org/character">

  <xsl:param name="output-encoding">utf-8</xsl:param>

  <xsl:template match="char:utf8-char">
    <xsl:choose>
      <xsl:when test="$output-encoding='utf-8'">
        <xsl:value-of select="@codepoint"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@alternative"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>