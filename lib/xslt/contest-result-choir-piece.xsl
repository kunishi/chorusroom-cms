<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result-choir-piece.xsl,v 1.10 2002/06/18 15:22:14 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:cr="http://www.chorusroom.org/character">

  <xsl:template match="p:piece">
    <xsl:param name="piece-top" select="."/>
    <xsl:param name="with-paren">false</xsl:param>
    <xsl:param name="inside-piece">false</xsl:param>
    <xsl:if test="$inside-piece='false'">
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="$piece-top"/>
      </xsl:call-template>
      <xsl:choose>
	<xsl:when test="$piece-top/p:title/p:titlePrefix | $piece-top/p:title/p:titleSuffix">
	  <xsl:apply-templates select="$piece-top/p:title[@original='true']">
	    <xsl:with-param name="with-paren">true</xsl:with-param>
	  </xsl:apply-templates>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="$piece-top/p:title[@original='true']">
	    <xsl:with-param name="with-paren" select="$with-paren"/>
	  </xsl:apply-templates>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="$piece-top/p:title[@original='false' and @xml:lang='ja']"/>
    </xsl:if>
    <xsl:if test="$inside-piece='true'">
      <xsl:apply-templates select="p:title[@original='true']">
	<xsl:with-param name="with-paren">false</xsl:with-param>
      </xsl:apply-templates>
      <xsl:apply-templates select="$piece-top/p:title[@original='false' and @xml:lang='ja']"/>
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="$piece-top"/>
	<xsl:with-param name="with-paren">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="p:piece-note"/>
  </xsl:template>

  <xsl:template match="p:suite">
    <xsl:param name="piece-top" select="."/>
    <xsl:param name="with-paren">true</xsl:param>
    <xsl:param name="inside-piece">false</xsl:param>
    <xsl:if test="$inside-piece='false'">
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="$piece-top"/>
      </xsl:call-template>
      <xsl:choose>
	<xsl:when test="p:title/p:titlePrefix | p:title/p:titleSuffix">
	  <xsl:apply-templates select="p:title[@original='true']">
	    <xsl:with-param name="with-paren">true</xsl:with-param>
	  </xsl:apply-templates>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="p:title[@original='true']">
	    <xsl:with-param name="with-paren" select="$with-paren"/>
	  </xsl:apply-templates>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="p:title[@original='false' and @xml:lang='ja']"/>
      <xsl:text>から </xsl:text>
      <xsl:apply-templates select="p:suite-piece"/>
    </xsl:if>
    <xsl:if test="$inside-piece='true'">
      <xsl:apply-templates select="p:title[@original='true']">
	<xsl:with-param name="with-paren">false</xsl:with-param>
      </xsl:apply-templates>
      <xsl:apply-templates select="p:title[@original='false' and @xml:lang='ja']"/>
      <xsl:apply-templates select="p:suite-piece"/>
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="$piece-top"/>
	<xsl:with-param name="with-paren">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="p:piece-note"/>
  </xsl:template>

  <xsl:template name="contest-result-choir-piece">
    <xsl:param name="piece-top" select="."/>
    <xsl:param name="with-paren">false</xsl:param>
    <xsl:for-each select="$piece-top/*[self::p:originated-from or self::p:words-by or self::p:translated-by or self::p:composed-by or self::p:arranged-by]">
      <xsl:if test="$with-paren='true' and position()=1">
	<xsl:text> (</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="current()"/>
      <xsl:if test="not(position()=last())">
	<xsl:text>・</xsl:text>
      </xsl:if>
      <xsl:if test="position()=last() and $with-paren='false'">
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:if test="position()=last() and $with-paren='true'">
	<xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:for-each>
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

  <xsl:template match="p:title">
    <xsl:param name="with-paren">false</xsl:param>
    <xsl:if test="@original='false'">
      <xsl:text> (</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="p:titlePrefix"/>
    <xsl:apply-templates select="p:mainTitle">
      <xsl:with-param name="with-paren" select="$with-paren"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="p:titleSuffix"/>
    <xsl:if test="@original='false'">
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p:titlePrefix">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="p:titleSuffix">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="p:mainTitle">
    <xsl:param name="with-paren">false</xsl:param>
    <xsl:if test="$with-paren='true'">
      <xsl:choose>
	<xsl:when test="../@xml:lang[.='ja']">
	  <xsl:text>「</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text> &quot;</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:if test="$with-paren='true'">
      <xsl:choose>
	<xsl:when test="../@xml:lang[.='ja']">
	  <xsl:text>」</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>&quot; </xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p:suite-piece">
    <xsl:if test="p:piece|p:suite">
      <xsl:choose>
	<xsl:when test="p:piece/p:title[@original='true' and @xml:lang='ja']">
	  <xsl:text>「</xsl:text>
	</xsl:when>
        <xsl:when test="p:suite">
        </xsl:when>
	<xsl:otherwise>
	  <xsl:text>&quot;</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:apply-templates select="p:piece-number"/>
    <xsl:apply-templates select="p:piece|p:suite">
      <xsl:with-param name="with-paren">false</xsl:with-param>
      <xsl:with-param name="inside-piece">true</xsl:with-param>
    </xsl:apply-templates>
    <xsl:if test="p:piece|p:suite">
      <xsl:choose>
	<xsl:when test="p:piece/p:title[@original='true' and @xml:lang='ja']">
	  <xsl:text>」</xsl:text>
	</xsl:when>
        <xsl:when test="p:suite">
        </xsl:when>
	<xsl:otherwise>
	  <xsl:text>&quot; </xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p:piece-number">
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="p:piece-note">
    <xsl:text> (</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

</xsl:stylesheet>
