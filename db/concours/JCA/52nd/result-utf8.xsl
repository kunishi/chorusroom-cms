<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">
  <xsl:variable name="output-encoding">utf-8</xsl:variable>
  <xsl:variable name="suffix">.utfhtml</xsl:variable>
  <xsl:variable name="tmpsuffix">.uhtml</xsl:variable>
  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>

  <xsl:template match="開催日別結果">
    <xt:document method="xml"
		 href="{concat(@出力, $tmpsuffix)}"
		 encoding="utf-8"
		 doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                 doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                 omit-xml-declaration="yes">
      <xsl:call-template name="main"/>
    </xt:document>
    <xsl:if test=".//採点結果">
      <xt:document method="xml"
		   href="{concat(@出力, '-saiten', $tmpsuffix)}"
		   encoding="utf-8"
		   doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                   doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                   omit-xml-declaration="yes">
	<xsl:call-template name="saiten"/>
      </xt:document>
    </xsl:if>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
  <xsl:include href="result-saiten.xsl"/>
</xsl:stylesheet>
