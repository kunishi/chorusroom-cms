<?xml version="1.0" encoding="utf-8"?>

<!-- $Id: common.xsl,v 1.13 2002/09/24 14:56:26 kunishi Exp $ -->

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:c="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns:r="http://www.chorusroom.org/resource"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="c p cr r">

  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:param name="topdir">/</xsl:param>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="bgimage">background.png</xsl:param>
  <xsl:param name="styledir">/style</xsl:param>
  <xsl:param name="toppage">false</xsl:param>

  <xsl:variable name="maintainerName">
    <xsl:text>KUNISHIMA Takeo</xsl:text>
  </xsl:variable>
  <xsl:variable name="maintainerJName">
    <xsl:text>国島丈生</xsl:text>
  </xsl:variable>
  <xsl:variable name="maintainerEmail">
    <xsl:text>kunishi@chorusroom.org</xsl:text>
  </xsl:variable>

  <xsl:template name="additional-header">
    <xsl:if test="$toppage='true'">
      <link type="text/css" rel="stylesheet">
	<xsl:attribute name="href">
	  <xsl:value-of select="concat($styledir, '/toppage.css')"/>
	</xsl:attribute>
      </link>
    </xsl:if>
    <link type="text/css" rel="stylesheet">
      <xsl:attribute name="href">
        <xsl:value-of select="concat($styledir, '/default.css')"/>
      </xsl:attribute>
    </link>
    <link rev="made">
      <xsl:attribute name="href">
	<xsl:value-of select="concat('mailto:',$maintainerEmail)"/>
      </xsl:attribute>
    </link>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
  </xsl:template>

  <xsl:template name="body-header">
    <div class="logo">
      <xsl:choose>
	<xsl:when test="$toppage='true'">
	  <h1>
	    <img alt="合唱の部屋 - chorusroom.org" 
	    src="{concat($imagedir,'/logo200309.gif')}"></img>
	  </h1>
	</xsl:when>
	<xsl:otherwise>
	  <a href="/">
	    <img alt="合唱の部屋 - chorusroom.org" 
	    src="{concat($imagedir,'/logo200309.gif')}"></img>
	  </a>
	</xsl:otherwise>
      </xsl:choose>
    </div>
    <div class="banner">
      <p>
	<a href="/concours/">コンクール</a>
	<a href="/links/Choir/">合唱団リンク</a>
	<a href="/links/">リンク</a>
      </p>
      <p class="notice">
	If you see full of funny characters, try the latest versions
	of your WWW browsers, or the ones which support UTF-8
	(ex. Internet Explorer, Netscape 7).
      </p>
    </div>
  </xsl:template>

  <xsl:template name="footer">
    <div class="footer">
      <!--
      <p>
	<a href="http://validator.w3.org/check/referer">
	  <img src="image/valid-xhtml10.png" alt="Valid XHTML 1.0!" 
	       height="31" width="88"></img>
	</a>
      </p>
      -->
      <address>
        <a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat('mailto:', $maintainerEmail)"/>
	  </xsl:attribute>
	  <xsl:value-of select="$maintainerJName"/>
	  <xsl:text> &lt;</xsl:text>
	  <xsl:value-of select="$maintainerEmail"/>
	  <xsl:text>&gt;</xsl:text>
        </a>
      </address>
      <p>
        <xsl:text>Copyright © 2000-2003 </xsl:text>
	<xsl:value-of select="$maintainerName"/>
	<xsl:text>.  All rights reserved.</xsl:text>
      </p>
      <xsl:call-template name="additional-footer"/>
    </div>
  </xsl:template>

  <xsl:template name="additional-footer"/>

</xsl:stylesheet>
