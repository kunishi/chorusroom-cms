<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: character.xsl,v 1.3 2001/02/04 02:04:47 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:char="http://www.chorusroom.org/character">

  <xsl:variable name="all-chars"
		select="document('../tech/all-chars-extracted.xml')/*/char:character"/>

  <xsl:template match="char:utf8-char">
    <xsl:variable name="nickname" select="@nickname"/>
    <xsl:choose>
      <xsl:when test="$output-encoding='utf-8'">
	<xsl:choose>
	  <xsl:when test="not(@nickname)">
	    <xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	    <xsl:value-of select="@codepoint"/>
	    <xsl:text>;</xsl:text>
	  </xsl:when>
	  <xsl:when test="@nickname='none'">
	    <xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	    <xsl:value-of select="@codepoint"/>
	    <xsl:text>;</xsl:text>
	  </xsl:when>
	  <xsl:when test="not(@nickname='none')">
	    <xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	    <xsl:value-of select="$all-chars[./@nickname=$nickname]/@utf8-codepoint"/>
	    <xsl:text>;</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:apply-templates/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
