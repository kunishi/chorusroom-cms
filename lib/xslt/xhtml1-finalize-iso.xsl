<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
  xmlns:cr="http://www.chorusroom.org/character"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="cr xhtml">

  <xsl:include href="character.xsl"/>
  <xsl:param name="output-encoding">iso-2022-jp</xsl:param>

  <xsl:output method="html"
    indent="no" encoding="iso-2022-jp"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

  <xsl:template match="xhtml:*">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@xml:*" priority="1.0">
  </xsl:template>

  <xsl:template match="@*|text()">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
