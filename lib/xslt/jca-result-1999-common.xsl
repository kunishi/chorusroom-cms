<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: jca-result-1999-common.xsl,v 1.9 1999/11/14 01:29:57 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">

  <xsl:template match="$BBg2q(B">
    <xsl:apply-templates select="$B3+:EF|JL7k2L(B"/>
  </xsl:template>

  <!--
   xsl:template match="$B3+:EF|JL7k2L(B" $B$O!"3F(B encoding $BJL(B xsl $B%U%!%$%k(B
   $B$KDj5A$5$l$F$$$^$9!#(B
  -->    

  <xsl:template name="main">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B"/>
	</xsl:element>
	<xsl:call-template name="additional-header"/>
      </xsl:element>
      <xsl:element name="body">
	<xsl:call-template name="encodinglink"/>
	<xsl:element name="h1">
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B"/>
	</xsl:element>
	<xsl:element name="hr"/>
	<xsl:element name="dl">
	  <xsl:call-template name="$B3+:EF|%j%9%H(B"/>
	  <xsl:apply-templates select="$B3+:E>l=j(B"/>
	  <xsl:call-template name="$B?3::0w%j%9%H(B"/>
	  <xsl:call-template name="$BJs9p<T%j%9%H(B"/>
	</xsl:element>
	<xsl:apply-templates select="$BCm5-(B"/>
	<xsl:call-template name="$B:NE@7k2L%j%s%/(B"/>
	<xsl:element name="hr"/>
	<xsl:apply-templates select="$BItLg7k2L(B"/>
	<xsl:call-template name="footer"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="additional-header">
    <xsl:element name="link">
      <xsl:attribute name="href">
	<xsl:text>../../style/jca-concour.css</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="type">
	<xsl:text>text/css</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="rel">
	<xsl:text>stylesheet</xsl:text>
      </xsl:attribute>
    </xsl:element>
    <xsl:element name="link">
      <xsl:attribute name="href">
	<xsl:text>mailto:kunishi@c.oka-pu.ac.jp</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="rev">
	<xsl:text>made</xsl:text>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="encodinglink">
    <xsl:element name="p">
      <xsl:if test="$suffix=$utfhtmlsuffix">
	<xsl:element name="a">
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@$B=PNO(B, $htmlsuffix)" />
	  </xsl:attribute>
	  <xsl:text>EUC-JP$B%Z!<%8(B</xsl:text>
	</xsl:element>
      </xsl:if>
      <xsl:if test="$suffix=$htmlsuffix">
	<xsl:element name="a">
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@$B=PNO(B, $utfhtmlsuffix)"/>
	  </xsl:attribute>
	  <xsl:text>UTF-8$B%Z!<%8(B</xsl:text>
	</xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template name="footer">
    <xsl:element name="hr"/>
    <xsl:element name="address">
      <xsl:element name="a">
	<xsl:attribute name="href">
	  <xsl:text>mailto:kunishi@c.oka-pu.ac.jp</xsl:text>
	</xsl:attribute>
        <xsl:text>$B9qEg>f@8(B &lt;kunishi@c.oka-pu.ac.jp&gt;</xsl:text>
      </xsl:element>
    </xsl:element>
    <xsl:element name="p">
      <xsl:text>$B$3$NJ8=q$O(B</xsl:text>
      <xsl:value-of select="/$BBg2q(B/CVSID"/>
      <xsl:text>$B$+$i<+F0E*$K@8@.$5$l$^$7$?!#(B</xsl:text>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B3+:EF|%j%9%H(B">
    <xsl:if test="child::$B3+:EF|(B">
      <xsl:element name="dt">
	<xsl:text>$B3+:EF|(B</xsl:text>
      </xsl:element>
      <xsl:element name="dd">
	<xsl:apply-templates select="$B3+:EF|(B"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B3+:EF|(B">
    <xsl:value-of select="."/>
    <xsl:text>(</xsl:text>
    <xsl:value-of select="./@$BMKF|(B"/>
    <xsl:text>)</xsl:text>
    <xsl:if test="following-sibling::$B3+:EF|(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B3+:E>l=j(B">
    <xsl:element name="dt">
      <xsl:text>$B3+:E>l=j(B</xsl:text>
    </xsl:element>
    <xsl:element name="dd">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B?3::0w%j%9%H(B">
    <xsl:if test="child::$B?3::0w(B">
      <xsl:element name="dt">
	<xsl:text>$B?3::0w(B</xsl:text>
      </xsl:element>
      <xsl:element name="dd">
	<xsl:apply-templates select="$B?3::0w(B"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$B?3::0w(B">
    <xsl:value-of select="."/>
    <xsl:if test="@$B8*=q(B or @$BHw9M(B">
      <xsl:text>(</xsl:text>
      <xsl:if test="@$B8*=q(B">
	<xsl:value-of select="@$B8*=q(B"/>
	<xsl:if test="@$BHw9M(B"><xsl:text>$B!"(B</xsl:text></xsl:if>
      </xsl:if>
      <xsl:if test="@$BHw9M(B"><xsl:value-of select="@$BHw9M(B"/></xsl:if>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="following-sibling::$B?3::0w(B">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="$BJs9p<T%j%9%H(B">
    <xsl:element name="dt">
      <xsl:text>$BJs9p<T(B</xsl:text>
    </xsl:element>
    <xsl:apply-templates select="$BJs9p<T(B"/>
  </xsl:template>
  <xsl:template match="$BJs9p<T(B">
    <xsl:element name="dd">
      <xsl:if test="@$BF?L>4uK>(B[.='yes']">
	<xsl:text>$BF?L>4uK>(B</xsl:text>
      </xsl:if>
      <xsl:if test="not(@$BF?L>4uK>(B[.='yes'])">
	<xsl:apply-templates select="$BJs9p<T;aL>(B"/>
	<xsl:apply-templates select="email"/>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$BJs9p<T;aL>(B">
    <xsl:if test="@$B%Z%s%M!<%`(B">
      <xsl:value-of select="@$B%Z%s%M!<%`(B"/>
    </xsl:if>
    <xsl:if test="not(@$B%Z%s%M!<%`(B)">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="email">
    <xsl:if test="not(@email$BF?L>(B[.='yes'])">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="$B:NE@7k2L%j%s%/(B">
    <xsl:if test=".//$B:NE@7k2L(B">
      <xsl:element name="ul">
	<xsl:element name="li">
	  <xsl:element name="p">
	    <xsl:text>$B:NE@I=$r(B</xsl:text>
	    <xsl:element name="a">
	      <xsl:attribute name="href">
		<xsl:value-of select="concat(@$B=PNO(B, '-saiten', $suffix)"/>
	      </xsl:attribute>
	      <xsl:text>$BJL%Z!<%8(B</xsl:text>
	    </xsl:element>
	    <xsl:text>$B$K$^$H$a$F$"$j$^$9!#(B</xsl:text>
	  </xsl:element>
	</xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$BCm5-(B">
    <xsl:element name="ul">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="$BCm5-;v9`(B">
    <xsl:element name="li">
      <xsl:element name="p">
	<xsl:value-of select="."/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$BItLg7k2L(B">
    <xsl:apply-templates select="$BItLgL>(B"/>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]">
      <xsl:element name="h3">
	<xsl:text>$B%7!<%ICDBN(B</xsl:text>
      </xsl:element>
      <xsl:element name="ul">
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6b>^(B']]">
      <xsl:element name="h3">
	<xsl:text>$B6b>^(B</xsl:text>
      </xsl:element>
      <xsl:element name="ul">
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B6b>^(B']]"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6d>^(B']]">
      <xsl:element name="h3">
	<xsl:text>$B6d>^(B</xsl:text>
      </xsl:element>
      <xsl:element name="ul">
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$B6d>^(B']]"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$BF<>^(B']]">
      <xsl:element name="h3">
	<xsl:text>$BF<>^(B</xsl:text>
      </xsl:element>
      <xsl:element name="ul">
	<xsl:apply-templates select="$BCDBN(B[$B>^(B[.='$BF<>^(B']]"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="$BCDBN(B[not($B>^(B)]">
      <xsl:element name="h3">
	<xsl:text>$B$=$N$[$+(B</xsl:text>
      </xsl:element>
      <xsl:element name="ul">
	<xsl:apply-templates select="$BCDBN(B[not($B>^(B)]"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BItLgL>(B">
    <xsl:element name="h2">
      <xsl:value-of select="."/>
      <xsl:if test="@$B3+:EF|(B">
	<xsl:text> (</xsl:text>
	<xsl:value-of select="@$B3+:EF|(B"/>
	<xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$BCDBN(B">
    <xsl:element name="li">
      <xsl:if test="@$BBg2qBeI=(B[.='yes']">
	<xsl:text>$B!}(B</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="$BCDBNL>(B"/>
      <xsl:call-template name="$BCDBN%G!<%?(B"/>
      <xsl:call-template name="$BFCJL>^%j%9%H(B"/>
      <xsl:apply-templates select="$BCDBNHw9M(B"/>
      <xsl:apply-templates select="$B6JL\(B"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$BCDBNL>(B">
    <xsl:if test="@url">
      <xsl:element name="a">
	<xsl:attribute name="href">
	  <xsl:value-of select="@url"/>
	</xsl:attribute>
	<xsl:value-of select="."/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="not(@url)">
      <xsl:value-of select="node()"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="$BCDBN%G!<%?(B">
    <xsl:if test="($B=jB08)(B and not(//$BBg2qL>(B[@$B8)Bg2q(B]))
                  or $B7ABV(B or $BEPO??M?t(B or $B;X4x<T(B or $B%T%"%N(B or $B6&1i<T(B">
      <xsl:text> (</xsl:text>
      <xsl:if test="not(//$BBg2qL>(B[@$B8)Bg2q(B='yes'])">
	<xsl:apply-templates select="$B=jB08)(B"/>
      </xsl:if>
      <xsl:apply-templates select="$B7ABV(B"/>
      <xsl:apply-templates select="$BEPO??M?t(B"/>
      <xsl:apply-templates select="$B;X4x<T(B"/>
      <xsl:apply-templates select="$B%T%"%N(B"/>
      <xsl:apply-templates select="$B6&1i<T(B"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B=jB08)(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B7ABV(B">$B!&(B</xsl:if>
    <xsl:if test="not(following-sibling::$B7ABV(B)
	    and not(following-sibling::$BEPO??M?t(B)
	    and (following-sibling::$B;X4x<T(B
	    or following-sibling::$B%T%"%N(B
	    or following-sibling::$B6&1i<T(B)">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B7ABV(B">
    <xsl:value-of select="."/>
    <xsl:if test="not(following-sibling::$BEPO??M?t(B)">, </xsl:if>
  </xsl:template>

  <xsl:template match="$BEPO??M?t(B">
    <xsl:value-of select="."/>
    <xsl:text>$BL>(B</xsl:text>
    <xsl:if test="following-sibling::$B;X4x<T(B or following-sibling::$B%T%"%N(B">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B;X4x<T(B">
    <xsl:if test="not(preceding-sibling::$B;X4x<T(B)">
      <xsl:text>$B;X4x(B: </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B;X4x<T(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
    <xsl:if test="following-sibling::$B%T%"%N(B|following-sibling::$B6&1i<T(B">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B%T%"%N(B">
    <xsl:if test="not(preceding-sibling::$B%T%"%N(B)">
      <xsl:text>$B%T%"%N(B: </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B%T%"%N(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
    <xsl:if test="following-sibling::$B6&1i<T(B">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B6&1i<T(B">
    <xsl:value-of select="@$B1iAU3Z4o(B"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B6&1i<T(B">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B>^(B">
  </xsl:template>

  <xsl:template name="$BFCJL>^%j%9%H(B">
    <xsl:if test="$BFCJL>^(B">
      <xsl:text> [</xsl:text>
      <xsl:apply-templates select="$BFCJL>^(B"/>
      <xsl:text>]</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BFCJL>^(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$BFCJL>^(B">
      <xsl:text>, </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$BCDBNHw9M(B">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="$B6JL\(B">
    <xsl:element name="ul">
      <xsl:apply-templates select="$B2]Bj6J(B"/>
      <xsl:apply-templates select="$B<+M36J(B"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$B2]Bj6J(B">
    <xsl:element name="li">
      <xsl:value-of select="text()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$B<+M36J(B">
    <xsl:element name="li">
      <xsl:apply-templates select="$B=PE5(B"/>
      <xsl:apply-templates select="$B:n;m(B"/>
      <xsl:apply-templates select="$BLu;m(B"/>
      <xsl:apply-templates select="$B:n6J(B"/>
      <xsl:apply-templates select="$BJT6J(B"/>
      <xsl:if test="$B=PE5(B or $B:n;m(B or $BLu;m(B or $B:n6J(B or $BJT6J(B">
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:if test="$B6JL>(B"><xsl:apply-templates select="$B6JL>(B"/></xsl:if>
      <xsl:if test="$BAH6J(B"><xsl:apply-templates select="$BAH6J(B"/></xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$B=PE5(B">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::$B:n;m(B or following-sibling::$B:n6J(B
                  or following-sibling::$BJT6J(B or following-sibling::$BLu;m(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$B:n;m(B">
    <xsl:value-of select="."/>
    <xsl:text>$B:n;m(B</xsl:text>
    <xsl:if test="following-sibling::$B:n6J(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$B:n6J(B">
    <xsl:value-of select="."/>
    <xsl:text>$B:n6J(B</xsl:text>
    <xsl:if test="following-sibling::$BJT6J(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BJT6J(B">
    <xsl:value-of select="."/>
    <xsl:text>$BJT6J(B</xsl:text>
  </xsl:template>
  <xsl:template match="$BLu;m(B">
    <xsl:value-of select="."/>
    <xsl:text>$BLu;m(B</xsl:text>
    <xsl:if test="following-sibling::$B:n6J(B">
      <xsl:text>$B!&(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B6JL>(B">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="$BAH6J(B">
    <xsl:value-of select="$BAH6JL>(B"/>
    <xsl:if test="@$BH4?h(B = 'yes'">
      <xsl:text>$B$+$i(B</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$B9=@.6J(B"/>
  </xsl:template>

  <xsl:template match="$B9=@.6J(B">
    <xsl:apply-templates select="$B%T!<%96JL>(B"/>
  </xsl:template>

  <xsl:template match="$B%T!<%96JL>(B">
    <xsl:text>$B!V(B</xsl:text>
    <xsl:if test="@$B%T!<%9HV9f(B"><xsl:value-of select="@$B%T!<%9HV9f(B"/>
      <xsl:text>. </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
    <xsl:text>$B!W(B</xsl:text>
    <xsl:if test="../$B:n;m(B or ../$B=PE5(B or ../$BLu;m(B">
      <xsl:text>(</xsl:text>
      <xsl:apply-templates select="../$B=PE5(B"/>
      <xsl:apply-templates select="../$B:n;m(B"/>
      <xsl:apply-templates select="../$BLu;m(B"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="../following-sibling::$B9=@.6J(B">
      <xsl:text></xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
