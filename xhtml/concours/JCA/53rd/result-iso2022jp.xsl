<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"
		xmlns:xt="http://www.jclark.com/xt"
		xmlns="http://www.w3.org/TR/REC-html40"
		extension-element-prefix="xt">
  <xsl:variable name="output-encoding">iso-2022-jp</xsl:variable>
  <xsl:variable name="suffix">.html</xsl:variable>

  <xsl:template match="開催日別結果">
    <xt:document method="html" href="{concat(@出力, $suffix)}"
		 encoding="iso-2022-jp">
      <xsl:call-template name="main"/>
    </xt:document>
  </xsl:template>

  <xsl:include href="result-common.xsl"/>
</xsl:stylesheet>
