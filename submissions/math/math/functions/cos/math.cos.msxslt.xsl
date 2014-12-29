<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:math="http://www.exslt.org/math"
	extension-element-prefixes="math">

<msxsl:script language="JavaScript" implements-prefix="math">
<![CDATA[
function cos(arg){ return Math.cos(arg);}
]]>
</msxsl:script>

<xsl:template name="math:cos">
	<xsl:param name="value" select="/.." />
	<xsl:value-of select="math:cos($value)"/>
</xsl:template>
</xsl:stylesheet>