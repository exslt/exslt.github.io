<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:regExp="http://exslt.org/regular-expressions"
extension-element-prefixes="regExp"
>
<msxsl:script language="JavaScript" implements-prefix="regExp">
<![CDATA[
function replace(ctx, re, flags, repStr){
	var ipString = "";
	if (typeof(ctx) == "object"){
		var ctxN = ctx.nextNode;
		ipString = ctxN.nodeValue;//...
	}else{
		ipString = ctx;
	}
	var re = new RegExp(re, flags);
	return ipString.replace(re, repStr);
}
]]>
</msxsl:script>

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