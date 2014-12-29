<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:regExp="http://exslt.org/regular-expressions"
>
<xsl:include href="regular-expressions.concat.msxml.xsl" />
<xsl:include href="regular-expressions.match.msxml.xsl" />
<xsl:include href="regular-expressions.replace.msxml.xsl" />
<xsl:include href="regular-expressions.test.msxml.xsl" />
	
<xsl:template match="/root">
	<html>
	<head>
	<style>
		.function{
			background-color:gray;
			color:white;
			font-size:12pt;
			font-weight:bold;
			text-align:center;
		}
		.error{
			background-color:#ff6666;
			font-size:10pt;
		}
		.success{
			background-color:66ff66;
			font-size:10pt;
		}
		.durtable{
			font-size:10pt;
		}
	</style>
	</head>
	<body>
		<h1><center>Regular Expressions Test Suite</center></h1>
		<table>
		<tr><td width="33%">&#160;</td><td width="66%">&#160;</td></tr>
		<tr class="function"><td colspan="2">concat()</td></tr>
		<tr class="success"><td>concat(div)</td>			<td><xsl:value-of select="regExp:concat(div)" /></td></tr>
		<tr class="success"><td>concat(div[1])</td>			<td><xsl:value-of select="regExp:concat(div[1])" /></td></tr>
		<tr class="success"><td>concat(noTag)</td>			<td><xsl:value-of select="regExp:concat(noTag)" /></td></tr>
		
		<tr class="function"><td colspan="2">match()</td></tr>
		<tr class="success"><td>match(div, '(list)', 'g')</td>		<td><xsl:for-each select="regExp:match(div, '(list)', 'g')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		<tr class="success"><td>match(div, '(list)', '')</td>		<td><xsl:for-each select="regExp:match(div, '(list)', '')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		<tr class="success"><td>match(div, '(list|this)', '')</td>	<td><xsl:for-each select="regExp:match(div, '(list|this)', '')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		<tr class="success"><td>match(div, '(list|this)', 'i')</td>	<td><xsl:for-each select="regExp:match(div, '(list|this)', 'i')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		<tr class="success"><td>match(div, '(list|this)', 'ig')</td>	<td><xsl:for-each select="regExp:match(div, '(list|this)', 'ig')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		<tr class="success"><td>match(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', 'ig')</td>				<td><xsl:for-each select="regExp:match(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', 'ig')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		
		<tr class="success"><td>match(noTag, '(list|this)', 'ig')</td>	<td><xsl:for-each select="regExp:match(noTag, '(list|this)', 'ig')">&lt;match><xsl:value-of select="." />&lt;/match><br /></xsl:for-each></td></tr>
		
		<tr class="function"><td colspan="2">replace()</td></tr>
		<tr class="success"><td>replace(div, 'list', 'g', 'last')</td>		<td><xsl:value-of select="regExp:replace(div, 'list', 'g', 'last')" /></td></tr>
		<tr class="success"><td>replace(div, 'list', '', 'last')</td>		<td><xsl:value-of select="regExp:replace(div, 'list', '', 'last')" /></td></tr>
		<tr class="success"><td>replace(div, 'list|this', '', '****')</td>	<td><xsl:value-of select="regExp:replace(div, 'list|this', '', '****')" /></td></tr>
		<tr class="success"><td>replace(div, 'list|this', 'g', '****')</td>	<td><xsl:value-of select="regExp:replace(div, 'list|this', 'g', '****')" /></td></tr>
		<tr class="success"><td>replace(div, 'list|this', 'gi', '****')</td>	<td><xsl:value-of select="regExp:replace(div, 'list|this', 'gi', '****')" /></td></tr>
		<tr class="success"><td>replace(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', '', '=========')</td>			<td><xsl:value-of select="regExp:replace(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', 'gi', '=========')" /></td></tr>
		
		<tr class="success"><td>replace(noTag, 'list|this', 'gi', '****')</td>	<td><xsl:value-of select="regExp:replace(noTag, 'list|this', 'gi', '****')" /></td></tr>
		
		<tr class="function"><td colspan="2">test()</td></tr>
		<tr class="success"><td>test(div, 'list', 'g')</td>			<td><xsl:value-of select="regExp:test(div, 'list', 'g')" /></td></tr>
		<tr class="success"><td>test(div, 'list', '')</td>			<td><xsl:value-of select="regExp:test(div, 'list', '')" /></td></tr>
		<tr class="success"><td>test(div, 'xxx', '')</td>			<td><xsl:value-of select="regExp:test(div, 'xxx', '')" /></td></tr>
		<tr class="success"><td>test(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', 'ig')</td><td><xsl:value-of select="regExp:test(div, '([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})', 'ig')" /></td></tr>
		
		<tr class="success"><td>test(noTag, 'xxx', '')</td>			<td><xsl:value-of select="regExp:test(noTag, 'xxx', '')" /></td></tr>
		
		</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
