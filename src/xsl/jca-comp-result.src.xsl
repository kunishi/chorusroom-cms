<?xml version="1.0" encoding="iso-2022-jp"?>
<!-- $Id: jca-comp-result.src.xsl,v 1.4 2001/01/30 13:27:20 kunishi Exp $ -->
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
  <xsl:param name="docBaseURI"/>

  <xsl:include href="character.xsl"/>
  <xsl:include href="contest-result-choir-piece.xsl"/>
  <xsl:include href="dummy-char-conv.xsl"/>

  <xsl:output/>

  <xsl:template name="choir-attr-list">
    <xsl:if test="@representative='true'">
      <xsl:text>◎</xsl:text>
    </xsl:if>
    <xsl:if test="@seed='true'">
      <xsl:text>◎</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="cr:given-program">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="cr:pieceRef">
    <xsl:variable name="number" select="@number"/>
    <xsl:text>[</xsl:text>
    <xsl:value-of select="@number"/>
    <xsl:text>] </xsl:text>
    <xsl:apply-templates select="document(concat($docBaseURI,'/',@href))/cr:givenPrograms/cr:givenProgram[./cr:givenProgramNumber=$number]/p:*"/>
  </xsl:template>

  <xsl:template name="choir-attr-saiten-list">
    <xsl:param name="current-choir" select="."/>
    <xsl:if test="$current-choir/@representative[.='true']">
      <xsl:text>、代表 </xsl:text>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
