<?xml version="1.0" encoding="utf-8"?>
<!--
     $Id: xhtml10-common.xsl,v 1.6 2000/10/08 09:59:56 kunishi Exp $
     -->

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:import href="common.xsl"/>

  <xsl:output
    method="xml"
    indent="yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="no"/>

  <xsl:template match="*[not(name()='head' or name()='body')]|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[name()='head']">
    <xsl:copy>
      <xsl:call-template name="additional-header"/>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[name()='body']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="node()"/>
      <xsl:call-template name="footer"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
