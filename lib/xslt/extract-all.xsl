<?xml version="1.0" encoding="iso-2022-jp"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xi="http://www.w3.org/2001/XInclude"
		xmlns:c="http://www.chorusroom.org/choir"
		xmlns="http://www.w3.org/1999/xhtml">
  <xsl:param name="choirDbDir"/>
  <xsl:template match="xi:include" priority="1.0">
    <xsl:apply-templates select="document(@href)"/>
  </xsl:template>

  <xsl:template match="c:choirIdRef" priority="1.0">
    <xsl:variable name="url"
		  select="document(
		  concat($choirDbDir,'/',substring(@id,0,3),'/',
		  @id,'/',@id,'.xml'))"/>
    <xsl:apply-templates select="$url"/>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
