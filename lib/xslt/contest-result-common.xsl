<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result-common.xsl,v 1.14 2001/09/13 03:11:31 kunishi Exp $ -->
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

  <xsl:import href="common.xsl"/>

  <xsl:param name="output-base">index</xsl:param>
  <xsl:param name="with-score">true</xsl:param>

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
    <xsl:call-template name="main">
      <xsl:with-param name="top" select="$top"/>
    </xsl:call-template>
    <xsl:if test="cr:section/cr:choir/cr:scores">
      <redirect:open select="concat($docBaseURI, '/', @output, '-saiten', $suffix)"/>
      <redirect:write select="concat($docBaseURI, '/', @output, '-saiten', $suffix)">
        <xsl:call-template name="saiten">
	  <xsl:with-param name="top" select="$top"/>
	  <xsl:with-param name="result-top" select="$result-top"/>
	</xsl:call-template>
      </redirect:write>
      <redirect:close select="concat($docBaseURI, '/', @output, '-saiten', $suffix)"/>
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
	  <xsl:text>EUC-JPページ</xsl:text>
	</a>
      </xsl:if>
      <xsl:if test="$suffix=$htmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@output, $utfhtmlsuffix)"/>
	  </xsl:attribute>
	  <xsl:text>UTF-8ページ</xsl:text>
	</a>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="date-list">
    <xsl:if test="cr:date">
      <dt>開催日</dt>
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
	<xsl:text>日</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='mon'">
	<xsl:text>月</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='tue'">
	<xsl:text>火</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='wed'">
	<xsl:text>水</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='thu'">
	<xsl:text>木</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='fri'">
	<xsl:text>金</xsl:text>
      </xsl:when>
      <xsl:when test="@day-of-week='sat'">
	<xsl:text>土</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@day-of-week"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@holiday='true'">
      <xsl:text>・祝</xsl:text>
    </xsl:if>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="cr:hall">
    <dt>開催場所</dt>
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template name="referee-list">
    <xsl:if test="cr:referee">
      <dt>審査員</dt>
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
	  <xsl:text>、</xsl:text>
	</xsl:if>
      </xsl:if>
      <xsl:if test="@referred-date">
	<xsl:value-of select="@referred-date"/>
	<xsl:if test="@country">
	  <xsl:text>、</xsl:text>
	</xsl:if>
      </xsl:if>
      <xsl:value-of select="@country"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="reporter-list">
    <dt>報告者</dt>
    <xsl:apply-templates select="cr:reporter"/>
  </xsl:template>
  <xsl:template match="cr:reporter">
    <dd>
      <xsl:choose>
        <xsl:when test="@anonymous='true'">
          <xsl:text>匿名希望</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="cr:reporter-name"/>
          <!-- <xsl:apply-templates select="cr:reporter-email"/> -->
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
    <xsl:if test=".//cr:scores and $with-score='true'">
      <ul>
	<li>
	  <p>
	    <xsl:text>採点表を</xsl:text>
	    <a>
	      <xsl:attribute name="href">
		<xsl:value-of select="concat(@output, '-saiten', $suffix)"/>
	      </xsl:attribute>
	      <xsl:text>別ページ</xsl:text>
	    </a>
	    <xsl:text>にまとめてあります。</xsl:text>
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
      <h3>シード団体</h3>
      <ul>
        <xsl:for-each select="$seed-choir-list">
          <xsl:if test="not(cr:prize/text()='シード')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="cr:choir-name"/>.
            </xsl:message>
          </xsl:if>
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$gold-choir-list">
      <h3>金賞</h3>
      <ul>
        <xsl:for-each select="$gold-choir-list">
          <xsl:if test="not(cr:prize/text()='金賞')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="cr:choir-name"/>.
            </xsl:message>
          </xsl:if>
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$silver-choir-list">
      <h3>銀賞</h3>
      <ul>
        <xsl:for-each select="$silver-choir-list">
          <xsl:if test="not(cr:prize/text()='銀賞')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="cr:choir-name"/>.
            </xsl:message>
          </xsl:if>
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$blonze-choir-list">
      <h3>銅賞</h3>
      <ul>
        <xsl:for-each select="$blonze-choir-list">
          <xsl:if test="not(cr:prize/text()='銅賞')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="cr:choir-name"/>.
            </xsl:message>
          </xsl:if>
          <li>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$other-choir-list">
      <xsl:if test="$seed-choir-list or $gold-choir-list or $silver-choir-list or $blonze-choir-list">
	<h3>そのほか</h3>
      </xsl:if>
      <ul>
        <xsl:for-each select="$other-choir-list">
          <xsl:if test="cr:prize/text()">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="cr:choir-name"/>.
            </xsl:message>
          </xsl:if>
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
		  select="child::*[self::cr:choir-type or self::cr:number-of-members or self::cr:number-of-parts]"/>
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
	    <xsl:text>、</xsl:text>
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
	    <xsl:text>、</xsl:text>
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
	<xsl:text>・</xsl:text>
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
	<xsl:text>混声</xsl:text>
      </xsl:when>
      <xsl:when test="current()='male'">
	<xsl:text>男声</xsl:text>
      </xsl:when>
      <xsl:when test="current()='female'">
	<xsl:text>女声</xsl:text>
      </xsl:when>
      <xsl:when test="current()='children'">
	<xsl:text>童声</xsl:text>
      </xsl:when>
      <xsl:when test="current()='same-voice'">
	<xsl:text>同声</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cr:number-of-members">
    <xsl:value-of select="."/>
    <xsl:text>名</xsl:text>
  </xsl:template>

  <xsl:template name="players-data">
    <xsl:call-template name="conductor-list"/>
    <xsl:if test="cr:conductor and (cr:piano or cr:accompaniment)">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:call-template name="piano-list"/>
    <xsl:if test="cr:piano and cr:accompaniment">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="cr:accompaniment"/>
  </xsl:template>

  <xsl:template name="conductor-list">
    <xsl:for-each select="cr:conductor">
      <xsl:if test="position()=1">
	<xsl:text>指揮</xsl:text>
	<xsl:if test="@instrument">
	  <xsl:text>・</xsl:text>
	  <xsl:value-of select="@instrument"/>
	</xsl:if>
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:apply-templates select="@grade"/>
      <xsl:if test="not(position()=last())">
	<xsl:text>・</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="piano-list">
    <xsl:for-each select="cr:piano">
      <xsl:if test="position()=1">
	<xsl:text>ピアノ: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:apply-templates select="@grade"/>
      <xsl:if test="not(position()=last())">
	<xsl:text>・</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="cr:accompaniment">
    <xsl:value-of select="@instrument"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::cr:accompaniment">
      <xsl:text>、</xsl:text>
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
	  <xsl:text>、</xsl:text>
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
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="cr:programNote">
    <xsl:text> (</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
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
	  <xsl:text>: 採点表</xsl:text>
	</title>
      </head>
      <body>
	<h1>
	  <xsl:value-of select="$competition-name"/>
	  <xsl:text>: 採点表</xsl:text>
	</h1>
	<xsl:apply-templates select="cr:section[cr:choir/cr:scores]"
	  mode="score"/>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cr:section" mode="score">
    <xsl:apply-templates select="cr:section-name" mode="score"/>
    <table class="ajclresult" border="1">
      <thead>
	<tr>
	  <th rowspan="1" colspan="1"/>
	  <xsl:apply-templates select="../cr:referee" mode="score"/>
	  <th rowspan="1" colspan="1">
	    <xsl:text>総合評価</xsl:text>
	  </th>
	  <th rowspan="1" colspan="1">
	    <xsl:text>備考</xsl:text>
	  </th>
	</tr>
      </thead>
      <tbody>
	<xsl:apply-templates select="cr:choir" mode="score">
	  <xsl:sort order="ascending" data-type="number" select="@playing-order"/>
	</xsl:apply-templates>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="cr:section-name" mode="score">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>

  <xsl:template match="cr:referee" mode="score">
    <th rowspan="1" colspan="1">
      <xsl:value-of select="@shortname"/>
    </th>
  </xsl:template>

  <xsl:template match="cr:choir" mode="score">
    <tr>
      <xsl:choose>
	<xsl:when test="cr:prize[@nickname='gold']"> 
	  <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
	</xsl:when>
	<xsl:when test="cr:prize[@nickname='silver']">
	  <xsl:attribute name="bgcolor">silver</xsl:attribute>
	</xsl:when>
	<xsl:when test="cr:prize[@nickname='blonze']">
	  <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <td rowspan="1" colspan="1">
	<xsl:apply-templates select="@playing-order" mode="score"/>
	<xsl:apply-templates select="cr:choir-name"/>
      </td>
      <xsl:apply-templates select="cr:scores" mode="score"/>
    </tr>
  </xsl:template>

  <xsl:template match="@playing-order" mode="score">
    <xsl:value-of select="."/>
    <xsl:text>. </xsl:text>
  </xsl:template>

  <xsl:template match="cr:scores" mode="score">
    <!-- cr:result/cr:section/cr:choir/cr:scores, cr:result:cr:referee -->
    <xsl:variable name="current-node" select="."/>
    <xsl:for-each select="../../../cr:referee">
      <xsl:apply-templates select="$current-node/cr:score[@referee=current()/@shortname]"
	mode="score"/>
    </xsl:for-each>
    <xsl:apply-templates select="cr:total-score" mode="score"/>
    <xsl:apply-templates select="cr:score-note" mode="score"/>
  </xsl:template>

  <xsl:template match="cr:score" mode="score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <xsl:template match="cr:total-score" mode="score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <xsl:template match="cr:score-note" mode="score">
    <td rowspan="1" colspan="1">
      <xsl:for-each select="./node()[.!='']|../../cr:prize[.!='']|../../cr:special-prize|../../@representative[.='true']|../../@seed[.='true']">
	<xsl:apply-templates select="." mode="score"/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>、</xsl:text>
	</xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template match="cr:prize" mode="score">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="cr:special-prize" mode="score">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="@representative" mode="score">
    <xsl:if test=".='true'">
      <xsl:text>代表</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="@seed" mode="score">
    <xsl:if test=".='true'">
      <xsl:text>シード</xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
