<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:cr='http://www.chorusroom.org/xml'
  xmlns:p='http://www.chorusroom.org/piece'
  xmlns:char='http://www.chorusroom.org/character'
  xmlns:xml='http://www.w3.org/XML/1998/namespace'
  xmlns='http://www.w3.org/1999/xhtml'
  exclude-result-prefixes='cr p char r'>

  <xsl:output method='xml' indent='yes' encoding='utf-8'/>

  <xsl:template match='/'>
    <xsl:processing-instruction name='xml-stylesheet'>href='../../../../xsl/test-html.xsl' type='text/xml'</xsl:processing-instruction>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match='processing-instruction()' priority='1.0'/>

  <xsl:template match='@*|node()'>
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>