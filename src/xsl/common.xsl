<?xml version="1.0" encoding="iso-2022-jp"?>

<!-- $Id: common.xsl,v 1.2 2000/10/08 23:38:08 kunishi Exp $ -->

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="bgimage">background.png</xsl:param>
  <xsl:param name="styledir">/style</xsl:param>
  <xsl:param name="stylesheet">default.css</xsl:param>

  <xsl:template name="additional-header">
    <link>
      <xsl:attribute name="href">
        <xsl:value-of select="concat($styledir, '/', $stylesheet)"/>
      </xsl:attribute>
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
      <xsl:text>body { background-image: url(</xsl:text>
      <xsl:value-of select="concat($imagedir, '/', $bgimage)"/>
      <xsl:text>); }</xsl:text>
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

  <xsl:template name="footer">
    <hr/>
    <div>
      <xsl:attribute name="class">footer</xsl:attribute>
      <address>
        <a>
          <xsl:attribute name="href">mailto:kunishi@c.oka-pu.ac.jp</xsl:attribute>
          <xsl:choose>
            <xsl:when test="$output-encoding='iso-8859-1'">
              <xsl:text>KUNISHIMA Takeo &lt;kunishi@c.oka-pu.ac.jp&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>国島丈生 &lt;kunishi@c.oka-pu.ac.jp&gt;</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </address>
      <p>
        <xsl:text>Copyright (C) 2000 Takeo Kunishima.  All rights reserved.</xsl:text>
      </p>
      <xsl:call-template name="additional-footer"/>
    </div>
  </xsl:template>

  <xsl:template name="additional-footer"/>

</xsl:stylesheet>
