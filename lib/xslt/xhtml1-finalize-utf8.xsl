<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
  xmlns:cr="http://www.chorusroom.org/character"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="cr">

  <xsl:include href="character.xsl"/>
  <xsl:param name="output-encoding">utf-8</xsl:param>

  <xsl:output method="xml"
    indent="no" encoding="utf-8"
    doctype-public="-//W3C//DTD HTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:template match="*">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|text()">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
