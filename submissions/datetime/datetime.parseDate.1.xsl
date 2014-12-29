<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:datetime="http://www.exslt.org/datetime"
	extension-element-prefixes="datetime">

<xsl:import href="datetime.parseDate.xsl"/>

<xsl:template match="/">
   <xsl:value-of select="datetime:parseDate('1996.07.10 AD at 15:08:56 PDT', 'yyyy.MM.dd G 'at' hh:mm:ss z')"/>
</xsl:template>

</xsl:stylesheet>