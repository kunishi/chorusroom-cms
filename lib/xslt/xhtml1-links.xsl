<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
  xmlns:l="http://www.chorusroom.org/links"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="l">

  <xsl:template match="l:links">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="l:link">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="l:url"/>
        </xsl:attribute>
        <xsl:value-of select="l:name"/>
      </a>
      <xsl:if test="not(l:comment='')">
        <br/>
        <xsl:value-of select='l:comment'/>
      </xsl:if>
    </li>
  </xsl:template>

</xsl:stylesheet>
