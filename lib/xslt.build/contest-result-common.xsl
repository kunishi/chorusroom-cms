<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result-common.xsl,v 1.1 2002/06/18 15:22:16 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.lib.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="cr p char">

  <xsl:import href="common-release.xsl"/>

  <xsl:param name="output-base">index</xsl:param>
  <xsl:param name="with-score">true</xsl:param>

  <xsl:include href="contest-resutl-choir-piece.xsl"/>
  <xsl:include href="character.xsl"/>

  <xsl:output method="xml"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      omit-xml-declaration="no"/>

  <xsl:template match="/">
    <xsl:apply-templates select="cr:competition/cr:result"/>
  </xsl:template>

  <xsl:template match="cr:result">
    <xsl:variable name="competition-name"
      select="/cr:competiton/cr:competition-name"/>
    <html lang="ja" xml:lang="ja">
      <head>
        <xsl:call-template name="additional-header"/>
	<title>
	  <xsl:value-of select="$competition-name"/>
	</title>
      </head>
      <body>
        <xsl:call-template name="encodinglink"/>
        <h1>
	  <xsl:value-of select="$competition-name"/>
	</h1>
        <hr/>
	<dl>
	  <xsl:call-template name="date-list"/>
	  <xsl:apply-templates select="cr:hall"/>
	  <xsl:call-template name="referee-list"/>
	  <xsl:call-template name="reporter-list"/>
	</dl>
        <xsl:if test="cr:notices|cr:scoreTableRef">
          <ul>
            <xsl:apply-templates select="cr:notices"/>
            <xsl:apply-templates select="cr:scoreTableRef"/>
          </ul>
        </xsl:if>
        <hr/>
        <xsl:apply-templates select="cr:section"/>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="additional-footer"/>

  <xsl:template name="encodinglink">
    <p>
      <xsl:if test="$suffix=$utfhtmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@output, $htmlsuffix)" />
	  </xsl:attribute>
	  <xsl:text>ISO-2022-JP$B%Z!<%8(B</xsl:text>
	</a>
      </xsl:if>
      <xsl:if test="$suffix=$htmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@output, $utfhtmlsuffix)"/>
	  </xsl:attribute>
	  <xsl:text>UTF-8$B%Z!<%8(B</xsl:text>
	</a>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="date-list">
    <xsl:if test="cr:date">
      <dt>$B3+:EF|(B</dt>
      <xsl:for-each select="cr:date">
	<dd>
	  <xsl:apply-templates select="."/>
	</dd>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template match="cr:date">
    <xsl:value-of select="."/>
    <xsl:text>(</xsl:text>
    <xsl:choose>
      <xsl:when test="@day-of-week='sun'">
	<xsl:text>$BF|(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='mon'">
	<xsl:text>$B7n(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='tue'">
	<xsl:text>$B2P(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='wed'">
	<xsl:text>$B?e(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='thu'">
	<xsl:text>$BLZ(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='fri'">
	<xsl:text>$B6b(B</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='sat'">
	<xsl:text>$BEZ(B</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@day-of-week"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@holiday='true'">
      <xsl:text>$B!&=K(B</xsl:text>
    </xsl:if>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="cr:hall">
    <dt>$B3+:E>l=j(B</dt>
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template name="referee-list">
    <xsl:if test="cr:referee">
      <dt>$B?3::0w(B</dt>
      <xsl:for-each select="cr:referee">
	<dd>
	  <xsl:apply-templates select="."/>
	</dd>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cr:referee">
    <xsl:apply-templates/>
    <xsl:if test="./@job or ./@referred-date or ./@country">
      <xsl:text>(</xsl:text>
      <xsl:if test="@job">
	<xsl:value-of select="@job"/>
	<xsl:if test="@referred-date or @country">
	  <xsl:text>$B!"(B</xsl:text>
	</xsl:if>
      </xsl:if>
      <xsl:if test="@referred-date">
	<xsl:value-of select="@referred-date"/>
	<xsl:if test="@country">
	  <xsl:text>$B!"(B</xsl:text>
	</xsl:if>
      </xsl:if>
      <xsl:value-of select="@country"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="reporter-list">
    <dt>$BJs9p<T(B</dt>
    <xsl:apply-templates select="cr:reporter"/>
  </xsl:template>

  <xsl:template match="cr:reporter">
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template match="cr:reporter-name">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:reporter-email">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template name="cr:scoreTableRef">
    <li>
      <p>
        <xsl:text>$B:NE@I=$r(B</xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
          </xsl:attribute>
          <xsl:text>$BJL%Z!<%8(B</xsl:text>
        </a>
        <xsl:text>$B$K$^$H$a$F$"$j$^$9!#(B</xsl:text>
      </p>
    </li>
  </xsl:template>

  <xsl:template match="cr:notices">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:notice">
    <li>
      <p><xsl:apply-templates/></p>
    </li>
  </xsl:template>

  <xsl:template match="cr:section">
    <xsl:variable name="seed-choir-list"
		  select="cr:choir[cr:prize/@nickname='seeded']"/>
    <xsl:variable name="gold-choir-list"
		  select="cr:choir[cr:prize/@nickname='gold']"/>
    <xsl:variable name="silver-choir-list"
		  select="cr:choir[cr:prize/@nickname='silver']"/>
    <xsl:variable name="blonze-choir-list"
		  select="cr:choir[cr:prize/@nickname='blonze']"/>
    <xsl:variable name="other-choir-list"
		  select="cr:choir[cr:prize/@nickname='none']"/>
    <xsl:apply-templates select="cr:section-name"/>
    <xsl:if test="$seed-choir-list">
      <xsl:call-template name="choir-list">
        <xsl:with-param name="list">
          <xsl:value-of select="$seed-choir-list"/>
        </xsl:with-param>
        <xsl:with-param name="title">$B%7!<%ICDBN(B</xsl:with-param>
        <xsl:with-param name="kind">$B%7!<%I(B</xsl:with-param>
        <xsl:with-param name="with-title-p">
          <xsl:value-of select="true()"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$gold-choir-list">
      <xsl:call-template name="choir-list">
        <xsl:with-param name="list">
          <xsl:value-of select="$gold-choir-list"/>
        </xsl:with-param>
        <xsl:with-param name="title">$B6b>^(B</xsl:with-param>
        <xsl:with-param name="kind">$B6b>^(B</xsl:with-param>
        <xsl:with-param name="with-title-p">
          <xsl:value-of select="true()"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$silver-choir-list">
      <xsl:call-template name="choir-list">
        <xsl:with-param name="list">
          <xsl:value-of select="$silver-choir-list"/>
        </xsl:with-param>
        <xsl:with-param name="title">$B6d>^(B</xsl:with-param>
        <xsl:with-param name="kind">$B6d>^(B</xsl:with-param>
        <xsl:with-param name="with-title-p">
          <xsl:value-of select="true()"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$blonze-choir-list">
      <xsl:call-template name="choir-list">
        <xsl:with-param name="list">
          <xsl:value-of select="$blonze-choir-list"/>
        </xsl:with-param>
        <xsl:with-param name="title">$BF<>^(B</xsl:with-param>
        <xsl:with-param name="kind">$BF<>^(B</xsl:with-param>
        <xsl:with-param name="with-title-p">
          <xsl:value-of select="true()"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$other-choir-list">
      <xsl:call-template name="choir-list">
        <xsl:with-param name="list">
          <xsl:value-of select="$other-choir-list"/>
        </xsl:with-param>
        <xsl:with-param name="title">$B$=$N$[$+(B</xsl:with-param>
        <xsl:with-param name="kind"/>
        <xsl:with-param name="with-title-p">
          <xsl:value-of select="$seed-choir-list
                                or $gold-choir-list
                                or $silver-choir-list
                                or $blonze-choir-list"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="choir-list">
    <xsl:param name="list"/>
    <xsl:param name="title"/>
    <xsl:param name="kind"/>
    <xsl:param name="with-title-p"><xsl:value-of select="true()"/></xsl:param>
    <xsl:if test="$with-title-p=true()">
      <h3><xsl:value-of select="$title"/></h3>
    </xsl:if>
    <ul>
      <xsl:for-each select="$list">
        <xsl:if test="not(cr:prize/text()=$kind)">
          <xsl:message>
            <xsl:text>Prize mismatch at </xsl:text>
            <xsl:value-of select="cr:choir-name"/>
          </xsl:message>
        </xsl:if>
        <li>
          <xsl:apply-templates/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="cr:section-name">
    <h2>
      <xsl:value-of select="."/>
      <xsl:if test="@date">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@date"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </h2>
  </xsl:template>

  <xsl:template match="cr:choir">
    <xsl:call-template name="choir-attr-list"/>
    <xsl:apply-templates select="cr:choir-name"/>
    <xsl:call-template name="choir-data"/>
    <xsl:call-template name="special-prize-list"/>
    <xsl:apply-templates select="cr:choir-note"/>
    <xsl:apply-templates select="cr:program"/>
  </xsl:template>

  <xsl:template name="choir-attr-list"/>

  <xsl:template match="cr:choir-name">
    <xsl:choose>
      <xsl:when test="@url">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="choir-data">
    <xsl:variable name="choir-pref" select="cr:prefecture"/>
    <xsl:variable name="choir-member"
		  select="child::*[self::cr:choir-type or self::cr:number-of-members or self::cr:number-of-parts]"/>
    <xsl:variable name="player-data"
		  select="child::*[self::cr:conductor or self::cr:piano or self::cr:accompaniment]"/>
    <xsl:choose>
      <xsl:when test="/cr:competition/cr:competition-name/@pref[.='true']">
	<xsl:if test="$choir-member or $player-data">
	  <xsl:text> (</xsl:text>
	  <xsl:call-template name="choir-data-1">
	    <xsl:with-param name="pref"/>
	    <xsl:with-param name="member" select="$choir-member"/>
	  </xsl:call-template>
	  <xsl:if test="$choir-member and $player-data">
	    <xsl:text>$B!"(B</xsl:text>
	  </xsl:if>
	  <xsl:call-template name="players-data"/>
	  <xsl:text>)</xsl:text>
	</xsl:if>
      </xsl:when>
      <xsl:when test="/cr:competition/cr:competition-name/@pref[.='false']">
	<xsl:if test="$choir-pref or $choir-member or $player-data">
	  <xsl:text> (</xsl:text>
	  <xsl:call-template name="choir-data-1">
	    <xsl:with-param name="pref" select="$choir-pref"/>
	    <xsl:with-param name="member" select="$choir-member"/>
	  </xsl:call-template>
	  <xsl:if test="($choir-pref or $choir-member) and $player-data">
	    <xsl:text>$B!"(B</xsl:text>
	  </xsl:if>
	  <xsl:call-template name="players-data"/>
	  <xsl:text>)</xsl:text>
	</xsl:if>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="choir-data-1">
    <xsl:param name="pref"/>
    <xsl:param name="member" select="''"/>
    <xsl:if test="$pref">
      <xsl:apply-templates select="$pref"/>
      <xsl:if test="$member">
	<xsl:text>$B!&(B</xsl:text>
      </xsl:if>
    </xsl:if>
    <xsl:for-each select="$member">
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="cr:prefecture">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:choir-type">
    <xsl:choose>
      <xsl:when test="current()='mixed'">
	<xsl:text>$B:.@<(B</xsl:text>
      </xsl:when>
      <xsl:when test="current()='male'">
	<xsl:text>$BCK@<(B</xsl:text>
      </xsl:when>
      <xsl:when test="current()='female'">
	<xsl:text>$B=w@<(B</xsl:text>
      </xsl:when>
      <xsl:when test="current()='children'">
	<xsl:text>$BF8@<(B</xsl:text>
      </xsl:when>
      <xsl:when test="current()='same-voice'">
	<xsl:text>$BF1@<(B</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cr:number-of-members">
    <xsl:value-of select="."/>
    <xsl:text>$BL>(B</xsl:text>
  </xsl:template>

  <xsl:template name="players-data">
    <xsl:call-template name="conductor-list"/>
    <xsl:if test="cr:conductor and (cr:piano or cr:accompaniment)">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
    <xsl:call-template name="piano-list"/>
    <xsl:if test="cr:piano and cr:accompaniment">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="cr:accompaniment"/>
  </xsl:template>

  <xsl:template name="conductor-list">
    <xsl:for-each select="cr:conductor">
      <xsl:if test="position()=1">
	<xsl:text>$B;X4x(B</xsl:text>
	<xsl:if test="@instrument">
	  <xsl:text>$B!&(B</xsl:text>
	  <xsl:value-of select="@instrument"/>
	</xsl:if>
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:apply-templates select="@grade"/>
      <xsl:if test="not(position()=last())">
	<xsl:text>$B!&(B</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="piano-list">
    <xsl:for-each select="cr:piano">
      <xsl:if test="position()=1">
	<xsl:text>$B%T%"%N(B: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:apply-templates select="@grade"/>
      <xsl:if test="not(position()=last())">
	<xsl:text>$B!&(B</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="cr:accompaniment">
    <xsl:value-of select="@instrument"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::cr:accompaniment">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="cr:prize">
  </xsl:template>

  <xsl:template name="special-prize-list">
    <xsl:if test="cr:special-prize">
      <xsl:text> [</xsl:text>
      <xsl:for-each select="cr:special-prize">
	<xsl:apply-templates/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>$B!"(B</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:text>]</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cr:special-prize">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:choir-note">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="cr:program">
    <ul>
      <xsl:apply-templates select="cr:given-program"/>
      <xsl:apply-templates select="cr:free-program"/>
    </ul>
  </xsl:template>

  <xsl:template match="cr:given-program|cr:free-program">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="cr:programNote">
    <xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>

</xsl:stylesheet>
