<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-xsl-with-encoding.xsl,v 1.1 2001/01/03 05:20:26 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:lxslt="http://xml.apache.org/xslt"
		xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
		xmlns:cr="http://www.chorusroom.org/xml"
		xmlns:p="http://www.chorusroom.org/piece"
		xmlns:char="http://www.chorusroom.org/character"
		xmlns="http://www.w3.org/1999/xhtml">

  <xsl:param name="output-encoding">utf-8</xsl:param>

  <xsl:output encoding="utf-8"
	      method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:attribute-set name="output-encoding-set">
    <xsl:attribute name="encoding">
      <xsl:value-of select="$output-encoding"/>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="xsl:param[@name='output-encoding']"
		priority="1.0">
    <xsl:element name="xsl:param">
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="$output-encoding"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="xsl:param[@name='suffix']"
		priority="1.0">
    <xsl:element name="xsl:param">
      <xsl:apply-templates select="@*"/>
      <xsl:choose>
	<xsl:when test="$output-encoding='utf-8'">
	  <xsl:text>.utfhtml</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>.html</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="xsl:include[@href='dummy-char-conv.xsl']"
		priority="1.0">
    <xsl:element name="xsl:include">
      <xsl:attribute name="href">
	<xsl:choose>
	  <xsl:when test="$output-encoding='utf-8'">
	    <xsl:text>char-conv-utf8.xsl</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>char-conv-traditional.xsl</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="@*[not(name()='href')]"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="xsl:output" priority="1.0">
    <xsl:element name="xsl:output"
		 use-attribute-sets="output-encoding-set">
      <xsl:apply-templates select="@*"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
