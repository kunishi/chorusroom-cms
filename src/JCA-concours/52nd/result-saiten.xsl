<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"
                xmlns:xt="http://www.jclark.com/xt"
                xmlns="http://www.w3.org/TR/REC-html40"
                extension-element-prefix="xt">
  <xsl:template name="saiten">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B" />
	  <xsl:text>: $B:NE@I=(B</xsl:text>
	</xsl:element>
	<xsl:call-template name="additional-header" />
      </xsl:element>
      <xsl:element name="body">
	<xsl:element name="h1">
	  <xsl:value-of select="/$BBg2q(B/$BBg2qL>(B"/>
	  <xsl:text>: $B:NE@I=(B</xsl:text>
	</xsl:element>
	<xsl:call-template name="$B:NE@I=A4BN(B"/>
	<xsl:call-template name="footer"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B:NE@I=A4BN(B">
    <xsl:for-each select="$BItLg7k2L(B">
      <xsl:element name="h2">
	<xsl:value-of select="$BItLgL>(B"/>
      </xsl:element>
      <xsl:call-template name="$B:NE@I=(B"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="$B:NE@I=(B">
    <xsl:element name="table">
      <xsl:attribute name="class">ajclresult</xsl:attribute>
      <xsl:attribute name="border">1</xsl:attribute>
      <xsl:call-template name="$B:NE@I=%X%C%@(B"/>
      <xsl:call-template name="$B:NE@I=%\%G%#(B"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B:NE@I=%\%G%#(B">
    <xsl:element name="tbody">
      <xsl:for-each select="$BCDBN(B/$B:NE@7k2L(B">
	<xsl:sort order="ascending" data-type="number" select="../@$B=P1i=g(B"/>
	<xsl:call-template name="$B:NE@I=%(%s%H%j(B"/>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B:NE@I=%X%C%@(B">
    <xsl:element name="thead">
      <xsl:element name="tr">
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	</xsl:element>
	<xsl:for-each select="//$B?3::0w(B">
	  <xsl:element name="th">
	    <xsl:attribute name="rowspan">1</xsl:attribute>
	    <xsl:attribute name="colspan">1</xsl:attribute>
	    <xsl:value-of select="@$B>JN,L>(B"/>
	  </xsl:element>
	</xsl:for-each>
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	  <xsl:text>$BAm9gI>2A(B</xsl:text>
	</xsl:element>
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	  <xsl:text>$BHw9M(B</xsl:text>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="$B:NE@I=%(%s%H%j(B">
    <xsl:element name="tr">
      <xsl:choose>
	<xsl:when test="../$B>^(B[.='$B6b>^(B']"> 
	  <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
	</xsl:when>
	<xsl:when test="../$B>^(B[.='$B6d>^(B']">
	  <xsl:attribute name="bgcolor">silver</xsl:attribute>
	</xsl:when>
	<xsl:when test="../$B>^(B[.='$BF<>^(B']">
	  <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:element name="td">
	<xsl:attribute name="rowspan">1</xsl:attribute>
	<xsl:attribute name="colspan">1</xsl:attribute>
	<xsl:if test="../@$B=P1i=g(B">
	  <xsl:value-of select="../@$B=P1i=g(B"/>
	  <xsl:text>. </xsl:text>
	</xsl:if>
	<xsl:value-of select="../$BCDBNL>(B"/>
      </xsl:element>
      <xsl:apply-templates match="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$B:NE@7k2L(B">
    <xsl:apply-templates select="$B:NE@(B"/>
    <xsl:apply-templates select="$BAm9gI>2A(B"/>
    <xsl:apply-templates seledt="$B:NE@Hw9M(B"/>
  </xsl:template>

  <xsl:template match="$B:NE@(B">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:attribute name="align">right</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$BAm9gI>2A(B">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:attribute name="align">right</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="$B:NE@Hw9M(B">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
