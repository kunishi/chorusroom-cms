<?xml version="1.0" encoding="iso-2022-jp"?>

<!-- $Id: common.xsl,v 1.4 2001/01/03 06:38:58 kunishi Exp $ -->

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="cr p char">

  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="bgimage">background.png</xsl:param>
  <xsl:param name="styledir">/style</xsl:param>
  <xsl:param name="stylesheet">default.css</xsl:param>

  <xsl:template name="additional-header">
    <link type="text/css" rel="stylesheet">
      <xsl:attribute name="href">
        <xsl:value-of select="concat($styledir, '/', $stylesheet)"/>
      </xsl:attribute>
    </link>
    <link href="mailto:kunishi@c.oka-pu.ac.jp" rev="made"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <style type="text/css" xml:space="preserve">
      <xsl:text>body { background-image: url(</xsl:text>
      <xsl:value-of select="concat($imagedir, '/', $bgimage)"/>
      <xsl:text>); }</xsl:text>
    </style>
    <meta http-equiv="Content-Type">
      <xsl:attribute name="content">
	<xsl:text>text/html; charset=</xsl:text>
	<xsl:value-of select="$output-encoding" />
      </xsl:attribute>
    </meta>
  </xsl:template>

  <xsl:template name="footer">
    <hr/>
    <div class="footer">
      <address>
        <a href="mailto:kunishi@c.oka-pu.ac.jp">
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
        <xsl:text>Copyright (C) 2000,2001 Takeo Kunishima.  All rights reserved.</xsl:text>
      </p>
      <xsl:call-template name="additional-footer"/>
    </div>
  </xsl:template>

  <xsl:template name="additional-footer"/>

</xsl:stylesheet>
