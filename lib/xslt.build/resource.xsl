<?xml version="1.0" encoding="utf-8"?>
<!-- $Id: resource.xsl,v 1.1 2002/06/18 15:22:17 kunishi Exp $ -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:r="http://www.chorusroom.org/resource"
		exclude-result-prefixes="r">

  <xsl:variable name="resourceTable" select="document('../dtd/resource.xml')/r:resources"/>

  <xsl:template match="r:resourceRef">
    <xsl:variable name="name" select="@name"/>
    <xsl:value-of select="$resourceTable/r:resource[@name=$name]/@value"/>
  </xsl:template>

</xsl:stylesheet>
