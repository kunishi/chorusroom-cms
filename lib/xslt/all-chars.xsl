<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: all-chars.xsl,v 1.2 2001/02/06 03:03:39 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="cr xlink">

  <xsl:output encoding="utf-8"
	      method="xml"
	      indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      omit-xml-declaration="no"/>

  <xsl:template match="/">
    <html xml:lang="en" lang="en">
      <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Character Tables</title>
      </head>
      <body>
	<h1>Character Tables</h1>
	<xsl:apply-templates select="//cr:char-set"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cr:char-set">
    <xsl:variable name="tableName" select="@xlink:href"/>
    <xsl:apply-templates select="document($tableName)/cr:characters">
      <xsl:with-param name="tableName" select="$tableName"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="cr:characters">
    <xsl:param name="tableName"/>
    <table border="1">
      <caption>
	<xsl:value-of select="$tableName"/>
      </caption>
      <thead>
	<tr>
	  <th rowspan="1" colspan="1">Character</th>
	  <th rowspan="1" colspan="1">UTF-8 Codepoint</th>
	  <th rowspan="1" colspan="1">Nickname</th>
	  <th rowspan="1" colspan="1">UTF-8 Description</th>
	  <th rowspan="1" colspan="1">Alternative</th>
	</tr>
      </thead>
      <tbody>
	<xsl:apply-templates select="cr:character"/>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="cr:character">
    <tr>
      <td rowspan="1" colspan="1">
	<xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
	<xsl:value-of select="@utf8-codepoint"/>
	<xsl:text>;</xsl:text>
      </td>
      <td rowspan="1" colspan="1">
	<xsl:value-of select="@utf8-codepoint"/>
      </td>
      <td rowspan="1" colspan="1">
	<xsl:value-of select="@nickname"/>
      </td>
      <td rowspan="1" colspan="1">
	<xsl:value-of select="@description"/>
      </td>
      <td rowspan="1" colspan="1">
	<xsl:value-of select="@alternative"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
