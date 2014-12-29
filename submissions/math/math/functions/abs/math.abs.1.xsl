<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:math="http://www.exslt.org/math"
	extension-element-prefixes="math">

<xsl:import href="math.abs.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="math:abs(12)"/>
</xsl:template>

</xsl:stylesheet>