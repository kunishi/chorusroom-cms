<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result-choir-piece.xsl,v 1.4 2001/01/09 16:36:41 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character">

  <xsl:template name="contest-result-choir-piece">
    <xsl:param name="piece-top" select="."/>
    <xsl:for-each select="$piece-top/*[self::p:originated-from or self::p:words-by or self::p:translated-by or self::p:composed-by or self::p:arranged-by]">
      <xsl:apply-templates select="current()"/>
      <xsl:choose>
	<xsl:when test="position()=last()">
	  <xsl:text>: </xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>・</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:apply-templates select="$piece-top/p:piece"/>
    <xsl:apply-templates select="$piece-top/p:suite"/>
  </xsl:template>

  <xsl:template match="p:originated-from">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="p:words-by">
    <xsl:apply-templates/>
    <xsl:if test="@kind">
      <xsl:value-of select="@kind"/>
    </xsl:if>
    <xsl:if test="not(@kind)">
      <xsl:text>作詩</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="p:translated-by">
    <xsl:apply-templates/>
    <xsl:text>訳詩</xsl:text>
  </xsl:template>
  <xsl:template match="p:composed-by">
    <xsl:apply-templates/>
    <xsl:text>作曲</xsl:text>
  </xsl:template>
  <xsl:template match="p:arranged-by">
    <xsl:apply-templates/>
    <xsl:text>編曲</xsl:text>
  </xsl:template>

  <xsl:template match="p:piece">
    <xsl:apply-templates/>
    <xsl:if test="@japaneseTitle">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@japaneseTitle"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p:suite">
    <xsl:apply-templates select="p:piece"/>
    <xsl:text>から </xsl:text>
    <xsl:apply-templates select="p:suite-piece"/>
  </xsl:template>

  <xsl:template match="p:suite-piece">
    <xsl:if test="not(p:suite-piece)">
      <xsl:text>「</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="p:piece-number"/>
    <xsl:apply-templates select="p:piece"/>
    <xsl:if test="p:originated-from or p:words-by or p:translated-by or p:composed-by">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates select="p:originated-from"/>
      <xsl:apply-templates select="p:words-by"/>
      <xsl:apply-templates select="p:translated-by"/>
      <xsl:apply-templates select="p:composed-by"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="p:suite-piece">
      <xsl:apply-templates select="p:suite-piece" />
    </xsl:if>
    <xsl:if test="not(p:suite-piece)">
      <xsl:text>」</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p:piece-number">
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>

</xsl:stylesheet>
