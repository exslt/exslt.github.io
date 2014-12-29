<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:math="http://www.exslt.com/math"
	extension-element-prefixes="math">

<msxsl:script language="JavaScript" implements-prefix="math">
<![CDATA[
function floor(arg){ return Math.floor(arg);}
]]>
</msxsl:script>

<xsl:template name="math:floor">
	<xsl:param name="value" select="/.." />
	<xsl:value-of select="math:floor($value)"/>
</xsl:template>
</xsl:stylesheet>