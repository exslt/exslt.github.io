<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="exslt"
                extension-element-prefixes="exsl">

<xsl:output method="text" />

<xsl:variable name="module" select="/*/@module" />
<xsl:variable name="extension" select="/*/exslt:name" />

<xsl:template match="/" mode="use-case">
   <xsl:apply-templates select="*" mode="use-case" />
</xsl:template>

<xsl:template match="/*" mode="use-case">
   <exsl:document href="{$module}.{$extension}.use-cases.txt">
      <xsl:text>../../../howto.html&#xA;</xsl:text>
      <xsl:text>../../index.html&#xA;</xsl:text>
      <xsl:value-of select="concat($module, '.', $extension, '.html&#xA;')" />
      <xsl:for-each select="exslt:use-cases/exslt:use-case">
         <xsl:value-of select="concat($module, '.', $extension, '.use-case.')" />
         <xsl:number />
         <xsl:text>.html&#xA;</xsl:text>
         <xsl:apply-templates select="@data | @xslt | @result" />
      </xsl:for-each>
   </exsl:document>	
</xsl:template>

<xsl:template match="@data | @xslt | @result">
   <xsl:value-of select="." />
   <xsl:text>&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>