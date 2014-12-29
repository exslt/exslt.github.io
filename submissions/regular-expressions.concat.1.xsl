<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:regExp="http://exslt.org/regular-expressions"
extension-element-prefixes="regExp"
>
<xsl:include href="regular-expressions.concat.msxml.xsl" />

	<xsl:template match="/">
		<xsl:value-of select="." /><br/>
		<xsl:value-of select="/a/c" />
	</xsl:template>
</xsl:stylesheet>