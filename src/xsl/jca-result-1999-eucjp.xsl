<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xt="http://www.jclark.com/xt"
  xmlns="http://www.w3.org/1999/xhtml"
  extension-element-prefixes="xt">
  <xsl:variable name="output-encoding">euc-jp</xsl:variable>
  <xsl:variable name="suffix">.html</xsl:variable>
  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>
  <xsl:output method="xml"
    indent="yes"
    encoding="euc-jp"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="no"/>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <xt:document href="{concat(@$B=PNO(B, $suffix)}">
      <xsl:call-template name="main"/>
    </xt:document>
    <xsl:if test=".//$B:NE@7k2L(B">
      <xt:document href="{concat(@$B=PNO(B, '-saiten', $suffix)}">
	<xsl:call-template name="saiten"/>
      </xt:document>
    </xsl:if>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
  <xsl:include href="result-saiten.xsl"/>
</xsl:stylesheet>
