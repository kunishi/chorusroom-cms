<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0"
		xmlns:c="http://www.chorusroom.org/xml"
		exclude-result-prefixes="c">
  <xsl:output method="html" encoding="utf-8"
	      omit-xml-declaration="yes"
	      indent="yes"/>
  <xsl:template match="/">
    <title><xsl:value-of select="//c:competitionName"/></title>
  </xsl:template>
</xsl:stylesheet>
