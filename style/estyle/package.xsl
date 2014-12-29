<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="exslt"
                extension-element-prefixes="exsl">

<xsl:output method="text" />

<xsl:template match="exslt:modules">
   <exsl:document href="package.txt">
      <xsl:text>howto.html&#xA;</xsl:text>
      <xsl:text>index.html&#xA;</xsl:text>
      <xsl:text>base.css&#xA;</xsl:text>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <xsl:variable name="modl" select="@prefix" />
         <xsl:value-of select="concat($modl, '/index.html&#xA;')" />
         <xsl:value-of select="concat($modl, '/', $modl, '.xsl&#xA;')" />
         <xsl:value-of select="concat($modl, '/base.css&#xA;')" />
         <xsl:for-each select="$module/exslt:functions/exslt:function | $module/exslt:elements/exslt:element">
            <xsl:variable name="etype" select="local-name(..)" />
            <xsl:variable name="ext" select="@name" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/base.css&#xA;')" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/index.html&#xA;')" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', $modl, '.', $ext, '.xml&#xA;')" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', $modl, '.', $ext, '.html&#xA;')" />
            <xsl:if test="self::exslt:function">
               <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', $modl, '.', $ext, '.xsl&#xA;')" />
            </xsl:if>
            <xsl:for-each select="document(concat($etype, '/', $ext, '/', $modl, '.', $ext, '.xml'), .)/exslt:implementations/exslt:implementation">
               <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', @src, '&#xA;')" />
            </xsl:for-each>
         </xsl:for-each>
      </xsl:for-each>
   </exsl:document>	
</xsl:template>

</xsl:stylesheet>