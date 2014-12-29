<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                exclude-result-prefixes="exslt">

<xsl:output method="text" />

<xsl:variable name="module" select="/exslt:function/@module" />
<xsl:variable name="function" select="/exslt:function/exslt:name" />

<xsl:template match="exslt:function">
   <xsl:document href="{$module}.{$function}.use-cases.txt">
      <xsl:text>../../howto.html&#xA;</xsl:text>
      <xsl:text>../index.html&#xA;</xsl:text>
      <xsl:value-of select="concat($module, '.', $function, '.html&#xA;')" />
      <xsl:for-each select="exslt:use-cases/exslt:use-case">
         <xsl:value-of select="concat($module, '.', $function, '.use-case.')" />
         <xsl:number />
         <xsl:text>.html&#xA;</xsl:text>
         <xsl:apply-templates select="@data | @xslt | @result" />
      </xsl:for-each>
   </xsl:document>	
</xsl:template>

<xsl:template match="@data | @xslt | @result">
   <xsl:value-of select="." />
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>