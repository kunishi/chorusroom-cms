<?xml version="1.0" encoding="iso-2022-jp"?>

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
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:param name="topdir">/</xsl:param>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="bgimage">background.png</xsl:param>
  <xsl:param name="styledir">/style</xsl:param>
  <xsl:param name="stylesheet">default.css</xsl:param>

  <!-- 
  <xsl:variable name="resource.xml">../../../lib/dtd/resource.xml</xsl:variable>
  -->

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
    <link type="text/css" rel="stylesheet">
      <xsl:attribute name="href">
        <xsl:value-of select="concat($styledir, '/', $stylesheet)"/>
      </xsl:attribute>
    </link>
    <link rev="made">
      <xsl:attribute name="href">
	<xsl:value-of select="concat('mailto:',$maintainerEmail)"/>
      </xsl:attribute>
    </link>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <!-- 
    <style type="text/css" xml:space="preserve">
      <xsl:text>body { background-image: url(</xsl:text>
      <xsl:value-of select="concat($imagedir, '/', $bgimage)"/>
      <xsl:text>); }</xsl:text>
    </style>
    -->
  </xsl:template>

  <xsl:template name="body-header">
    <p>
      <div class="logo">
	<a href="http://www.chorusroom.org">
	  <img alt="Chorus Room/合唱の部屋">
	    <xsl:attribute name="src">
	      <xsl:value-of select="concat($imagedir, '/chorusroom-toplogo.png')"/>
	    </xsl:attribute>
	  </img>
	</a>
      </div>
    </p>
  </xsl:template>

  <xsl:template name="footer">
    <hr/>
    <div class="footer">
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
        <xsl:text>Copyright (C) 2000,2001,2002 </xsl:text>
	<xsl:value-of select="$maintainerName"/>
	<xsl:text>.  All rights reserved.</xsl:text>
      </p>
      <xsl:call-template name="additional-footer"/>
    </div>
  </xsl:template>

  <xsl:template name="additional-footer"/>

</xsl:stylesheet>
