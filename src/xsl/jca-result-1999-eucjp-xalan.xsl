<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:lxslt="http://xml.apache.org/xslt"
  xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
  xmlns="http://www.w3.org/1999/xhtml"
  extension-element-prefixes="redirect">
  <xsl:variable name="output-encoding">euc-jp</xsl:variable>
  <xsl:variable name="suffix">.html</xsl:variable>
  <xsl:output method="xml"
    indent="yes"
    encoding="euc-jp"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="no"/>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <redirect:write file="{concat(@$B=PNO(B, $suffix)}">
      <xsl:call-template name="main"/>
    </redirect:write>
    <xsl:if test=".//$B:NE@7k2L(B">
      <redirect:write file="{concat(@$B=PNO(B, '-saiten', $suffix)}">
        <xsl:call-template name="saiten"/>
      </redirect:write>
    </xsl:if>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
  <xsl:include href="result-saiten.xsl"/>
</xsl:stylesheet>
