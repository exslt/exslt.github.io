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

<xsl:template match="/">
   <xsl:apply-templates select="*" mode="package" />
</xsl:template>

<xsl:template match="/*" mode="package">
   <exsl:document href="{$module}.{$extension}.package.txt">
      <xsl:text>../../../howto.html&#xA;</xsl:text>
      <xsl:text>../../index.html&#xA;</xsl:text>
      <xsl:text>base.css&#xA;</xsl:text>
      <xsl:text>index.html&#xA;</xsl:text>
      <xsl:value-of select="concat($module, '.', $extension, '.xml&#xA;')" />
      <xsl:value-of select="concat($module, '.', $extension, '.html&#xA;')" />
      <xsl:value-of select="concat($module, '.', $extension, '.xsl&#xA;')" />
      <xsl:for-each select="exslt:implementations/exslt:implementation">
         <xsl:value-of select="@src" />
         <xsl:text>&#xA;</xsl:text>
      </xsl:for-each>
   </exsl:document>	
</xsl:template>

</xsl:stylesheet>