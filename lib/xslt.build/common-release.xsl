<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:cr='http://www.chorusroom.org/xml'
  xmlns:p='http://www.chorusroom.org/piece'
  xmlns:char='http://www.chorusroom.org/character'
  xmlns:r='http://www.chorusroom.org/resource'
  xmlns='http://www.w3.org/1999/xhtml'>

  <xsl:variable name="maintainerName"
    select="document('../dtd/resource.xml')
            /r:resources/r:resource[@name='maintainerName']/@value"/>
  <xsl:variable name="maintainerJName"
    select="document('../dtd/resource.xml')
            /r:resources/r:resource[@name='maintainerJName']/@value"/>
  <xsl:variable name="maintainerEmail"
    select="document('../dtd/resource.xml')
            /r:resources/r:resource[@name='maintainerEmail']/@value"/>

</xsl:stylesheet>
