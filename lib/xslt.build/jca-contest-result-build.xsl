<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:c='http://www.chorusroom.org/xml'
  xmlns:p='http://www.chorusroom.org/piece'
  xmlns:cr='http://www.chorusroom.org/character'
  xmlns:redirect='org.apache.xalan.lib.Redirect'
  extension-element-prefixes='redirect'>

  <xsl:import href='contest-result-build.xsl'/>

  <xsl:template match='c:pieceRef' mode='result' priority='2.0'>
    <xsl:variable name="number" select="@number"/>
    <xsl:apply-templates
      select='document(concat($docBaseURI,"/",@href))
              //c:givenProgram[./c:givenProgramNumber=$number]/*'
      mode='result'/>
  </xsl:template>

</xsl:stylesheet>