<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: nhk-contest-result.src.xsl,v 1.1 2001/01/03 05:20:26 kunishi Exp $ -->
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

  <xsl:import href="contest-result-common.xsl"/>

  <xsl:param name="output-encoding"/>
  <xsl:param name="output-base">index</xsl:param>
  <xsl:param name="suffix"/>

  <xsl:include href="character.xsl"/>
  <xsl:include href="contest-result-choir-piece.xsl"/>
  <xsl:include href="dummy-char-conv.xsl"/>

  <xsl:output method="xml"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      omit-xml-declaration="no"/>


  <xsl:template name="choir-attr-list">
    <xsl:if test="@representative='true'">
      <xsl:text>◎</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="cr:given-program">
    <li>
      <xsl:value-of select="*[namespace-uri()='http://www.chorusroom.org/piece']"/>
      <xsl:call-template name="piece-players-list"/>
    </li>
  </xsl:template>

  <xsl:template match="cr:free-program">
    <li>
      <xsl:call-template name="contest-result-choir-piece">
	<xsl:with-param name="piece-top" select="."/>
      </xsl:call-template>
      <xsl:call-template name="piece-players-list"/>
    </li>
  </xsl:template>

  <xsl:template name="piece-players-list">
    <xsl:variable name="player-data"
		  select="child::*[self::cr:piano or self::cr:accompaniment]"/>
    <xsl:if test="$player-data">
      <xsl:text> (</xsl:text>
      <xsl:call-template name="players-data"/>
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="choir-attr-saiten-list">
    <xsl:param name="current-choir" select="."/>
    <xsl:if test="$current-choir/@representative[.='true']">
      <xsl:text>、代表 </xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
