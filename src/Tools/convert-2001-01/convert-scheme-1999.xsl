<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:cr="http://www.chorusroom.org/character">
  <xsl:output method="xml"
	      indent="yes"
	      encoding="euc-jp"
	      doctype-public="-//CHORUSROOM//DTD Contest JCA 1.0//JA"
	      doctype-system="http://localhost/DTD/jca-comp-result.dtd"/>

  <xsl:template name="yes-no">
    <xsl:choose>
      <xsl:when test=".='yes'">
	<xsl:text>true</xsl:text>
      </xsl:when>
      <xsl:when test=".='no'">
	<xsl:text>false</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="大会">
    <competition>
      <xsl:apply-templates/>
    </competition>
  </xsl:template>

  <xsl:template match="CVSID">
    <cvs-id>
      <xsl:apply-templates/>
    </cvs-id>
  </xsl:template>

  <xsl:template match="大会名">
    <competition-name pref="false" area="false">
      <xsl:apply-templates/>
    </competition-name>
  </xsl:template>

  <xsl:template match="開催日別結果">
    <result>
      <xsl:attribute name="output">
	<xsl:value-of select="@出力"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </result>
  </xsl:template>

  <xsl:template match="開催日">
    <date>
      <xsl:attribute name="day-of-week">
	<xsl:choose>
	  <xsl:when test="@曜日='月'">
	    <xsl:text>mon</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='火'">
	    <xsl:text>tue</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='水'">
	    <xsl:text>wed</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='木'">
	    <xsl:text>thu</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='金'">
	    <xsl:text>fri</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='土'">
	    <xsl:text>sat</xsl:text>
	  </xsl:when>
	  <xsl:when test="@曜日='日'">
	    <xsl:text>sun</xsl:text>
	  </xsl:when>
	</xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="holiday">
	<xsl:text>false</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates/>
    </date>
  </xsl:template>

  <xsl:template match="開催場所">
    <hall>
      <xsl:apply-templates/>
    </hall>
  </xsl:template>

  <xsl:template match="審査員">
    <referee>
      <xsl:apply-templates select="node()|@*"/>
    </referee>
  </xsl:template>
  <xsl:template match="@省略名">
    <xsl:attribute name="shortname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@肩書">
    <xsl:attribute name="job">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@備考">
    <xsl:attribute name="country">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="報告者">
    <reporter>
      <xsl:apply-templates select="node()|@*"/>
    </reporter>
  </xsl:template>
  <xsl:template match="@匿名希望|@email匿名">
    <xsl:attribute name="anonymous">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="報告者氏名">
    <reporter-name>
      <xsl:apply-templates select="node()|@*"/>
    </reporter-name>
  </xsl:template>
  <xsl:template match="@ペンネーム">
    <xsl:attribute name="penname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="email">
    <reporter-email>
      <xsl:apply-templates select="node()|@*"/>
    </reporter-email>
  </xsl:template>

  <xsl:template match="注記">
    <notices>
      <xsl:apply-templates/>
    </notices>
  </xsl:template>
  <xsl:template match="注記事項">
    <notice>
      <xsl:apply-templates/>
    </notice>
  </xsl:template>

  <xsl:template match="部門結果">
    <section>
      <xsl:apply-templates select="node()|@*"/>
    </section>
  </xsl:template>
  <xsl:template match="部門名">
    <section-name>
      <xsl:apply-templates select="node()|@*"/>
    </section-name>
  </xsl:template>
  <xsl:template match="@開催日">
    <xsl:attribute name="date">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="団体">
    <choir>
      <xsl:apply-templates select="@*"/>
      <xsl:if test="not(@来年度シード)">
	<xsl:attribute name="seed">
	  <xsl:text>false</xsl:text>
	</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="団体名"/>
      <xsl:apply-templates select="所属県|形態|登録人数"/>
      <xsl:apply-templates select="指揮者|ピアノ|共演者"/>
      <xsl:choose>
	<xsl:when test="賞">
	  <xsl:apply-templates select="賞"/>
	</xsl:when>
	<xsl:when test="not(賞)">
	  <prize nickname="none"></prize>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="特別賞"/>
      <xsl:apply-templates select="曲目"/>
      <xsl:apply-templates select="採点結果"/>
      <xsl:apply-templates select="団体備考"/>
    </choir>
  </xsl:template>
  <xsl:template match="@出演順">
    <xsl:attribute name="playing-order">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@大会代表">
    <xsl:attribute name="representative">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@来年度シード">
    <xsl:attribute name="seed">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="団体名">
    <choir-name>
      <xsl:apply-templates/>
    </choir-name>
  </xsl:template>
  <xsl:template match="所属県">
    <prefecture>
      <xsl:apply-templates/>
    </prefecture>
  </xsl:template>
  <xsl:template match="形態">
    <choir-type>
      <xsl:choose>
	<xsl:when test=".='混声'">
	  <xsl:text>mixed</xsl:text>
	</xsl:when>
	<xsl:when test=".='女声'">
	  <xsl:text>female</xsl:text>
	</xsl:when>
	<xsl:when test=".='男声'">
	  <xsl:text>male</xsl:text>
	</xsl:when>
	<xsl:when test=".='同声'">
	  <xsl:text>same-voice</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="."/>
	</xsl:otherwise>
      </xsl:choose>
    </choir-type>
  </xsl:template>
  <xsl:template match="登録人数">
    <number-of-members>
      <xsl:apply-templates/>
    </number-of-members>
  </xsl:template>

  <xsl:template match="指揮者">
    <conductor>
      <xsl:apply-templates select="node()|@*"/>
    </conductor>
  </xsl:template>
  <xsl:template match="@兼任|@演奏楽器">
    <xsl:attribute name="instrument">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="ピアノ">
    <piano>
      <xsl:apply-templates select="node()|@*"/>
    </piano>
  </xsl:template>
  <xsl:template match="共演者">
    <accompaniment>
      <xsl:apply-templates select="node()|@*"/>
    </accompaniment>
  </xsl:template>

  <xsl:template match="賞">
    <prize>
      <xsl:attribute name="nickname">
	<xsl:choose>
	  <xsl:when test=".='金賞'">
	    <xsl:text>gold</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='銀賞'">
	    <xsl:text>silver</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='銅賞'">
	    <xsl:text>blonze</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='シード'">
	    <xsl:text>seeded</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>none</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </prize>
  </xsl:template>
  <xsl:template match="特別賞">
    <special-prize>
      <xsl:apply-templates/>
    </special-prize>
  </xsl:template>

  <xsl:template match="曲目">
    <program>
      <xsl:apply-templates select="node()"/>
    </program>
  </xsl:template>

  <xsl:template match="課題曲">
    <given-program>
      <pieceRef>
	<xsl:attribute name="number">
	  <xsl:value-of select="."/>
	</xsl:attribute>
	<xsl:attribute name="href">givenPrograms.xml</xsl:attribute>
      </pieceRef>
    </given-program>
  </xsl:template>

  <xsl:template match="自由曲">
    <free-program>
      <xsl:choose>
	<xsl:when test="not(組曲)">
	  <p:piece>
	    <xsl:apply-templates/>
	  </p:piece>
	</xsl:when>
	<xsl:when test="組曲">
	  <p:suite>
	    <xsl:apply-templates/>
	  </p:suite>
	</xsl:when>
      </xsl:choose>
    </free-program>
  </xsl:template>

  <xsl:template match="作詩">
    <p:words-by>
      <xsl:apply-templates/>
    </p:words-by>
  </xsl:template>
  <xsl:template match="作曲">
    <p:composed-by>
      <xsl:apply-templates/>
    </p:composed-by>
  </xsl:template>
  <xsl:template match="訳詩">
    <p:translated-by>
      <xsl:apply-templates/>
    </p:translated-by>
  </xsl:template>
  <xsl:template match="出典">
    <p:originated-from>
      <xsl:apply-templates/>
    </p:originated-from>
  </xsl:template>
  <xsl:template match="編曲">
    <p:arranged-by>
      <xsl:apply-templates/>
    </p:arranged-by>
  </xsl:template>

  <xsl:template match="曲名">
    <p:title original="true">
      <p:mainTitle>
	<xsl:apply-templates/>
      </p:mainTitle>
    </p:title>
  </xsl:template>
  <xsl:template match="組曲">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="構成曲">
    <p:suite-piece>
      <xsl:apply-templates select="構成曲番号"/>
      <xsl:choose>
	<xsl:when test="組曲">
	  <p:suite>
	    <xsl:apply-templates select="*[not(name()='構成曲番号')]"/>
	  </p:suite>
	</xsl:when>
	<xsl:when test="not(組曲)">
	  <p:piece>
	    <xsl:apply-templates select="*[not(name()='構成曲番号')]"/>
	  </p:piece>
	</xsl:when>
      </xsl:choose>
    </p:suite-piece>
  </xsl:template>
  <xsl:template match="構成曲番号">
    <p:piece-number>
      <xsl:apply-templates/>
    </p:piece-number>
  </xsl:template>

  <xsl:template match="採点結果">
    <scores>
      <xsl:apply-templates/>
    </scores>
  </xsl:template>
  <xsl:template match="採点">
    <score>
      <xsl:apply-templates select="node()|@*"/>
    </score>
  </xsl:template>
  <xsl:template match="@採点者">
    <xsl:attribute name="referee">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="総合評価">
    <total-score>
      <xsl:apply-templates/>
    </total-score>
  </xsl:template>
  <xsl:template match="採点備考">
    <score-note>
      <xsl:apply-templates/>
    </score-note>
  </xsl:template>

  <xsl:template match="団体備考">
    <choir-note>
      <xsl:apply-templates/>
    </choir-note>
  </xsl:template>

  <xsl:template match="unicoderef">
    <cr:utf8-char>
      <xsl:apply-templates/>
    </cr:utf8-char>
  </xsl:template>
  <xsl:template match="@code">
    <xsl:attribute name="codepoint">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@alt">
    <xsl:attribute name="alternative">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="*|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
