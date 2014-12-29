<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:random="http://exslt.org/random"
	extension-element-prefixes="random msxsl">

<msxsl:script language="JavaScript" implements-prefix="random">
<![CDATA[
function random-sequence(){ return random.random-sequence();}
]]>
</msxsl:script>

</xsl:stylesheet>