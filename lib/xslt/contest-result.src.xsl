<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: contest-result.src.xsl,v 1.6 2002/12/01 16:46:29 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:c="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="c p">

  <xsl:import href="common.xsl"/>

  <xsl:param name="output-encoding"/>
  <xsl:param name='outDir'>.</xsl:param>
  <xsl:param name="with-score">true</xsl:param>
  <xsl:param name="suffix"/>

  <xsl:include href="contest-result-choir-piece.xsl"/>

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:variable name="top" select="c:competition"/>
    <xsl:apply-templates select="c:competition/c:result">
      <xsl:with-param name="top" select="$top"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="c:result">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="result-top" select="."/>
    <xsl:choose>
      <xsl:when test="c:section/c:choir/c:scores">
        <xsl:call-template name="saiten">
          <xsl:with-param name="top" select="$top"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="main">
          <xsl:with-param name="top" select="$top"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="main">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="competition-name"
		  select="$top/c:competition-name"/>
    <html lang="ja" xml:lang="ja">
      <head>
	<xsl:call-template name="additional-header"/>
	<title>
	  <xsl:value-of select="$competition-name"/>
	</title>
      </head>
      <body>
        <xsl:call-template name="body-header" />
        <h1>
	  <xsl:value-of select="$competition-name"/>
	</h1>
	<dl>
	  <xsl:call-template name="date-list"/>
	  <xsl:apply-templates select="c:hall"/>
	  <xsl:call-template name="referee-list"/>
	  <!-- 
	  <xsl:call-template name="reporter-list"/>
	  -->
	</dl>
	<xsl:apply-templates select="c:notices"/>
        <xsl:if test='c:scoreTableRef'>
          <xsl:apply-templates select='c:scoreTableRef'/>
        </xsl:if>
	<xsl:apply-templates select="c:section">
	  <xsl:with-param name="top" select="$top"/>
	</xsl:apply-templates>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="additional-footer">
  </xsl:template>

  <xsl:template name="date-list">
    <xsl:if test="c:date">
      <dt>開催日</dt>
      <xsl:for-each select="c:date">
	<dd>
	  <xsl:apply-templates select="."/>
	</dd>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template match="c:cvs-id"></xsl:template>

  <xsl:template match="c:date">
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

  <xsl:template match="c:hall">
    <dt>開催場所</dt>
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template name="referee-list">
    <xsl:if test="c:referee">
      <dt>審査員</dt>
      <xsl:for-each select="c:referee">
	<dd>
	  <xsl:apply-templates select="."/>
	</dd>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:referee">
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
    <xsl:apply-templates select="c:reporter"/>
  </xsl:template>
  <xsl:template match="c:reporter">
    <dd>
      <xsl:value-of select="."/>
    </dd>
  </xsl:template>

  <xsl:template match="c:notices">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="c:notice">
    <li>
      <p>
	<xsl:value-of select="."/>
      </p>
    </li>
  </xsl:template>

  <xsl:template match='c:scoreTableRef'>
    <p>
      <xsl:text>採点表を</xsl:text>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select='@href'/>
        </xsl:attribute>
        <xsl:text>別ページ</xsl:text>
      </a>
      <xsl:text>にまとめてあります。</xsl:text>
    </p>
  </xsl:template>

  <xsl:template match="c:section">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="seed-choir-list"
		  select="c:choir[c:prize/@nickname='seeded']"/>
    <xsl:variable name="gold-choir-list"
		  select="c:choir[c:prize/@nickname='gold']"/>
    <xsl:variable name="silver-choir-list"
		  select="c:choir[c:prize/@nickname='silver']"/>
    <xsl:variable name="blonze-choir-list"
		  select="c:choir[c:prize/@nickname='blonze']"/>
    <xsl:variable name="other-choir-list"
		  select="c:choir[c:prize/@nickname='none']"/>
    <xsl:apply-templates select="c:section-name"/>
    <xsl:if test="$seed-choir-list">
      <h3>シード団体</h3>
      <xsl:for-each select="$seed-choir-list">
        <xsl:if test="not(c:prize/text()='シード')">
          <xsl:message>
            Prize mismatch at <xsl:value-of select="c:choir-name"/>.
          </xsl:message>
        </xsl:if>
        <xsl:apply-templates select=".">
          <xsl:with-param name="top" select="$top"/>
        </xsl:apply-templates>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$gold-choir-list">
      <h3>金賞</h3>
      <xsl:for-each select="$gold-choir-list">
        <xsl:if test="not(c:prize/text()='金賞')">
          <xsl:message>
            Prize mismatch at <xsl:value-of select="c:choir-name"/>.
          </xsl:message>
        </xsl:if>
        <xsl:apply-templates select=".">
          <xsl:with-param name="top" select="$top"/>
        </xsl:apply-templates>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$silver-choir-list">
      <h3>銀賞</h3>
        <xsl:for-each select="$silver-choir-list">
          <xsl:if test="not(c:prize/text()='銀賞')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="c:choir-name"/>.
            </xsl:message>
          </xsl:if>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
        </xsl:for-each>
    </xsl:if>
    <xsl:if test="$blonze-choir-list">
      <h3>銅賞</h3>
        <xsl:for-each select="$blonze-choir-list">
          <xsl:if test="not(c:prize/text()='銅賞')">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="c:choir-name"/>.
            </xsl:message>
          </xsl:if>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
        </xsl:for-each>
    </xsl:if>
    <xsl:if test="$other-choir-list">
      <xsl:if test="$seed-choir-list or $gold-choir-list or $silver-choir-list or $blonze-choir-list">
	<h3>そのほか</h3>
      </xsl:if>
        <xsl:for-each select="$other-choir-list">
          <xsl:if test="c:prize/text()">
            <xsl:message>
              Prize mismatch at <xsl:value-of select="c:choir-name"/>.
            </xsl:message>
          </xsl:if>
            <xsl:apply-templates select=".">
	      <xsl:with-param name="top" select="$top"/>
	    </xsl:apply-templates>
        </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template match="c:section-name">
    <h2>
      <xsl:value-of select="."/>
      <xsl:if test="@date">
	<xsl:text> (</xsl:text>
	<xsl:value-of select="@date"/>
	<xsl:text>)</xsl:text>
      </xsl:if>
    </h2>
  </xsl:template>

  <xsl:template match="c:choir">
    <xsl:param name="top" select="/"/>
    <p>
      <xsl:apply-templates select="c:choir-name"/>
      <xsl:call-template name="choir-attr-list"/>
      <xsl:call-template name="special-prize-list"/>
      <br/>
      <xsl:call-template name="choir-data">
	<xsl:with-param name="top" select="$top"/>
      </xsl:call-template>
      <xsl:apply-templates select="c:choir-note"/>
    </p>
    <xsl:apply-templates select="c:program"/>
  </xsl:template>

  <xsl:template match="c:number-of-parts">
    <xsl:number value="." format="1"/>
    <xsl:text>部</xsl:text>
  </xsl:template>

  <xsl:template match="@grade">
    <xsl:text>(</xsl:text>
    <xsl:number value="." format="1"/>
    <xsl:text>年)</xsl:text>
  </xsl:template>

  <xsl:template match="c:choir-name">
    <span class="choir-name">
      <xsl:choose>
        <xsl:when test="@choidref">
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="concat('/choir/',substring(@choidref,0,3),'/',@choidref,'/',@choidref,'.html')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <xsl:template name="choir-data">
    <xsl:param name="top" select="/"/>
    <xsl:variable name="choir-pref" select="c:prefecture"/>
    <xsl:variable name="choir-member"
		  select="child::*[self::c:choir-type or self::c:number-of-members or self::c:number-of-parts]"/>
    <xsl:variable name="player-data"
		  select="child::*[self::c:conductor or self::c:piano or self::c:accompaniment]"/>
    <xsl:choose>
      <xsl:when test="$top/c:competition-name/@pref[.='true']">
	<xsl:if test="$choir-member or $player-data">
	  <xsl:call-template name="choir-data-1">
	    <xsl:with-param name="pref"/>
	    <xsl:with-param name="member" select="$choir-member"/>
	  </xsl:call-template>
	  <xsl:if test="$choir-member and $player-data">
	    <xsl:text>、</xsl:text>
	  </xsl:if>
	  <xsl:call-template name="players-data"/>
	</xsl:if>
      </xsl:when>
      <xsl:when test="$top/c:competition-name/@pref[.='false']">
	<xsl:if test="$choir-pref or $choir-member or $player-data">
	  <xsl:call-template name="choir-data-1">
	    <xsl:with-param name="pref" select="$choir-pref"/>
	    <xsl:with-param name="member" select="$choir-member"/>
	  </xsl:call-template>
	  <xsl:if test="($choir-pref or $choir-member) and $player-data">
	    <xsl:text>、</xsl:text>
	  </xsl:if>
	  <xsl:call-template name="players-data"/>
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

  <xsl:template match="c:prefecture">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="c:choir-type">
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

  <xsl:template match="c:number-of-members">
    <xsl:value-of select="."/>
    <xsl:text>名</xsl:text>
  </xsl:template>

  <xsl:template name="players-data">
    <xsl:call-template name="conductor-list"/>
    <xsl:if test="c:conductor and (c:piano or c:accompaniment)">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:call-template name="piano-list"/>
    <xsl:if test="c:piano and c:accompaniment">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="c:accompaniment"/>
  </xsl:template>

  <xsl:template name="conductor-list">
    <xsl:for-each select="c:conductor">
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
    <xsl:for-each select="c:piano">
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

  <xsl:template match="c:accompaniment">
    <xsl:value-of select="@instrument"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::c:accompaniment">
      <xsl:text>、</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="c:prize">
  </xsl:template>

  <xsl:template name="choir-attr-list">
    <xsl:if test="@representative='true'">
      <em>
	<xsl:text> [代表] </xsl:text>
      </em>
    </xsl:if>
    <xsl:if test="@seed='true'">
      <em>
	<xsl:text> [シード団体] </xsl:text>
      </em>
    </xsl:if>
  </xsl:template>

  <xsl:template name="special-prize-list">
    <xsl:if test="c:special-prize">
      <em>
	<xsl:text> [</xsl:text>
	<xsl:for-each select="c:special-prize">
	  <xsl:apply-templates/>
	  <xsl:if test="not(position()=last())">
	    <xsl:text>、</xsl:text>
	  </xsl:if>
	</xsl:for-each>
	<xsl:text>]</xsl:text>
      </em>
    </xsl:if>
  </xsl:template>
  <xsl:template match="c:special-prize">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="c:choir-note">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="c:program">
    <ul>
      <xsl:apply-templates select="c:given-program"/>
      <xsl:apply-templates select="c:free-program"/>
    </ul>
  </xsl:template>

  <xsl:template match="c:given-program">
    <li>
      <xsl:if test='not(c:givenProgramNumber)'>
        <xsl:text>[課題曲] </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="c:givenProgramNumber | p:piece | p:suite"/>
      <xsl:call-template name="piece-players-list"/>
    </li>
  </xsl:template>

  <xsl:template match="c:givenProgramNumber">
    <xsl:text>[</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>] </xsl:text>
  </xsl:template>

  <xsl:template match="c:free-program">
    <li>
      <xsl:apply-templates select="p:piece | p:suite"/>
      <xsl:call-template name="piece-players-list"/>
    </li>
  </xsl:template>

  <xsl:template name="piece-players-list">
    <xsl:variable name="player-data"
		  select="child::*[self::c:conductor or self::c:piano or self::c:accompaniment]"/>
    <xsl:if test="$player-data">
      <xsl:text> (</xsl:text>
      <xsl:call-template name="players-data"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="c:programNote">
    <xsl:text> (</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template name="saiten">
    <xsl:param name="top" select="/"/>
    <xsl:param name="result-top"/>
    <xsl:variable name="competition-name"
		  select="$top/c:competition-name"/>
    <html xml:lang="ja" lang="ja">
      <head>
	<xsl:call-template name="additional-header"/>
	<title>
	  <xsl:value-of select="$competition-name"/>
	  <xsl:text>: 採点表</xsl:text>
	</title>
      </head>
      <body>
        <xsl:call-template name="body-header"/>
	<h1>
	  <xsl:value-of select="$competition-name"/>
	  <xsl:text>: 採点表</xsl:text>
	</h1>
	<xsl:apply-templates select="c:section[c:choir/c:scores]"
	  mode="score"/>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="c:section" mode="score">
    <xsl:apply-templates select="c:section-name" mode="score"/>
    <table class="ajclresult" border="1">
      <thead>
	<tr>
	  <th rowspan="1" colspan="1"/>
	  <xsl:apply-templates select="../c:referee" mode="score"/>
	  <th rowspan="1" colspan="1">
	    <xsl:text>総合評価</xsl:text>
	  </th>
	  <th rowspan="1" colspan="1">
	    <xsl:text>備考</xsl:text>
	  </th>
	</tr>
      </thead>
      <tbody>
	<xsl:apply-templates select="c:choir" mode="score">
	  <xsl:sort order="ascending" data-type="number" select="@playing-order"/>
	</xsl:apply-templates>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="c:section-name" mode="score">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>

  <xsl:template match="c:referee" mode="score">
    <th rowspan="1" colspan="1">
      <xsl:value-of select="@shortname"/>
    </th>
  </xsl:template>

  <xsl:template match="c:choir" mode="score">
    <tr>
      <xsl:choose>
	<xsl:when test="c:prize[@nickname='gold']"> 
	  <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
	</xsl:when>
	<xsl:when test="c:prize[@nickname='silver']">
	  <xsl:attribute name="bgcolor">silver</xsl:attribute>
	</xsl:when>
	<xsl:when test="c:prize[@nickname='blonze']">
	  <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <td rowspan="1" colspan="1">
	<xsl:apply-templates select="@playing-order" mode="score"/>
	<xsl:apply-templates select="c:choir-name"/>
      </td>
      <xsl:apply-templates select="c:scores" mode="score"/>
    </tr>
  </xsl:template>

  <xsl:template match="@playing-order" mode="score">
    <xsl:value-of select="."/>
    <xsl:text>. </xsl:text>
  </xsl:template>

  <xsl:template match="c:scores" mode="score">
    <!-- c:result/c:section/c:choir/c:scores, c:result:c:referee -->
    <xsl:variable name="current-node" select="."/>
    <xsl:for-each select="../../../c:referee">
      <xsl:apply-templates select="$current-node/c:score[@referee=current()/@shortname]"
	mode="score"/>
    </xsl:for-each>
    <xsl:apply-templates select="c:total-score" mode="score"/>
    <xsl:apply-templates select="c:score-note" mode="score"/>
  </xsl:template>

  <xsl:template match="c:score" mode="score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <xsl:template match="c:total-score" mode="score">
    <td rowspan="1" colspan="1" align="right">
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <xsl:template match="c:score-note" mode="score">
    <td rowspan="1" colspan="1">
      <xsl:for-each select="./node()[.!='']|../../c:prize[.!='']|../../c:special-prize|../../@representative[.='true']|../../@seed[.='true']">
	<xsl:apply-templates select="." mode="score"/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>、</xsl:text>
	</xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template match="c:prize" mode="score">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="c:special-prize" mode="score">
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

  <!-- character -->
  <xsl:template match='cr:*'>
    <xsl:element name='{name()}' namespace='{namespace-uri()}'>
      <xsl:if test='@nickname'>
        <xsl:attribute name='nickname'>
          <xsl:value-of select='@nickname'/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test='@codepoint'>
        <xsl:attribute name='codepoint'>
          <xsl:value-of select='@codepoint'/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select='node()'/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
