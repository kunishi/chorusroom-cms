<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:c="http://www.chorusroom.org/choir"
  xmlns:redirect="org.apache.xalan.lib.Redirect"
  extension-element-prefixes="redirect">

  <xsl:template match="c:choir-list">
    <xsl:apply-templates select='c:choir'>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match='c:choir'>
    <redirect:write file="{concat(c:urn, '/', c:urn, '.xml')}">
      <xsl:copy>
        <xsl:apply-templates select='@*|node()'>
        </xsl:apply-templates>
      </xsl:copy>
    </redirect:write>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select='@*|node()'>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
