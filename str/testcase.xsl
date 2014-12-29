<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:str="http://exslt.org/strings"
>
<xsl:include href="strings.align.msxml.xsl" />
<xsl:include href="strings.padding.msxml.xsl" />
<xsl:include href="strings.tokenize.msxml.xsl" />
<xsl:include href="strings.encodeuri.msxml.xsl" />
<xsl:include href="strings.decodeuri.msxml.xsl" />
	
<xsl:template match="/">
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
		<h1><center>String Test Suite</center></h1>
		<table>
		<tr><td width="33%">&#160;</td><td width="66%">&#160;</td></tr>
		<tr class="function"><td colspan="2">align()</td></tr>
		<tr class="success"><td>align('aaa', '++++++++++++', 'center')</td>			<td><xsl:value-of select="str:align('aaa', '++++++++++++', 'center')" /></td></tr>
		<tr class="success"><td>align('aaa', '++++++++++++', 'left')</td>			<td><xsl:value-of select="str:align('aaa', '++++++++++++', 'left')" /></td></tr>
		<tr class="success"><td>align('aaa', '++++++++++++', 'right')</td>			<td><xsl:value-of select="str:align('aaa', '++++++++++++', 'right')" /></td></tr>
		<tr class="success"><td>align('aaa', '++++++++++++')</td>					<td><xsl:value-of select="str:align('aaa', '++++++++++++')" /></td></tr>
		<tr class="success"><td>align('aaaaaaaaaaaaaaaaaaaaa', '++++++++++++')</td>	<td><xsl:value-of select="str:align('aaaaaaaaaaaaaaaaaaaaa', '++++++++++++')" /></td></tr>
		
		<tr class="function"><td colspan="2">padding()</td></tr>
		<tr class="success"><td>padding(9, '++++++++++++')</td>						<td><xsl:value-of select="str:padding(9, '++++++++++++')" /></td></tr>
		<tr class="success"><td>padding(4, '++++++++++++')</td>						<td><xsl:value-of select="str:padding(4, '++++++++++++')" /></td></tr>
		
		<tr class="function"><td colspan="2">tokenize()</td></tr>
		<tr class="success"><td>tokenize('2001-06-03T11:40:23', '-T:')</td>			<td><xsl:for-each select="str:tokenize('2001-06-03T11:40:23', '-T:')">&lt;token><xsl:value-of select="." />&lt;/token><br /></xsl:for-each></td></tr>
		<tr class="success"><td>tokenize('date math str')</td>						<td><xsl:for-each select="str:tokenize('date math str')">&lt;token><xsl:value-of select="." />&lt;/token><br /></xsl:for-each></td></tr>
		
		<tr class="function"><td colspan="2">encodeUri()</td></tr>
		<tr class="success"><td>encodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded   &lt;&gt;\\ ')</td>		<td><xsl:value-of select="str:encodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded   &lt;&gt;\\ ')" /></td></tr>
		
		<tr class="function"><td colspan="2">decodeUri()</td></tr>
		<tr class="success"><td>decodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded%20%20%20%3C%3E%5C%5C%20')</td><td><xsl:value-of select="str:decodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded%20%20%20%3C%3E%5C%5C%20')" /></td></tr>
		
		<tr class="function"><td colspan="2">encodeUri()/decodeUri()</td></tr>
		<tr class="success"><td>decodeUri(encodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded   &lt;&gt;\\ '))</td><td><xsl:value-of select="str:decodeUri(str:encodeUri('http://exslt/index.xml?some=string&amp;to=be&amp;encoded   &lt;&gt;\\ '))" /></td></tr>
		
		</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
