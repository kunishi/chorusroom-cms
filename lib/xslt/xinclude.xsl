<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
  xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:template match="xi:include">
    <xsl:apply-templates select="document(@href)/"/>
  </xsl:template>

</xsl:stylesheet>
