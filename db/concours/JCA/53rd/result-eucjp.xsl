<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">
  <xsl:variable name="output-encoding">euc-jp</xsl:variable>
  <xsl:variable name="suffix">.html</xsl:variable>

  <xsl:template match="開催日別結果">
    <xt:document method="html" href="{concat(@出力, $suffix)}"
		 encoding="euc-jp">
      <xsl:call-template name="main"/>
    </xt:document>
    <xsl:if test=".//採点結果">
      <xt:document method="html" href="{concat(@出力, '-saiten', $suffix)}"
		   encoding="euc-jp">
	<xsl:call-template name="saiten"/>
      </xt:document>
    </xsl:if>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
  <xsl:include href="result-saiten.xsl"/>
</xsl:stylesheet>
