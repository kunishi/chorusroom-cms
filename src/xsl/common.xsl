<?xml version="1.0" encoding="iso-2022-jp"?>

<!-- $Id: common.xsl,v 1.7 2001/08/06 02:07:38 kunishi Exp $ -->

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.lib.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns:r="http://www.chorusroom.org/resource"
		xmlns="http://www.w3.org/1999/xhtml"
		extension-element-prefixes="redirect"
		exclude-result-prefixes="cr p char r">

  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:param name="topdir">/</xsl:param>
  <xsl:param name="imagedir">/image</xsl:param>
  <xsl:param name="bgimage">background.png</xsl:param>
  <xsl:param name="styledir">/style</xsl:param>
  <xsl:param name="stylesheet">default.css</xsl:param>

  <xsl:variable name="maintainerName" select="document('../DTD/resource.xml')/r:resources/r:resource[@name='maintainerName']/@value"/>
  <xsl:variable name="maintainerJName" select="document('../DTD/resource.xml')/r:resources/r:resource[@name='maintainerJName']/@value"/>
  <xsl:variable name="maintainerEmail" select="document('../DTD/resource.xml')/r:resources/r:resource[@name='maintainerEmail']/@value"/>

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
        <a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat('mailto:', $maintainerEmail)"/>
	  </xsl:attribute>
          <xsl:choose>
            <xsl:when test="$output-encoding='iso-8859-1'">
	      <xsl:value-of select="$maintainerName"/>
            </xsl:when>
            <xsl:otherwise>
	      <xsl:value-of select="$maintainerJName"/>
            </xsl:otherwise>
          </xsl:choose>
	  <xsl:text> &lt;</xsl:text>
	  <xsl:value-of select="$maintainerEmail"/>
	  <xsl:text>&gt;</xsl:text>
        </a>
      </address>
      <p>
        <xsl:text>Copyright (C) 2000,2001 </xsl:text>
	<xsl:value-of select="$maintainerName"/>
	<xsl:text>.  All rights reserved.</xsl:text>
      </p>
      <xsl:call-template name="additional-footer"/>
    </div>
  </xsl:template>

  <xsl:template name="additional-footer"/>

</xsl:stylesheet>
