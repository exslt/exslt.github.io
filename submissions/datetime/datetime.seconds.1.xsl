<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:datetime="http://www.exslt.org/datetime"
	extension-element-prefixes="datetime">

<xsl:import href="datetime.seconds.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="datetime:seconds('2001-01-31T01:02:03')"/>
</xsl:template>

</xsl:stylesheet>