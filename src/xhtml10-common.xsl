<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="*[not(name()='head')]|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[name()='head']">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="node()" />
      <xsl:element name="meta">
	<xsl:attribute name="http-equiv">
	  <xsl:text>Content-Type</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="content">
	  <xsl:text>text/html; charset=</xsl:text>
	  <xsl:value-of select="$output-encoding"/>
	</xsl:attribute>
      </xsl:element>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
