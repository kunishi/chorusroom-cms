<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: gen-char-relax.xsl,v 1.6 2001/02/04 02:04:48 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:cr="http://www.chorusroom.org/character"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.xml.gr.jp/xmlns/relaxCore"
		exclude-result-prefixes="cr">

  <xsl:output method="xml"
	      indent="yes"
	      omit-xml-declaration="no"/>

  <xsl:variable name="char-list" xmlns:xlink="http://www.w3.org/1999/xlink" select="document(//cr:char-set/@xlink:href)/cr:characters/cr:character"/>

  <xsl:template match="/">
    <module moduleVersion="1.0" relaxCoreVersion="1.0" targetNamespace="http://www.chorusroom.org/character">
      <interface/>
      <attPool role="nicknameList">
	<attribute name="nickname">
	  <enumeration value="none"/>
	  <xsl:for-each select="$char-list">
	    <enumeration>
	      <xsl:attribute name="value">
		<xsl:value-of select="@nickname"/>
	      </xsl:attribute>
	    </enumeration>
	  </xsl:for-each>
	</attribute>
      </attPool>
    </module>
  </xsl:template>

  <xsl:template match="cr:char-set"/>

  <xsl:template match="cr:characters">
    <xsl:apply-templates select="cr:character"/>
  </xsl:template>

</xsl:stylesheet>
