<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:math="http://www.exslt.org/math"
	extension-element-prefixes="math">

<msxsl:script language="JavaScript" implements-prefix="math">
<![CDATA[
function atan2(arg1, arg2){ return Math.atan2(arg1, arg2);}
]]>
</msxsl:script>

<xsl:template name="math:atan2">
	<xsl:param name="value1" select="/.." />
	<xsl:param name="value2" select="/.." />
	<xsl:value-of select="math:atan2($value1,$value2)"/>
</xsl:template>
</xsl:stylesheet>