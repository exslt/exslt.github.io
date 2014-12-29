<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:regExp="http://exslt.org/regular-expressions"
extension-element-prefixes="regExp"
>
<xsl:include href="regular-expressions.replace.msxml.xsl" />

	<xsl:template match="a">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*">
		<xsl:value-of select="." /> -
		<xsl:value-of select="regExp:replace(string(.), 'no', 'g', 'yes!!!')" />
		<xsl:value-of select="regExp:replace(string(.), 'no', 'gi', 'yes!!!')" />
		<xsl:apply-templates select = "*" />
	</xsl:template>

</xsl:stylesheet>