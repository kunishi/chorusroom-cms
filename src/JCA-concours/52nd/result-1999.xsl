<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">
  <xsl:output method="html"/>

  <xsl:template match="$BBg2q(B">
    <html>
      <head>
	<title>
	  <xsl:value-of select="$BBg2qL>(B"/>
	</title>
	<xsl:call-template name="additional-header"/>
      </head>
      <body>
	<h1><xsl:value-of select="$BBg2qL>(B"/></h1>
	<xsl:apply-templates select="$B3+:EF|JL7k2L(B"/>
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
    <address><a href="mailto:kunishi@c.oka-pu.ac.jp">$B9qEg>f@8(B &lt;kunishi@c.oka-pu.ac.jp&gt;</a></address>
    <p>$B$3$NJ8=q$O(B<xsl:value-of select="/$BBg2q(B/CVSID"/>$B$+$i<+F0E*$K@8@.$5$l$^$7$?!#(B</p>
  </xsl:template>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <dl>
      <xsl:apply-templates select="$B3+:EF|(B"/>
      <xsl:apply-templates select="$B3+:E>l=j(B"/>
      <xsl:call-template name="$B?3::0w%j%9%H(B"/>
      <xsl:call-template name="$BJs9p<T%j%9%H(B"/>
    </dl>
    <xsl:element name="hr"/>
    <xsl:apply-templates select="$BCm5-(B"/>
    <xsl:apply-templates select="$BItLg7k2L(B"/>
  </xsl:template>

  <xsl:template match="$B3+:EF|(B">
    <dt>$B3+:EF|(B</dt>
    <dd><xsl:value-of select="."/>(<xsl:value-of select="./@$BMKF|(B"/>)</dd>
  </xsl:template>
  <xsl:template match="$B3+:E>l=j(B">
    <dt>$B3+:E>l=j(B</dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>

  <xsl:template name="$B?3::0w%j%9%H(B">
    <dt>$B?3::0w(B</dt>
    <dd><xsl:apply-templates select="$B?3::0w(B"/></dd>
  </xsl:template>
  <xsl:template match="$B?3::0w(B">
    <xsl:value-of select="."/>
    <xsl:if test="@$B8*=q(B">
      (<xsl:value-of select="@$B8*=q(B"/>)
    </xsl:if>
    <xsl:if test="following-sibling::$B?3::0w(B">
      $B!"(B
    </xsl:if>
  </xsl:template>

  <xsl:template name="$BJs9p<T%j%9%H(B">
    <dt>$BJs9p<T(B</dt>
    <xsl:apply-templates select="$BJs9p<T(B"/>
  </xsl:template>
  <xsl:template match="$BJs9p<T(B">
    <dd>
      <xsl:value-of select="."/>
      <xsl:if test="not(@$BF?L>4uK>(B)">
	(<xsl:value-of select="@email"/>)
      </xsl:if>
    </dd>
  </xsl:template>

  <xsl:template match="$BCm5-(B">
    <ul>
      <xsl:apply-templates/>
    </ul>
    <xsl:element name="hr"/>
  </xsl:template>
  <xsl:template match="$BCm5-;v9`(B">
    <li><p><xsl:value-of select="."/></p></li>
  </xsl:template>

  <xsl:template match="$BItLg7k2L(B">
    <xsl:apply-templates select="$BItLgL>(B"/>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]">
      <h3>$B%7!<%ICDBN(B</h3>
      <ul>
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6b>^(B']]">
      <h3>$B6b>^(B</h3>
      <ul>
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B6b>^(B']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6d>^(B']]">
      <h3>$B6d>^(B</h3>
      <ul>
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B6d>^(B']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$BF<>^(B']]">
      <h3>$BF<>^(B</h3>
      <ul>
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$BF<>^(B']]"/>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[not($B>^(B)]">
      <h3>$B$=$N$[$+(B</h3>
      <ul>
	<xsl:apply-templates select="$BCDBN(B[not($B>^(B)]"/>
      </ul>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BItLgL>(B">
    <h2><xsl:value-of select="."/></h2>
  </xsl:template>

  <xsl:template match="$BCDBN(B">
    <li>
      <xsl:if test="@$BBg2qBeI=(B">$B!}(B</xsl:if>
      <xsl:apply-templates select="$BCDBNL>(B"/>
      (<xsl:apply-templates select="$B=jB08)(B"/>
      <xsl:apply-templates select="$B7ABV(B"/>
      <xsl:apply-templates select="$BEPO??M?t(B"/>
      <xsl:apply-templates select="$B;X4x<T(B"/>
      <xsl:apply-templates select="$B%T%"%N(B"/>
      <xsl:apply-templates select="$B6&1i<T(B"/>)
      <xsl:call-template name="$BFCJL>^%j%9%H(B"/>
      <xsl:apply-template select="$BCDBNHw9M(B"/>
      <xsl:apply-templates select="$B6JL\(B"/>
    </li>
  </xsl:template>

  <xsl:template match="$BCDBNL>(B">
    <xsl:if test="@url">
      <a href="{@url}"><xsl:value-of select="."/></a>
    </xsl:if>
    <xsl:if test="not(@url)">
      <xsl:value-of select="node()"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B=jB08)(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B7ABV(B">$B!&(B</xsl:if>
  </xsl:template>

  <xsl:template match="$B7ABV(B">
    <xsl:value-of select="."/>
    <xsl:if test="not(following-sibling::$BEPO??M?t(B)">, </xsl:if>
  </xsl:template>

  <xsl:template match="$BEPO??M?t(B">
    <xsl:value-of select="."/>$BL>(B
    <xsl:if test="following-sibling::$B;X4x<T(B">, </xsl:if>
  </xsl:template>

  <xsl:template match="$B;X4x<T(B">
    <xsl:if test="not(preceding-sibling::$B;X4x<T(B)">$B;X4x(B: </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B;X4x<T(B">$B!&(B</xsl:if>
    <xsl:if test="following-sibling::$B%T%"%N(B|following-sibling::$B6&1i<T(B">, </xsl:if>
  </xsl:template>

  <xsl:template match="$B%T%"%N(B">
    <xsl:if test="not(preceding-sibling::$B%T%"%N(B)">$B%T%"%N(B: </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B%T%"%N(B">$B!&(B</xsl:if>
    <xsl:if test="following-sibling::$B6&1i<T(B">, </xsl:if>
  </xsl:template>

  <xsl:template match="$B6&1i<T(B">
    <xsl:value-of select="@$B1iAU3Z4o(B"/>: <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B6&1i<T(B">, </xsl:if>
  </xsl:template>

  <xsl:template match="$B>^(B">
  </xsl:template>

  <xsl:template name="$BFCJL>^%j%9%H(B">
    <xsl:if test="$BFCJL>^(B">
      [<xsl:apply-templates select="$BFCJL>^(B"/>]
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BFCJL>^(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$BFCJL>^(B">, </xsl:if>
  </xsl:template>

  <xsl:template match="$BCDBNHw9M(B">
    (<xsl:value-of select="."/>)
  </xsl:template>

  <xsl:template match="$B6JL\(B">
    <ul>
      <xsl:apply-templates select="$B2]Bj6J(B"/>
      <xsl:apply-templates select="$B<+M36J(B"/>
    </ul>
  </xsl:template>

  <xsl:template match="$B2]Bj6J(B">
    <li><xsl:value-of select="text()"/></li>
  </xsl:template>

  <xsl:template match="$B<+M36J(B">
    <li>
      <xsl:apply-templates select="$B=PE5(B"/>
      <xsl:apply-templates select="$B:n;m(B"/>
      <xsl:apply-templates select="$B:n6J(B"/>
      <xsl:apply-templates select="$BJT6J(B"/>: 
      <xsl:if test="$B6JL>(B"><xsl:apply-templates select="$B6JL>(B"/></xsl:if>
      <xsl:if test="$BAH6J(B"><xsl:apply-templates select="$BAH6J(B"/></xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="$B=PE5(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B:n6J(B">$B!&(B</xsl:if>
  </xsl:template>
  <xsl:template match="$B:n;m(B">
    <xsl:value-of select="."/>$B:n;m(B
    <xsl:if test="following-sibling::$B:n6J(B">$B!&(B</xsl:if>
  </xsl:template>
  <xsl:template match="$B:n6J(B">
    <xsl:value-of select="."/>$B:n6J(B
    <xsl:if test="following-sibling::$BJT6J(B">$B!&(B</xsl:if>
  </xsl:template>
  <xsl:template match="$BJT6J(B">
    <xsl:value-of select="."/>$BJT6J(B
  </xsl:template>

  <xsl:template match="$B6JL>(B">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="$BAH6J(B">
    <xsl:value-of select="$BAH6JL>(B"/>
    <xsl:if test="@$BH4?h(B = 'yes'">$B$+$i(B</xsl:if>
     
    <xsl:apply-templates select="$BAH6J%T!<%9(B"/>
  </xsl:template>

  <xsl:template match="$BAH6J%T!<%9(B">
    <xsl:apply-templates select="$B%T!<%96JL>(B"/>
  </xsl:template>

  <xsl:template match="$B%T!<%96JL>(B">
    <xsl:if test="@$B%T!<%9HV9f(B"><xsl:value-of select="@$B%T!<%9HV9f(B"/>. </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="../$B:n;m(B or ../$B=PE5(B">
      (<xsl:apply-templates select="../$B=PE5(B"/><xsl:apply-templates select="../$B:n;m(B"/>)</xsl:if>
    <xsl:if test="../following-sibling::$BAH6J%T!<%9(B">; </xsl:if>
  </xsl:template>

</xsl:stylesheet>
