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
    <xsl:apply-templates select="$BBg2q(B/$B3+:EF|JL7k2L(B[@$B=PNO(B=$output-base]"/>
  </xsl:template>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <redirect:write file="{concat(@$B=PNO(B, $suffix)}">
      <xsl:call-template name="main"/>
    </redirect:write>
    <xsl:if test=".//$B:NE@7k2L(B">
      <redirect:write file="{concat(@$B=PNO(B, '-saiten', $suffix)}">
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
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B"/>
	</title>
      </head>
      <body>
	<xsl:call-template name="encodinglink"/>
        <h1>
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B"/>
	</h1>
        <hr/>
	<dl>
	  <xsl:call-template name="$B3+:EF|%j%9%H(B"/>
	  <xsl:apply-templates select="$B3+:E>l=j(B"/>
	  <xsl:call-template name="$B?3::0w%j%9%H(B"/>
	  <xsl:call-template name="$BJs9p<T%j%9%H(B"/>
	</dl>
	<xsl:apply-templates select="$BCm5-(B"/>
	<xsl:call-template name="$B:NE@7k2L%j%s%/(B"/>
        <hr/>
	<xsl:apply-templates select="$BItLg7k2L(B"/>
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
	    <xsl:value-of select="concat(@$B=PNO(B, $htmlsuffix)" />
	  </xsl:attribute>
	  <xsl:text>JIS$B%Z!<%8(B</xsl:text>
	</a>
      </xsl:if>
      <xsl:if test="$suffix=$htmlsuffix">
	<a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat(@$B=PNO(B, $utfhtmlsuffix)"/>
	  </xsl:attribute>
	  <xsl:text>UTF-8$B%Z!<%8(B</xsl:text>
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
          <xsl:text>$B9qEg>f@8(B &lt;kunishi@c.oka-pu.ac.jp&gt;</xsl:text>
        </a>
      </address>
      <p>
        <xsl:text>$B$3$NJ8=q$O(B</xsl:text>
        <xsl:value-of select="/$BBg2q(B/CVSID"/>
        <xsl:text>$B$+$i<+F0E*$K@8@.$5$l$^$7$?!#(B</xsl:text>
      </p>
      <p>
        <xsl:text>Copyright (C) 2000 Takeo Kunishima.  All rights reserved.</xsl:text>
      </p>
    </div>
  </xsl:template>

  <xsl:template name="$B3+:EF|%j%9%H(B">
    <xsl:if test="child::$B3+:EF|(B">
      <dt>$B3+:EF|(B</dt>
      <dd>
	<xsl:apply-templates select="$B3+:EF|(B"/>
      </dd>
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
    <dt>$B3+:E>l=j(B</dt>
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>

  <xsl:template name="$B?3::0w%j%9%H(B">
    <xsl:if test="child::$B?3::0w(B">
      <dt>$B?3::0w(B</dt>
      <dd>
	<xsl:apply-templates select="$B?3::0w(B"/>
      </dd>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$B?3::0w(B">
    <xsl:apply-templates/>
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
    <dt>$BJs9p<T(B</dt>
    <xsl:apply-templates select="$BJs9p<T(B"/>
  </xsl:template>
  <xsl:template match="$BJs9p<T(B">
    <dd>
      <xsl:choose>
        <xsl:when test="@$BF?L>4uK>(B[.='yes']">
          <xsl:text>$BF?L>4uK>(B</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$BJs9p<T;aL>(B"/>
          <xsl:apply-templates select="email"/>
        </xsl:otherwise>
      </xsl:choose>
    </dd>
  </xsl:template>

  <xsl:template match="$BJs9p<T;aL>(B">
    <xsl:choose>
      <xsl:when test="@$B%Z%s%M!<%`(B">
        <xsl:value-of select="@$B%Z%s%M!<%`(B"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
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
      <ul>
	<li>
	  <p>
	    <xsl:text>$B:NE@I=$r(B</xsl:text>
	    <a>
	      <xsl:attribute name="href">
		<xsl:value-of select="concat(@$B=PNO(B, '-saiten', $suffix)"/>
	      </xsl:attribute>
	      <xsl:text>$BJL%Z!<%8(B</xsl:text>
	    </a>
	    <xsl:text>$B$K$^$H$a$F$"$j$^$9!#(B</xsl:text>
	  </p>
	</li>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$BCm5-(B">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="$BCm5-;v9`(B">
    <li>
      <p>
	<xsl:value-of select="."/>
      </p>
    </li>
  </xsl:template>

  <xsl:template match="$BItLg7k2L(B">
    <xsl:apply-templates select="$BItLgL>(B"/>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]">
      <h3>$B%7!<%ICDBN(B</h3>
      <ul>
        <xsl:for-each select="$BCDBN(B[$B>^(B[.='$B%7!<%I(B']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6b>^(B']]">
      <h3>$B6b>^(B</h3>
      <ul>
        <xsl:for-each select="$BCDBN(B[$B>^(B[.='$B6b>^(B']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$B6d>^(B']]">
      <h3>$B6d>^(B</h3>
      <ul>
        <xsl:for-each select="$BCDBN(B[$B>^(B[.='$B6d>^(B']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[$B>^(B[.='$BF<>^(B']]">
      <h3>$BF<>^(B</h3>
      <ul>
        <xsl:for-each select="$BCDBN(B[$B>^(B[.='$BF<>^(B']]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="$BCDBN(B[not($B>^(B)]">
      <h3>$B$=$N$[$+(B</h3>
      <ul>
        <xsl:for-each select="$BCDBN(B[not($B>^(B)]">
          <li>
            <xsl:apply-templates select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$BItLgL>(B">
    <h2>
      <xsl:value-of select="."/>
      <xsl:if test="@$B3+:EF|(B">
	<xsl:text> (</xsl:text>
	<xsl:value-of select="@$B3+:EF|(B"/>
	<xsl:text>)</xsl:text>
      </xsl:if>
    </h2>
  </xsl:template>

  <xsl:template match="$BCDBN(B">
    <xsl:if test="@$BBg2qBeI=(B[.='yes']">
      <xsl:text>$B!}(B</xsl:text>
    </xsl:if>
    <xsl:if test="@$BMhG/EY%7!<%I(B[.='yes']">
      <xsl:text>$B!}(B</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$BCDBNL>(B"/>
    <xsl:call-template name="$BCDBN%G!<%?(B"/>
    <xsl:call-template name="$BFCJL>^%j%9%H(B"/>
    <xsl:apply-templates select="$BCDBNHw9M(B"/>
    <xsl:apply-templates select="$B6JL\(B"/>
  </xsl:template>

  <xsl:template match="$BCDBNL>(B">
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

  <xsl:template name="$BCDBN%G!<%?(B">
    <xsl:if test="($B=jB08)(B and not(//$BBg2qL>(B[@$B8)Bg2q(B]))
                  or $B7ABV(B or $BEPO??M?t(B or $B;X4x<T(B or $B%T%"%N(B or $B6&1i<T(B">
      <xsl:text> (</xsl:text>
      <xsl:for-each select="child::*[name()='$B=jB08)(B' or name()='$B7ABV(B'
                            or name()='$BEPO??M?t(B']">
        <xsl:call-template name="$BCDBN%G!<%?$=$N(B1"/>
      </xsl:for-each>
      <xsl:if test="(($B=jB08)(B and not(//$BBg2qL>(B[@$B8)Bg2q(B])) or $B7ABV(B or $BEPO??M?t(B)
                    and ($B;X4x<T(B or $B%T%"%N(B or $B6&1i<T(B)">
	<xsl:text>$B!"(B</xsl:text>
      </xsl:if>
      <xsl:call-template name="$B1iAU<T%G!<%?(B"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="$BCDBN%G!<%?$=$N(B1">
    <xsl:choose>
      <xsl:when test="name()='$B=jB08)(B'">
        <xsl:if test="not(//$BBg2qL>(B[@$B8)Bg2q(B='yes'])">
          <xsl:apply-templates select="current()"/>
          <xsl:if test="following-sibling::$B7ABV(B
                        or following-sibling::$BEPO??M?t(B">
            <xsl:text>$B!&(B</xsl:text>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:when test="name()='$B7ABV(B'">
        <xsl:apply-templates select="current()"/>
      </xsl:when>
      <xsl:when test="name()='$BEPO??M?t(B'">
        <xsl:apply-templates select="current()"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="$B=jB08)(B">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="$B7ABV(B">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="$BEPO??M?t(B">
    <xsl:value-of select="."/>
    <xsl:text>$BL>(B</xsl:text>
  </xsl:template>

  <xsl:template name="$B1iAU<T%G!<%?(B">
    <xsl:call-template name="$B;X4x<T%j%9%H(B"/>
    <xsl:if test="$B%T%"%N(B">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
    <xsl:call-template name="$B%T%"%N%j%9%H(B"/>
    <xsl:if test="$B6&1i<T(B">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$B6&1i<T(B"/>
  </xsl:template>

  <xsl:template name="$B;X4x<T%j%9%H(B">
    <xsl:for-each select="$B;X4x<T(B">
      <xsl:if test="position()=1">
	<xsl:text>$B;X4x(B</xsl:text>
	<xsl:if test="@$B7sG$(B">
	  <xsl:text>$B!&(B</xsl:text>
	  <xsl:value-of select="@$B7sG$(B"/>
	</xsl:if>
	<xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="not(position()=last())">
	<xsl:text>$B!&(B</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="$B%T%"%N%j%9%H(B">
    <xsl:for-each select="$B%T%"%N(B">
      <xsl:if test="position()=1">
	<xsl:text>$B%T%"%N(B: </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="not(position()=last())">
	<xsl:text>$B!&(B</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="$B6&1i<T(B">
    <xsl:value-of select="@$B1iAU3Z4o(B"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::$B6&1i<T(B">
      <xsl:text>$B!"(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B>^(B">
  </xsl:template>

  <xsl:template name="$BFCJL>^%j%9%H(B">
    <xsl:if test="$BFCJL>^(B">
      <xsl:text> [</xsl:text>
      <xsl:for-each select="$BFCJL>^(B">
	<xsl:apply-templates/>
	<xsl:if test="not(position()=last())">
	  <xsl:text>$B!"(B</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:text>]</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="$BFCJL>^(B">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="$BCDBNHw9M(B">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="$B6JL\(B">
    <ul>
      <xsl:apply-templates select="$B2]Bj6J(B"/>
      <xsl:apply-templates select="$B<+M36J(B"/>
    </ul>
  </xsl:template>

  <xsl:template match="$B2]Bj6J(B">
    <li>
      <xsl:value-of select="@$BHV9f(B"/>
    </li>
  </xsl:template>

  <xsl:template match="$B<+M36J(B">
    <li>
      <xsl:for-each select="child::*[name()='$B=PE5(B' or name()='$B:n;m(B'
                            or name()='$BLu;m(B' or name()='$B:n6J(B'
                            or name()='$BJT6J(B']">
        <xsl:apply-templates select="current()"/>
        <xsl:choose>
          <xsl:when test="position()=last()">
            <xsl:text>: </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>$B!&(B</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
      <xsl:apply-templates select="$B6JL>(B"/>
      <xsl:apply-templates select="$BAH6J(B"/>
    </li>
  </xsl:template>

  <xsl:template match="$B=PE5(B">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="$B:n;m(B">
    <xsl:apply-templates/>
    <xsl:text>$B:n;m(B</xsl:text>
  </xsl:template>
  <xsl:template match="$BLu;m(B">
    <xsl:apply-templates/>
    <xsl:text>$BLu;m(B</xsl:text>
  </xsl:template>
  <xsl:template match="$B:n6J(B">
    <xsl:apply-templates/>
    <xsl:text>$B:n6J(B</xsl:text>
  </xsl:template>
  <xsl:template match="$BJT6J(B">
    <xsl:apply-templates/>
    <xsl:text>$BJT6J(B</xsl:text>
  </xsl:template>

  <xsl:template match="$B6JL>(B">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="$BAH6J(B">
    <xsl:apply-templates select="$B6JL>(B"/>
    <xsl:if test="@$BH4?h(B = 'yes'">
      <xsl:text>$B$+$i(B </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$B9=@.6J(B"/>
  </xsl:template>

  <xsl:template match="$B9=@.6J(B">
    <xsl:if test="not($B9=@.6J(B)">
      <xsl:text>$B!V(B</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$B9=@.6JHV9f(B"/>
    <xsl:apply-templates select="$B6JL>(B"/>
    <xsl:if test="$B:n;m(B or $B=PE5(B or $BLu;m(B or $B:n6J(B">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates select="$B=PE5(B"/>
      <xsl:apply-templates select="$B:n;m(B"/>
      <xsl:apply-templates select="$BLu;m(B"/>
      <xsl:apply-templates select="$B:n6J(B"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="$B9=@.6J(B">
      <xsl:apply-templates select="$B9=@.6J(B" />
    </xsl:if>
    <xsl:if test="not($B9=@.6J(B)">
      <xsl:text>$B!W(B</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="$B9=@.6JHV9f(B">
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
