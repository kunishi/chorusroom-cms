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

  <xsl:template match="$BBg2q(B">
    <competition>
      <xsl:apply-templates/>
    </competition>
  </xsl:template>

  <xsl:template match="CVSID">
    <cvs-id>
      <xsl:apply-templates/>
    </cvs-id>
  </xsl:template>

  <xsl:template match="$BBg2qL>(B">
    <competition-name pref="false" area="false">
      <xsl:apply-templates/>
    </competition-name>
  </xsl:template>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <result>
      <xsl:attribute name="output">
	<xsl:value-of select="@$B=PNO(B"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </result>
  </xsl:template>

  <xsl:template match="$B3+:EF|(B">
    <date>
      <xsl:attribute name="day-of-week">
	<xsl:choose>
	  <xsl:when test="@$BMKF|(B='$B7n(B'">
	    <xsl:text>mon</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$B2P(B'">
	    <xsl:text>tue</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$B?e(B'">
	    <xsl:text>wed</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$BLZ(B'">
	    <xsl:text>thu</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$B6b(B'">
	    <xsl:text>fri</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$BEZ(B'">
	    <xsl:text>sat</xsl:text>
	  </xsl:when>
	  <xsl:when test="@$BMKF|(B='$BF|(B'">
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

  <xsl:template match="$B3+:E>l=j(B">
    <hall>
      <xsl:apply-templates/>
    </hall>
  </xsl:template>

  <xsl:template match="$B?3::0w(B">
    <referee>
      <xsl:apply-templates select="node()|@*"/>
    </referee>
  </xsl:template>
  <xsl:template match="@$B>JN,L>(B">
    <xsl:attribute name="shortname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@$B8*=q(B">
    <xsl:attribute name="job">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@$BHw9M(B">
    <xsl:attribute name="country">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="$BJs9p<T(B">
    <reporter>
      <xsl:apply-templates select="node()|@*"/>
    </reporter>
  </xsl:template>
  <xsl:template match="@$BF?L>4uK>(B|@email$BF?L>(B">
    <xsl:attribute name="anonymous">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="$BJs9p<T;aL>(B">
    <reporter-name>
      <xsl:apply-templates select="node()|@*"/>
    </reporter-name>
  </xsl:template>
  <xsl:template match="@$B%Z%s%M!<%`(B">
    <xsl:attribute name="penname">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="email">
    <reporter-email>
      <xsl:apply-templates select="node()|@*"/>
    </reporter-email>
  </xsl:template>

  <xsl:template match="$BCm5-(B">
    <notices>
      <xsl:apply-templates/>
    </notices>
  </xsl:template>
  <xsl:template match="$BCm5-;v9`(B">
    <notice>
      <xsl:apply-templates/>
    </notice>
  </xsl:template>

  <xsl:template match="$BItLg7k2L(B">
    <section>
      <xsl:apply-templates select="node()|@*"/>
    </section>
  </xsl:template>
  <xsl:template match="$BItLgL>(B">
    <section-name>
      <xsl:apply-templates select="node()|@*"/>
    </section-name>
  </xsl:template>
  <xsl:template match="@$B3+:EF|(B">
    <xsl:attribute name="date">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="$BCDBN(B">
    <choir>
      <xsl:apply-templates select="@*"/>
      <xsl:if test="not(@$BMhG/EY%7!<%I(B)">
	<xsl:attribute name="seed">
	  <xsl:text>false</xsl:text>
	</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="$BCDBNL>(B"/>
      <xsl:apply-templates select="$B=jB08)(B|$B7ABV(B|$BEPO??M?t(B"/>
      <xsl:apply-templates select="$B;X4x<T(B|$B%T%"%N(B|$B6&1i<T(B"/>
      <xsl:choose>
	<xsl:when test="$B>^(B">
	  <xsl:apply-templates select="$B>^(B"/>
	</xsl:when>
	<xsl:when test="not($B>^(B)">
	  <prize nickname="none"></prize>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="$BFCJL>^(B"/>
      <xsl:apply-templates select="$B6JL\(B"/>
      <xsl:apply-templates select="$B:NE@7k2L(B"/>
      <xsl:apply-templates select="$BCDBNHw9M(B"/>
    </choir>
  </xsl:template>
  <xsl:template match="@$B=P1i=g(B">
    <xsl:attribute name="playing-order">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@$BBg2qBeI=(B">
    <xsl:attribute name="representative">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="@$BMhG/EY%7!<%I(B">
    <xsl:attribute name="seed">
      <xsl:call-template name="yes-no"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="$BCDBNL>(B">
    <choir-name>
      <xsl:apply-templates/>
    </choir-name>
  </xsl:template>
  <xsl:template match="$B=jB08)(B">
    <prefecture>
      <xsl:apply-templates/>
    </prefecture>
  </xsl:template>
  <xsl:template match="$B7ABV(B">
    <choir-type>
      <xsl:choose>
	<xsl:when test=".='$B:.@<(B'">
	  <xsl:text>mixed</xsl:text>
	</xsl:when>
	<xsl:when test=".='$B=w@<(B'">
	  <xsl:text>female</xsl:text>
	</xsl:when>
	<xsl:when test=".='$BCK@<(B'">
	  <xsl:text>male</xsl:text>
	</xsl:when>
	<xsl:when test=".='$BF1@<(B'">
	  <xsl:text>same-voice</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="."/>
	</xsl:otherwise>
      </xsl:choose>
    </choir-type>
  </xsl:template>
  <xsl:template match="$BEPO??M?t(B">
    <number-of-members>
      <xsl:apply-templates/>
    </number-of-members>
  </xsl:template>

  <xsl:template match="$B;X4x<T(B">
    <conductor>
      <xsl:apply-templates select="node()|@*"/>
    </conductor>
  </xsl:template>
  <xsl:template match="@$B7sG$(B|@$B1iAU3Z4o(B">
    <xsl:attribute name="instrument">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="$B%T%"%N(B">
    <piano>
      <xsl:apply-templates select="node()|@*"/>
    </piano>
  </xsl:template>
  <xsl:template match="$B6&1i<T(B">
    <accompaniment>
      <xsl:apply-templates select="node()|@*"/>
    </accompaniment>
  </xsl:template>

  <xsl:template match="$B>^(B">
    <prize>
      <xsl:attribute name="nickname">
	<xsl:choose>
	  <xsl:when test=".='$B6b>^(B'">
	    <xsl:text>gold</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='$B6d>^(B'">
	    <xsl:text>silver</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='$BF<>^(B'">
	    <xsl:text>blonze</xsl:text>
	  </xsl:when>
	  <xsl:when test=".='$B%7!<%I(B'">
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
  <xsl:template match="$BFCJL>^(B">
    <special-prize>
      <xsl:apply-templates/>
    </special-prize>
  </xsl:template>

  <xsl:template match="$B6JL\(B">
    <program>
      <xsl:apply-templates select="node()"/>
    </program>
  </xsl:template>

  <xsl:template match="$B2]Bj6J(B">
    <given-program>
      <pieceRef>
	<xsl:attribute name="number">
	  <xsl:value-of select="."/>
	</xsl:attribute>
	<xsl:attribute name="href">givenPrograms.xml</xsl:attribute>
      </pieceRef>
    </given-program>
  </xsl:template>

  <xsl:template match="$B<+M36J(B">
    <free-program>
      <xsl:choose>
	<xsl:when test="not($BAH6J(B)">
	  <p:piece>
	    <xsl:apply-templates/>
	  </p:piece>
	</xsl:when>
	<xsl:when test="$BAH6J(B">
	  <p:suite>
	    <xsl:apply-templates/>
	  </p:suite>
	</xsl:when>
      </xsl:choose>
    </free-program>
  </xsl:template>

  <xsl:template match="$B:n;m(B">
    <p:words-by>
      <xsl:apply-templates/>
    </p:words-by>
  </xsl:template>
  <xsl:template match="$B:n6J(B">
    <p:composed-by>
      <xsl:apply-templates/>
    </p:composed-by>
  </xsl:template>
  <xsl:template match="$BLu;m(B">
    <p:translated-by>
      <xsl:apply-templates/>
    </p:translated-by>
  </xsl:template>
  <xsl:template match="$B=PE5(B">
    <p:originated-from>
      <xsl:apply-templates/>
    </p:originated-from>
  </xsl:template>
  <xsl:template match="$BJT6J(B">
    <p:arranged-by>
      <xsl:apply-templates/>
    </p:arranged-by>
  </xsl:template>

  <xsl:template match="$B6JL>(B">
    <p:title original="true">
      <p:mainTitle>
	<xsl:apply-templates/>
      </p:mainTitle>
    </p:title>
  </xsl:template>
  <xsl:template match="$BAH6J(B">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="$B9=@.6J(B">
    <p:suite-piece>
      <xsl:apply-templates select="$B9=@.6JHV9f(B"/>
      <xsl:choose>
	<xsl:when test="$BAH6J(B">
	  <p:suite>
	    <xsl:apply-templates select="*[not(name()='$B9=@.6JHV9f(B')]"/>
	  </p:suite>
	</xsl:when>
	<xsl:when test="not($BAH6J(B)">
	  <p:piece>
	    <xsl:apply-templates select="*[not(name()='$B9=@.6JHV9f(B')]"/>
	  </p:piece>
	</xsl:when>
      </xsl:choose>
    </p:suite-piece>
  </xsl:template>
  <xsl:template match="$B9=@.6JHV9f(B">
    <p:piece-number>
      <xsl:apply-templates/>
    </p:piece-number>
  </xsl:template>

  <xsl:template match="$B:NE@7k2L(B">
    <scores>
      <xsl:apply-templates/>
    </scores>
  </xsl:template>
  <xsl:template match="$B:NE@(B">
    <score>
      <xsl:apply-templates select="node()|@*"/>
    </score>
  </xsl:template>
  <xsl:template match="@$B:NE@<T(B">
    <xsl:attribute name="referee">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  <xsl:template match="$BAm9gI>2A(B">
    <total-score>
      <xsl:apply-templates/>
    </total-score>
  </xsl:template>
  <xsl:template match="$B:NE@Hw9M(B">
    <score-note>
      <xsl:apply-templates/>
    </score-note>
  </xsl:template>

  <xsl:template match="$BCDBNHw9M(B">
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
