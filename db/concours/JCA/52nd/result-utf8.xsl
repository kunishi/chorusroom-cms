<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">
  <xsl:variable name="suffix">.utfhtml</xsl:variable>
  <xsl:variable name="htmlsuffix">.html</xsl:variable>
  <xsl:variable name="utfhtmlsuffix">.utfhtml</xsl:variable>

  <xsl:template match="$B3+:EF|JL7k2L(B">
    <xt:document method="html" href="{concat(@$B=PNO(B, $suffix)}"
		 encoding="utf-8">
      <xsl:call-template name="main"/>
    </xt:document>
    <xsl:if test=".//$B:NE@7k2L(B">
      <xt:document method="html" href="{concat(@$B=PNO(B, '-saiten', $suffix)}"
		   encoding="utf-8">
	<xsl:call-template name="saiten"/>
      </xt:document>
    </xsl:if>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
  <xsl:include href="result-saiten.xsl"/>
</xsl:stylesheet>
