<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                exclude-result-prefixes="exslt">

<xsl:output method="text" />

<xsl:template match="exslt:modules">
   <xsl:document href="package.txt">
      <xsl:text>howto.html&#xA;</xsl:text>
      <xsl:text>index.html&#xA;</xsl:text>
      <xsl:text>base.css&#xA;</xsl:text>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <xsl:variable name="modl" select="@prefix" />
         <xsl:value-of select="concat($modl, '/index.html&#xA;')" />
         <xsl:value-of select="concat($modl, '/', $modl, '.html&#xA;')" />
         <xsl:value-of select="concat($modl, '/', $modl, '.xml&#xA;')" />
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
            <xsl:variable name="ext-XML" select="document(concat($etype, '/', $ext, '/', $modl, '.', $ext, '.xml'), .)/*" />
            <xsl:for-each select="$ext-XML/exslt:implementations/exslt:implementation">
               <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', @src, '&#xA;')" />
            </xsl:for-each>
            <xsl:for-each select="$ext-XML/exslt:use-cases/exslt:use-case">
               <xsl:if test="@data">
                  <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', @data, '&#xA;')" />
               </xsl:if>
               <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', @xslt, '&#xA;')" />
               <xsl:if test="@result">
                  <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', @result, '&#xA;')" />
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each>
      </xsl:for-each>
   </xsl:document>	
</xsl:template>

</xsl:stylesheet>