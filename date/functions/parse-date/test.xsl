<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="test.xsl"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">

<xsl:import href="date.msxsl.xsl" />

<xsl:template match="/">
	<xsl:value-of select="date:parseDate('5:37 PM', 'h:mm a')" />
</xsl:template>

</xsl:stylesheet>