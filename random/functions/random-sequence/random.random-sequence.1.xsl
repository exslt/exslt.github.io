<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:random="http://www.exslt.org/random"
	extension-element-prefixes="random">

<xsl:import href="random.random-sequence.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="random:random-sequence()"/>
</xsl:template>

</xsl:stylesheet>