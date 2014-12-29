<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:math="http://www.exslt.com/math"
	extension-element-prefixes="math">

<xsl:import href="math.floor.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="math:floor(12)"/>
</xsl:template>

</xsl:stylesheet>