<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"
		xmlns="http://www.w3.org/TR/REC-html40"
		result-ns="">
  <xsl:template match="大会">
    <html>
      <head>
	<title>
	  <xsl:value-of select="大会名"/>
	</title>
	<xsl:call-template name="additional-header"/>
      </head>
      <body>
	<h1><xsl:value-of select="大会名"/></h1>
	<xsl:apply-templates select="開催日別結果"/>
	<xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="additional-header">
    <link href="../../style/jca-concour.css" type="text/css" rel="stylesheet">
    </link>
    <link href="mailto:kunishi@c.oka-pu.ac.jp" rev="made">
    </link>
  </xsl:template>
  
  <xsl:template name="footer">
    <hr></hr>
    <address><a href="mailto:kunishi@c.oka-pu.ac.jp">国島丈生 &lt;kunishi@c.oka-pu.ac.jp&gt;</a></address>
    <p>この文書は<xsl:value-of select="/大会/CVSID"/>から自動的に生成されました。</p>
  </xsl:template>

  <xsl:template match="開催日別結果">
    <dl>
      <xsl:apply-templates select="開催日"/>
      <xsl:apply-templates select="開催場所"/>
      <xsl:call-template name="審査員リスト"/>
      <xsl:call-template name="報告者リスト"/>
    </dl>
    <xsl:element name="hr"/>
    <xsl:apply-templates select="注記"/>
    <xsl:element name="hr"/>
    <xsl:apply-templates select="部門結果"/>
  </xsl:template>

  <xsl:template match="開催日">
    <dt>開催日</dt>
    <dd><xsl:value-of select="."/>(<xsl:value-of select="./@曜日"/>)</dd>
  </xsl:template>
  <xsl:template match="開催場所">
    <dt>開催場所</dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>

  <xsl:template name="審査員リスト">
    <dt>審査員</dt>
    <dd><xsl:apply-templates select="審査員"/></dd>
  </xsl:template>
  <xsl:template match="審査員">
    <xsl:value-of select="."/>
      <xsl:if test="@肩書">
	(<xsl:value-of select="@肩書"/>)
      </xsl:if>
      <xsl:if test="from-following-siblings(審査員)">
	、
      </xsl:if>
  </xsl:template>

  <xsl:template name="報告者リスト">
    <dt>報告者</dt>
    <xsl:apply-templates select="報告者"/>
  </xsl:template>
  <xsl:template match="報告者">
    <dd>
      <xsl:value-of select="."/>
      <xsl:if test="not(@匿名希望)">
	(<xsl:value-of select="@email"/>)
      </xsl:if>
    </dd>
  </xsl:template>

  <xsl:template match="注記">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="注記事項">
    <li><p><xsl:value-of select="."/></p></li>
  </xsl:template>

  <xsl:template match="部門結果">
    <xsl:apply-templates select="部門名"/>
    <xsl:if test="団体[賞[.='シード']]">
      <h3>シード団体</h3>
      <ul>
	<xsl:apply-templates select="団体[賞[.='シード']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='金賞']]">
      <h3>金賞</h3>
      <ul>
	<xsl:apply-templates select="団体[賞[.='金賞']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='銀賞']]">
      <h3>銀賞</h3>
      <ul>
	<xsl:apply-templates select="団体[賞[.='銀賞']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="団体[賞[.='銅賞']]">
      <h3>銅賞</h3>
      <ul>
	<xsl:apply-templates select="団体[賞[.='銅賞']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="団体[not(賞)]">
      <h3>そのほか</h3>
      <ul>
	<xsl:apply-templates select="団体[not(賞)]"/>
      </ul>
    </xsl:if>
  </xsl:template>
  <xsl:template match="部門名">
    <h2><xsl:value-of select="."/></h2>
  </xsl:template>

  <xsl:template match="団体">
    <li>
      <xsl:if test="@大会代表">◎</xsl:if>
      <xsl:apply-templates select="団体名"/>
      (<xsl:apply-templates select="所属県"/>
      <xsl:apply-templates select="形態"/>
      <xsl:apply-templates select="登録人数"/>
      <xsl:apply-templates select="指揮者"/>
      <xsl:apply-templates select="共演者"/>)
      <xsl:call-template name="特別賞リスト"/>
      <xsl:apply-templates select="曲目"/>
    </li>
  </xsl:template>

  <xsl:template match="団体名">
    <xsl:if test="@url">
      <a href="{@url}"><xsl:value-of select="."/></a>
    </xsl:if>
    <xsl:if test="not(@url)">
      <xsl:value-of select="node()"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="所属県">
    <xsl:value-of select="."/>
    <xsl:if test="from-following-siblings(形態)">・</xsl:if>
  </xsl:template>

  <xsl:template match="形態">
    <xsl:value-of select="."/>
    <xsl:if test="not(from-following-siblings(登録人数))">, </xsl:if>
  </xsl:template>

  <xsl:template match="登録人数">
    <xsl:value-of select="."/>名
    <xsl:if test="from-following-siblings(指揮者)">, </xsl:if>
  </xsl:template>

  <xsl:template match="指揮者">
    指揮: <xsl:value-of select="."/>
    <xsl:if test="from-following-siblings(共演者)">, </xsl:if>
  </xsl:template>

  <xsl:template match="共演者">
    <xsl:value-of select="@演奏楽器"/>: <xsl:value-of select="."/>
    <xsl:if test="from-following-siblings(共演者)">, </xsl:if>
  </xsl:template>

  <xsl:template match="賞">
  </xsl:template>

  <xsl:template name="特別賞リスト">
    <xsl:if test="特別賞">
      [<xsl:apply-templates select="特別賞"/>]
    </xsl:if>
  </xsl:template>
  <xsl:template match="特別賞">
    <xsl:value-of select="."/>
    <xsl:if test="from-following-siblings(特別賞)">, </xsl:if>
  </xsl:template>

  <xsl:template match="曲目">
    <ul>
      <xsl:apply-templates select="課題曲"/>
      <xsl:apply-templates select="自由曲"/>
    </ul>
  </xsl:template>

  <xsl:template match="課題曲">
    <li><xsl:value-of select="text()"/></li>
  </xsl:template>

  <xsl:template match="自由曲">
    <li>
      <xsl:apply-templates select="出典"/>
      <xsl:apply-templates select="作詩"/>
      <xsl:apply-templates select="作曲"/>
      <xsl:apply-templates select="編曲"/>: 
      <xsl:if test="曲名"><xsl:apply-templates select="曲名"/></xsl:if>
      <xsl:if test="組曲"><xsl:apply-templates select="組曲"/></xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="出典">
    <xsl:value-of select="."/>
    <xsl:if test="from-following-siblings(作曲)">・</xsl:if>
  </xsl:template>
  <xsl:template match="作詩">
    <xsl:value-of select="."/>作詩
    <xsl:if test="from-following-siblings(作曲)">・</xsl:if>
  </xsl:template>
  <xsl:template match="作曲">
    <xsl:value-of select="."/>作曲
    <xsl:if test="from-following-siblings(編曲)">・</xsl:if>
  </xsl:template>
  <xsl:template match="編曲">
    <xsl:value-of select="."/>編曲
  </xsl:template>

  <xsl:template match="曲名">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="組曲">
    <xsl:value-of select="組曲名"/>
    <xsl:if test="@抜粋 = 'yes'">から</xsl:if>
     
    <xsl:apply-templates select="組曲ピース"/>
  </xsl:template>

  <xsl:template match="組曲ピース">
    <xsl:apply-templates select="ピース曲名"/>
  </xsl:template>

  <xsl:template match="ピース曲名">
    <xsl:if test="@ピース番号"><xsl:value-of select="@ピース番号"/>. </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="../作詩 or ../出典">
      (<xsl:apply-templates select="../出典"/><xsl:apply-templates select="../作詩"/>)</xsl:if>
    <xsl:if test="../from-following-siblings(組曲ピース)">; </xsl:if>
  </xsl:template>

  <xsl:template name="write">
    <xsl:param-variable name="contents"/>
    <xsl:param-variable name="file"/>
    <xsl:value-of select="w:write($contents,string($file))"
		  xmlns:w="http://www.jclark.com/xt/java/com.jclark.xsl.sax.HTMLFileWriter"
      />
  </xsl:template>
</xsl:stylesheet>
