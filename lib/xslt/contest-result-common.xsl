<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result-common.xsl,v 1.1 2001/01/03 05:20:25 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="cr p char">

  <xsl:import href="common.xsl"/>

  <xsl:param name="output-encoding"/>
  <xsl:param name="output-base">index</xsl:param>
  <xsl:param name="suffix"/>

<!--    <xsl:include href="character.xsl"/> -->
<!--    <xsl:include href="contest-result-choir-piece.xsl"/> -->
<!--    <xsl:include href="dummy-char-conv.xsl"/> -->

  <xsl:output method="xml"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      omit-xml-declaration="no"/>

  <xsl:template match="/">
    <xsl:variable name="top" select="cr:competition"/>
    <xsl:apply-templates select="cr:competition/cr:result[@output=$output-base]">
      <xsl:with-param name="top" select="$top"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="cr:result">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="result-top" select="."/>
    <redirect:write file="{concat(@output, $suffix)}">
      <xsl:call-template name="main">
	<xsl:with-param name="top" select="$top"/>
      </xsl:call-template>
    </redirect:write>
    <xsl:if test=".//cr:scores">
      <redirect:write file="{concat(@output, '-saiten', $suffix)}">
        <xsl:call-template name="saiten">
	  <xsl:with-param name="top" select="$top"/>
	  <xsl:with-param name="result-top" select="$result-top"/>
	</xsl:call-template>
      </redirect:write>
    </xsl:if>
  </xsl:template>

  <xsl:template name="main">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="competition-name"
		  select="$top/cr:competition-name"/>
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
	<xsl:apply-templates select="cr:notices"/>
	<xsl:call-template name="score-page-link"/>
        <hr/>
	<xsl:apply-templates select="cr:section">
	  <xsl:with-param name="top" select="$top"/>
	</xsl:apply-templates>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="additional-footer">
    <p>
      <xsl:value-of select="/cr:competition/cr:cvs-id"/>
    </p>
  </xsl:template>

  <xsl:template name="encodinglink">
    <p>
      <xsl:if test="$suffix=$utfhtmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@output, $htmlsuffix)" />
	  </xsl:attribute>
	  <xsl:text>EUC-JP$B%Z!<%8(B</xsl:text>
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
      <xsl:choose>
        <xsl:when test="@anonymous='true'">
          <xsl:text>$BF?L>4uK>(B</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="cr:reporter-name"/>
          <xsl:apply-templates select="cr:reporter-email"/>
        </xsl:otherwise>
      </xsl:choose>
    </dd>
  </xsl:template>

  <xsl:template match="cr:reporter-name">
    <xsl:choose>
      <xsl:when test="@penname">
	<xsl:value-of select="@penname"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cr:reporter-email">
    <xsl:if test="not(@anonymous='true')">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="score-page-link">
    <xsl:if test=".//cr:scores">
      <ul>
	<li>
	  <p>
	    <xsl:text>$B:NE@I=$r(B</xsl:text>
	    <a>
	      <xsl:attribute name="href">
		<xsl:value-of select="concat(@output, '-saiten', $suffix)"/>
	      </xsl:attribute>
	      <xsl:text>$BJL%Z!<%8(B</xsl:text>
	    </a>
	    <xsl:text>$B$K$^$H$a$F$"$j$^$9!#(B</xsl:text>
	  </p>
	</li>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="cr:notices">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="cr:notice">
    <li>
      <p>
	<xsl:value-of select="."/>
      </p>
    </li>
  </xsl:template>

  <xsl:template match="cr:section">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="seed-choir-list"
		  select="cr:choir[cr:prize/@nickname='seed']"/>
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
      <h3>$B%7!<%ICDBN(B</h3>
      <ul>
        <xsl:for-each select="$seed-choir-list">
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$gold-choir-list">
      <h3>$B6b>^(B</h3>
      <ul>
        <xsl:for-each select="$gold-choir-list">
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$silver-choir-list">
      <h3>$B6d>^(B</h3>
      <ul>
        <xsl:for-each select="$silver-choir-list">
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$blonze-choir-list">
      <h3>$BF<>^(B</h3>
      <ul>
        <xsl:for-each select="$blonze-choir-list">
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$other-choir-list">
      <h3>$B$=$N$[$+(B</h3>
      <ul>
        <xsl:for-each select="$other-choir-list">
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
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
    <xsl:param name="top" select="/"/>
    <xsl:call-template name="choir-attr-list"/>
    <xsl:apply-templates select="cr:choir-name"/>
    <xsl:call-template name="choir-data">
      <xsl:with-param name="top" select="$top"/>
    </xsl:call-template>
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
    <xsl:param name="top" select="/"/>
    <xsl:variable name="choir-pref" select="cr:prefecture"/>
    <xsl:variable name="choir-member"
		  select="child::*[self::cr:choir-type or self::cr:number-of-members]"/>
    <xsl:variable name="player-data"
		  select="child::*[self::cr:conductor or self::cr:piano or self::cr:accompaniment]"/>
    <xsl:choose>
      <xsl:when test="$top/cr:competition-name/@pref[.='true']">
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
      <xsl:when test="$top/cr:competition-name/@pref[.='false']">
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
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="cr:program">
    <ul>
      <xsl:apply-templates select="cr:given-program"/>
      <xsl:apply-templates select="cr:free-program"/>
    </ul>
  </xsl:template>

  <xsl:template match="cr:given-program"/>

  <xsl:template match="cr:free-program">
    <li>
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="."/>
      </xsl:call-template>
    </li>
  </xsl:template>

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

  <xsl:template name="saiten">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <xsl:variable name="competition-name"
		  select="$top/cr:competition-name"/>
    <html xml:lang="ja" lang="ja">
      <head>
	<xsl:call-template name="additional-header"/>
	<title>
	  <xsl:value-of select="$competition-name"/>
	  <xsl:text>: $B:NE@I=(B</xsl:text>
	</title>
      </head>
      <body>
	<h1>
	  <xsl:value-of select="$competition-name"/>
	  <xsl:text>: $B:NE@I=(B</xsl:text>
	</h1>
	<xsl:call-template name="all-score-tables">
	  <xsl:with-param name="top" select="$top"/>
	  <xsl:with-param name="result-top" select="$result-top"/>
	</xsl:call-template>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="all-score-tables">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <xsl:for-each select="cr:section">
      <xsl:if test=".//cr:scores">
	<h2>
	  <xsl:value-of select="cr:section-name"/>
	</h2>
	<xsl:call-template name="score-table">
	  <xsl:with-param name="top" select="$top"/>
	  <xsl:with-param name="result-top" select="$result-top"/>
	</xsl:call-template>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="score-table">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <table class="ajclresult" border="1">
      <xsl:call-template name="score-table-header">
	<xsl:with-param name="top" select="$top"/>
	<xsl:with-param name="result-top" select="$result-top"/>
      </xsl:call-template>
      <xsl:call-template name="score-table-body">
	<xsl:with-param name="top" select="$top"/>
	<xsl:with-param name="result-top" select="$result-top"/>
      </xsl:call-template>
    </table>
  </xsl:template>

  <xsl:template name="score-table-header">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <thead>
      <tr>
	<th rowspan="1" colspan="1"/>
	<xsl:for-each select="$result-top/cr:referee">
	  <th rowspan="1" colspan="1">
	    <xsl:value-of select="@shortname"/>
	  </th>
	</xsl:for-each>
	<th rowspan="1" colspan="1">
	  <xsl:text>$BAm9gI>2A(B</xsl:text>
	</th>
	<th rowspan="1" colspan="1">
	  <xsl:text>$BHw9M(B</xsl:text>
	</th>
      </tr>
    </thead>
  </xsl:template>

  <xsl:template name="score-table-body">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <tbody>
      <xsl:for-each select="cr:choir">
	<xsl:sort order="ascending" data-type="number" select="@playing-order"/>
	<xsl:call-template name="score-table-entry">
	  <xsl:with-param name="current-choir" select="."/>
	  <xsl:with-param name="result-top" select="$result-top"/>
	</xsl:call-template>
      </xsl:for-each>
    </tbody>
  </xsl:template>

  <xsl:template name="score-table-entry">
    <xsl:param name="current-choir" select="."/>
    <xsl:param name="result-top"/>
    <xsl:variable name="current-entry" select="$current-choir/cr:scores"/>
    <tr>
      <xsl:choose>
	<xsl:when test="$current-choir/cr:prize[@nickname='gold']"> 
	  <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
	</xsl:when>
	<xsl:when test="$current-choir/cr:prize[@nickname='silver']">
	  <xsl:attribute name="bgcolor">silver</xsl:attribute>
	</xsl:when>
	<xsl:when test="$current-choir/cr:prize[@nickname='blonze']">
	  <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <td rowspan="1" colspan="1">
	<xsl:if test="$current-choir/@playing-order">
	  <xsl:value-of select="$current-choir/@playing-order"/>
	  <xsl:text>. </xsl:text>
	</xsl:if>
	<xsl:value-of select="$current-choir/cr:choir-name"/>
      </td>
      <xsl:for-each select="$result-top/cr:referee">
	<xsl:apply-templates select="$current-entry/cr:score[@referee=current()/@shortname]"/>
      </xsl:for-each>
      <xsl:apply-templates select="$current-entry/cr:total-score"/>
      <xsl:apply-templates select="$current-entry/cr:score-note">
	<xsl:with-param name="current-choir" select="$current-choir"/>
      </xsl:apply-templates>
    </tr>
  </xsl:template>

  <xsl:template match="cr:score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:value-of select="."/>
    </td>
  </xsl:template>

  <xsl:template match="cr:total-score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:value-of select="."/>
    </td>
  </xsl:template>

  <xsl:template match="cr:score-note">
    <xsl:param name="current-choir"/>
    <td rowspan="1" colspan="1">
      <xsl:value-of select="$current-choir/cr:prize"/>
      <xsl:call-template name="choir-attr-saiten-list">
	<xsl:with-param name="current-choir" select="$current-choir"/>
      </xsl:call-template>
      <xsl:if test="$current-choir/cr:specia-prize">
	<xsl:for-each select="$current-choir/cr:special-prize">
	  <xsl:value-of select="current()"/>
	  <xsl:if test="not(current()=last())">
	    <xsl:text>$B!"(B</xsl:text>
	  </xsl:if>
	</xsl:for-each>
      </xsl:if>
      <xsl:if test="not(.='')">
	<xsl:value-of select="."/>
      </xsl:if>
    </td>
  </xsl:template>
  <xsl:template name="choir-attr-saiten-list">
    <xsl:param name="current-choir" select="."/>
  </xsl:template>

</xsl:stylesheet>