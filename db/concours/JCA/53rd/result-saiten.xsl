<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"
                xmlns:xt="http://www.jclark.com/xt"
                xmlns="http://www.w3.org/TR/REC-html40"
                extension-element-prefix="xt">
  <xsl:template name="saiten">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:value-of select="/大会/大会名" />
	  <xsl:text>: 採点表</xsl:text>
	</xsl:element>
	<xsl:call-template name="additional-header" />
      </xsl:element>
      <xsl:element name="body">
	<xsl:element name="h1">
	  <xsl:value-of select="/大会/大会名"/>
	  <xsl:text>: 採点表</xsl:text>
	</xsl:element>
	<xsl:call-template name="採点表全体"/>
	<xsl:call-template name="footer"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="採点表全体">
    <xsl:for-each select="部門結果">
      <xsl:element name="h2">
	<xsl:value-of select="部門名"/>
      </xsl:element>
      <xsl:call-template name="採点表"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="採点表">
    <xsl:element name="table">
      <xsl:attribute name="class">ajclresult</xsl:attribute>
      <xsl:attribute name="border">1</xsl:attribute>
      <xsl:call-template name="採点表ヘッダ"/>
      <xsl:call-template name="採点表ボディ"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="採点表ボディ">
    <xsl:element name="tbody">
      <xsl:for-each select="団体/採点結果">
	<xsl:sort order="ascending" data-type="number" select="../@出演順"/>
	<xsl:call-template name="採点表エントリ"/>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template name="採点表ヘッダ">
    <xsl:element name="thead">
      <xsl:element name="tr">
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	</xsl:element>
	<xsl:for-each select="//審査員">
	  <xsl:element name="th">
	    <xsl:attribute name="rowspan">1</xsl:attribute>
	    <xsl:attribute name="colspan">1</xsl:attribute>
	    <xsl:value-of select="@省略名"/>
	  </xsl:element>
	</xsl:for-each>
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	  <xsl:text>総合評価</xsl:text>
	</xsl:element>
	<xsl:element name="th">
	  <xsl:attribute name="rowspan">1</xsl:attribute>
	  <xsl:attribute name="colspan">1</xsl:attribute>
	  <xsl:text>備考</xsl:text>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="採点表エントリ">
    <xsl:element name="tr">
      <xsl:choose>
	<xsl:when test="../賞[.='金賞']"> 
	  <xsl:attribute name="bgcolor">#ffff99</xsl:attribute>
	</xsl:when>
	<xsl:when test="../賞[.='銀賞']">
	  <xsl:attribute name="bgcolor">silver</xsl:attribute>
	</xsl:when>
	<xsl:when test="../賞[.='銅賞']">
	  <xsl:attribute name="bgcolor">#ffcc99</xsl:attribute>
	</xsl:when>
      </xsl:choose>
      <xsl:element name="td">
	<xsl:attribute name="rowspan">1</xsl:attribute>
	<xsl:attribute name="colspan">1</xsl:attribute>
	<xsl:if test="../@出演順">
	  <xsl:value-of select="../@出演順"/>
	  <xsl:text>. </xsl:text>
	</xsl:if>
	<xsl:value-of select="../団体名"/>
      </xsl:element>
      <xsl:apply-templates match="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="採点結果">
    <xsl:apply-templates select="採点"/>
    <xsl:apply-templates select="総合評価"/>
    <xsl:apply-templates seledt="採点備考"/>
  </xsl:template>

  <xsl:template match="採点">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:attribute name="align">right</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="総合評価">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:attribute name="align">right</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="採点備考">
    <xsl:element name="td">
      <xsl:attribute name="rowspan">1</xsl:attribute>
      <xsl:attribute name="colspan">1</xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
