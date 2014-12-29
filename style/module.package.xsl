<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                exclude-result-prefixes="exslt">

<xsl:variable name="module" select="/exslt:module/@prefix" />

<xsl:template match="/">
   <xsl:apply-templates select="*" mode="package" />
</xsl:template>

<xsl:template match="exslt:module" mode="package">
   <xsl:document href="{$module}.package.txt" method="text">
      <xsl:text>../howto.html&#xA;</xsl:text>
      <xsl:text>index.html&#xA;</xsl:text>
      <xsl:text>base.css&#xA;</xsl:text>
      <xsl:value-of select="concat($module, '.xml&#xA;')" />
      <xsl:value-of select="concat($module, '.xsl&#xA;')" />
      <xsl:for-each select="exslt:functions/exslt:function">
         <xsl:variable name="func" select="@name" />
         <xsl:variable name="function" select="document(concat('functions/', $func, '/', $module, '.', $func, '.xml'), .)/exslt:function" />
         <xsl:value-of select="concat('functions/', $func, '/base.css&#xA;')" />
         <xsl:value-of select="concat('functions/', $func, '/index.html&#xA;')" />
         <xsl:value-of select="concat('functions/', $func, '/', $module, '.', $func, '.xml&#xA;')" />
         <xsl:value-of select="concat('functions/', $func, '/', $module, '.', $func, '.html&#xA;')" />
         <xsl:value-of select="concat('functions/', $func, '/', $module, '.', $func, '.xsl&#xA;')" />
         <xsl:for-each select="$function/exslt:implementations/exslt:implementation">
            <xsl:value-of select="concat('functions/', $func, '/', @src, '&#xA;')" />
         </xsl:for-each>
      </xsl:for-each>
      <xsl:for-each select="exslt:elements/exslt:element">
         <xsl:variable name="ele" select="@name" />
         <xsl:variable name="element" select="document(concat('elements/', $ele, '/', $module, '.', $ele, '.xml'), .)/exslt:element" />
         <xsl:value-of select="concat('elements/', $ele, '/base.css&#xA;')" />
         <xsl:value-of select="concat('elements/', $ele, '/index.html&#xA;')" />
         <xsl:value-of select="concat('elements/', $ele, '/', $module, '.', $ele, '.xml&#xA;')" />
         <xsl:value-of select="concat('elements/', $ele, '/', $module, '.', $ele, '.html&#xA;')" />
         <!-- no way to define extension elements in a stylesheet as yet -->
         <!-- <xsl:value-of select="concat($ele, '/', $module, '.', $ele, '.xsl&#xA;')" /> -->
         <xsl:for-each select="$element/exslt:implementations/exslt:implementation">
            <xsl:value-of select="concat('elements/', $ele, '/', @src, '&#xA;')" />
         </xsl:for-each>
      </xsl:for-each>
   </xsl:document>	
</xsl:template>

</xsl:stylesheet>