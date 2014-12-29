<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:regExp="http://exslt.org/regular-expressions"
extension-element-prefixes="regExp"
>
<xsl:include href="regular-expressions.match.msxml.xsl" />

	<xsl:template match="c">
		<xsl:value-of select="." /><br/>
		<xsl:for-each select="regExp:match(., 'no', 'gi')">
			<xsl:value-of select="." />
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>