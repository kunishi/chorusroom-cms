<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:variable name="output-encoding">euc-jp</xsl:variable>
  <xsl:variable name="suffix">.html</xsl:variable>
  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:param name="output-base">index</xsl:param>

  <xsl:output encoding="euc-jp"/>

  <xsl:include href="jca-result-1999-common.xsl"/>
  <xsl:include href="jca-result-1999-saiten.xsl"/>
</xsl:stylesheet>
