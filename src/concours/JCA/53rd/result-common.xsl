<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: result-common.xsl,v 1.26 2000/10/08 02:21:30 kunishi Exp $ -->
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:lxslt="http://xml.apache.org/xslt"
  xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
  xmlns="http://www.w3.org/1999/xhtml"
  extension-element-prefixes="redirect">

  <xsl:output
    method="xml"
    indent="yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="no"/>

  <xsl:template match="/">
    <xsl:apply-templates select="大会/開催日別結果[@出力=$output-base]"/>
  </xsl:template>

  <xsl:template match="開催日別結果">
    <redirect:write file="{concat(@出力, $suffix)}">
      <xsl:call-template name="main"/>
    </redirect:write>
    <xsl:if test=".//採点結果">
      <redirect:write file="{concat(@出力, '-saiten', $suffix)}">
        <xsl:call-template name="saiten"/>
      </redirect:write>
    </xsl:if>
  </xsl:template>

  <xsl:template name="main">
    <xsl:element name="html">
      <xsl:attribute name="xml:lang">
        <xsl:text>ja</xsl:text>
      </xsl:attribute>
      <head>
	<xsl:call-template name="additional-header"/>
	<title>
	  <xsl:value-of select="/大会/大会名"/>
	</title>
      </head>
      <body>
	<xsl:call-template name="encodinglink"/>
        <h1>
	  <xsl:value-of select="/大会/大会名"/>
	</h1>
        <hr/>
	<dl>
	  <xsl:call-template name="開催日リスト"/>
	  <xsl:apply-templates select="開催場所"/>
	  <xsl:call-template name="審査員リスト"/>
	  <xsl:call-template name="報告者リスト"/>
	</dl>
	<xsl:apply-templates select="注記"/>
	<xsl:call-template name="採点結果リンク"/>
        <hr/>
	<xsl:apply-templates select="部門結果"/>
	<xsl:call-template name="footer"/>
      </body>
    </xsl:element>
  </xsl:template>

  <xsl:template name="additional-header">
    <link>
      <xsl:attribute name="href">%%STYLEDIR%%/jca-concours.css</xsl:attribute>
      <xsl:attribute name="type">text/css</xsl:attribute>
      <xsl:attribute name="rel">stylesheet</xsl:attribute>
    </link>
    <link>
      <xsl:attribute name="href">mailto:kunishi@c.oka-pu.ac.jp</xsl:attribute>
      <xsl:attribute name="rev">made</xsl:attribute>
    </link>
    <meta>
      <xsl:attribute name="http-equiv">Content-Style-Type</xsl:attribute>
      <xsl:attribute name="content">text/css</xsl:attribute>
    </meta>
    <style>
      <xsl:attribute name="type">text/css</xsl:attribute>
      <xsl:attribute name="xml:space">preserve</xsl:attribute>
      <xsl:text>
body { background-image: url(%%IMAGEDIR%%/background.png); }
      </xsl:text>
    </style>
    <meta>
      <xsl:attribute name="http-equiv">
	<xsl:text>Content-Type</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="content">
	<xsl:text>text/html; charset=</xsl:text>
	<xsl:value-of select="$output-encoding" />
      </xsl:attribute>
    </meta>
  </xsl:template>
  
  <xsl:template name="encodinglink">
    <p>
      <xsl:if test="$suffix=$utfhtmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@出力, $htmlsuffix)" />
	  </xsl:attribute>
	  <xsl:text>JISページ</xsl:text>
	</a>
      </xsl:if>
      <xsl:if test="$suffix=$htmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@出力, $utfhtmlsuffix)"/>
	  </xsl:attribute>
	  <xsl:text>UTF-8ページ</xsl:text>
	</a>
      </xsl:if>
    </p>
  </xsl:template>

  <xsl:template name="footer">
    <hr/>
    <div>
      <xsl:attribute name="class">footer</xsl:attribute>
      <address>
        <a>
          <xsl:attribute name="href">mailto:kunishi@c.oka-pu.ac.jp</xsl:attribute>
          <xsl:text>国島丈生 &lt;kunishi@c.oka-pu.ac.jp&gt;</xsl:text>
        </a>
      </address>
      <p>
        <xsl:text>この文書は</xsl:text>
        <xsl:value-of select="/大会/CVSID"/>
        <xsl:text>から自動的に生成されました。</xsl:text>
      </p>
      <p>
        <xsl:text>Copyright (C) 2000 Takeo Kunishima.  All rights reserved.</xsl:text>
      </p>
    </div>
  </xsl:template>

  <xsl:template name="開催日リスト">
    <xsl:if test="child::開催日">
      <dt>開催日</dt>
      <dd>
	<xsl:apply-templates select="開催日"/>
      </dd>
    </xsl:if>
  </xsl:template>

  <xsl:template match="開催日">
    <xsl:value-of select="."/>
    <xsl:text>(</xsl:text>
    <xsl:value-of select="./@曜日"/>
    <xsl:text>)</xsl:text>
    <xsl:if test="following-sibling::開催日">
      <xsl:text>・</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="開催場所">
    <dt>開催場所</dt>
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template name="審査員リスト">
    <xsl:if test="child::審査員">
      <dt>審査員</dt>
      <dd>
	<xsl:apply-templates select="審査員"/>
      </dd>
    </xsl:if>
  </xsl:template>
  <xsl:template match="審査員">
    <xsl:apply-templates/>
    <xsl:if test="@肩書 or @備考">
      <xsl:text>(</xsl:text>
      <xsl:if test="@肩書">
	<xsl:value-of select="@肩書"/>
	<xsl:if test="@備考"><xsl:text>、</xsl:text></xsl:if>
      </xsl:if>
      <xsl:if test="@備考"><xsl:value-of select="@備考"/></xsl:if>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="following-sibling::審査員">
      <xsl:text>、</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="報告者リスト">
    <dt>報告者</dt>
    <xsl:apply-templates select="報告者"/>
  </xsl:template>
  <xsl:template match="報告者">
    <dd>
      <xsl:choose>
        <xsl:when test="@匿名希望[.='yes']">
          <xsl:text>匿名希望</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="報告者氏名"/>
          <xsl:apply-templates select="email"/>
        </xsl:otherwise>
      </xsl:choose>
    </dd>
  </xsl:template>

  <xsl:template match="報告者氏名">
    <xsl:choose>
      <xsl:when test="@ペンネーム">
        <xsl:value-of select="@ペンネーム"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="email">
    <xsl:if test="not(@email匿名[.='yes'])">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="採点結果リンク">
    <xsl:if test=".//採点結果">
      <ul>
	<li>
	  <p>
	    <xsl:text>採点表を</xsl:text>
	    <a>
	      <xsl:attribute name="href">
		<xsl:value-of select="concat(@出力, '-saiten', $suffix)"/>
	      </xsl:attribute>
	      <xsl:text>別ページ</xsl:text>
	    </a>
	    <xsl:text>にまとめてあります。</xsl:text>
	  </p>
	</li>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="注記">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="注記事項">
    <li>
      <p>
	<xsl:value-of select="."/>
      </p>
    </li>
  </xsl:template>

  <xsl:template match="部門結果">
    <xsl:apply-templates select="部門名"/>
    <xsl:if test="団体[賞[.='シード']]">
      <h3>シード団体</h3>
      <ul>
        <xsl:for-each select="団体[賞[.='シード']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='金賞']]">
      <h3>金賞</h3>
      <ul>
        <xsl:for-each select="団体[賞[.='金賞']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='銀賞']]">
      <h3>銀賞</h3>
      <ul>
        <xsl:for-each select="団体[賞[.='銀賞']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='銅賞']]">
      <h3>銅賞</h3>
      <ul>
        <xsl:for-each select="団体[賞[.='銅賞']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="団体[not(賞)]">
      <h3>そのほか</h3>
      <ul>
        <xsl:for-each select="団体[not(賞)]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="部門名">
    <h2>
      <xsl:value-of select="."/>
      <xsl:if test="@開催日">
	<xsl:text> (</xsl:text>
	<xsl:value-of select="@開催日"/>
	<xsl:text>)</xsl:text>
      </xsl:if>
    </h2>
  </xsl:template>

  <xsl:template match="団体">
    <xsl:if test="@大会代表[.='yes']">
      <xsl:text>◎</xsl:text>
    </xsl:if>
    <xsl:if test="@来年度シード[.='yes']">
      <xsl:text>◎</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="団体名"/>
    <xsl:call-template name="団体データ"/>
    <xsl:call-template name="特別賞リスト"/>
    <xsl:apply-templates select="団体備考"/>
    <xsl:apply-templates select="曲目"/>
  </xsl:template>

  <xsl:template match="団体名">
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

  <xsl:template name="団体データ">
    <xsl:if test="(所属県 and not(//大会名[@県大会]))
                  or 形態 or 登録人数 or 指揮者 or ピアノ or 共演者">
      <xsl:text> (</xsl:text>
      <xsl:for-each select="child::*[name()='所属県' or name()='形態'
                            or name()='登録人数']">
        <xsl:call-template name="団体データその1"/>
      </xsl:for-each>
      <xsl:if test="((所属県 and not(//大会名[@県大会])) or 形態 or 登録人数)
                    and (指揮者 or ピアノ or 共演者)">
	<xsl:text>、</xsl:text>
      </xsl:if>
      <xsl:call-template name="演奏者データ"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="団体データその1">
    <xsl:choose>
      <xsl:when test="name()='所属県'">
        <xsl:if test="not(//大会名[@県大会='yes'])">
          <xsl:apply-templates select="current()"/>
          <xsl:if test="following-sibling::形態
                        or following-sibling::登録人数">
            <xsl:text>・</xsl:text>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:when test="name()='形態'">
        <xsl:apply-templates select="current()"/>
      </xsl:when>
      <xsl:when test="name()='登録人数'">
        <xsl:apply-templates select="current()"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="所属県">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="形態">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="登録人数">
    <xsl:value-of select="."/>
    <xsl:text>名</xsl:text>
  </xsl:template>

  <xsl:template name="演奏者データ">
    <xsl:call-template name="指揮者リスト"/>
    <xsl:if test="ピアノ">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:call-template name="ピアノリスト"/>
    <xsl:if test="共演者">
      <xsl:text>、</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="共演者"/>
  </xsl:template>

  <xsl:template name="指揮者リスト">
    <xsl:for-each select="指揮者">
      <xsl:if test="position()=1">
	<xsl:text>指揮</xsl:text>
	<xsl:if test="@兼任">
	  <xsl:text>・</xsl:text>
	  <xsl:value-of select="@兼任"/>
	</xsl:if>
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="not(position()=last())">
	<xsl:text>・</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="ピアノリスト">
    <xsl:for-each select="ピアノ">
      <xsl:if test="position()=1">
	<xsl:text>ピアノ: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="not(position()=last())">
	<xsl:text>・</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="共演者">
    <xsl:value-of select="@演奏楽器"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::共演者">
      <xsl:text>、</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="賞">
  </xsl:template>

  <xsl:template name="特別賞リスト">
    <xsl:if test="特別賞">
      <xsl:text> [</xsl:text>
      <xsl:for-each select="特別賞">
	<xsl:apply-templates/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>、</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:text>]</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="特別賞">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="団体備考">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="曲目">
    <ul>
      <xsl:apply-templates select="課題曲"/>
      <xsl:apply-templates select="自由曲"/>
    </ul>
  </xsl:template>

  <xsl:template match="課題曲">
    <li>
      <xsl:value-of select="@番号"/>
    </li>
  </xsl:template>

  <xsl:template match="自由曲">
    <li>
      <xsl:for-each select="child::*[name()='出典' or name()='作詩'
                            or name()='訳詩' or name()='作曲'
                            or name()='編曲']">
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
      <xsl:apply-templates select="曲名"/>
      <xsl:apply-templates select="組曲"/>
    </li>
  </xsl:template>

  <xsl:template match="出典">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="作詩">
    <xsl:apply-templates/>
    <xsl:text>作詩</xsl:text>
  </xsl:template>
  <xsl:template match="訳詩">
    <xsl:apply-templates/>
    <xsl:text>訳詩</xsl:text>
  </xsl:template>
  <xsl:template match="作曲">
    <xsl:apply-templates/>
    <xsl:text>作曲</xsl:text>
  </xsl:template>
  <xsl:template match="編曲">
    <xsl:apply-templates/>
    <xsl:text>編曲</xsl:text>
  </xsl:template>

  <xsl:template match="曲名">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="組曲">
    <xsl:apply-templates select="曲名"/>
    <xsl:if test="@抜粋 = 'yes'">
      <xsl:text>から </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="構成曲"/>
  </xsl:template>

  <xsl:template match="構成曲">
    <xsl:if test="not(構成曲)">
      <xsl:text>「</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="構成曲番号"/>
    <xsl:apply-templates select="曲名"/>
    <xsl:if test="作詩 or 出典 or 訳詩 or 作曲">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates select="出典"/>
      <xsl:apply-templates select="作詩"/>
      <xsl:apply-templates select="訳詩"/>
      <xsl:apply-templates select="作曲"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="構成曲">
      <xsl:apply-templates select="構成曲" />
    </xsl:if>
    <xsl:if test="not(構成曲)">
      <xsl:text>」</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="構成曲番号">
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="unicoderef">
    <xsl:choose>
      <xsl:when test="$output-encoding='utf-8'">
        <xsl:value-of select="@code"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@alt"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
