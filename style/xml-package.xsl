<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                exclude-result-prefixes="exslt">

<xsl:output method="text" />

<xsl:template match="exslt:modules">
   <xsl:document href="xml-package.txt">
      <xsl:text>home.xml&#xA;</xsl:text>
      <xsl:text>implementer-home.xml&#xA;</xsl:text>
      <xsl:text>news.xml&#xA;</xsl:text>
      <xsl:text>howto.xml&#xA;</xsl:text>
      <xsl:text>contact.xml&#xA;</xsl:text>
      <xsl:text>submissions.xml&#xA;</xsl:text>
      <xsl:text>download.xml&#xA;</xsl:text>
      <xsl:text>modules.xml&#xA;</xsl:text>
      <xsl:text>base.css&#xA;</xsl:text>
      <xsl:text>style/options.xml&#xA;</xsl:text>
      <xsl:text>style/utils.xsl&#xA;</xsl:text>
      <xsl:text>style/home.xsl&#xA;</xsl:text>
      <xsl:text>style/package.xsl&#xA;</xsl:text>
      <xsl:text>style/xml-package.xsl&#xA;</xsl:text>
      <xsl:text>style/module.xsl&#xA;</xsl:text>
      <xsl:text>style/module-stylesheet.xsl&#xA;</xsl:text>
      <xsl:text>style/module-package.xsl&#xA;</xsl:text>
      <xsl:text>style/element.xsl&#xA;</xsl:text>
      <xsl:text>style/function.xsl&#xA;</xsl:text>
      <xsl:text>style/function-stylesheet.xsl&#xA;</xsl:text>
      <xsl:text>style/extension.xsl&#xA;</xsl:text>
      <xsl:text>style/extension-stylesheet.xsl&#xA;</xsl:text>
      <xsl:text>style/extension-use-cases.xsl&#xA;</xsl:text>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <xsl:variable name="modl" select="@prefix" />
         <xsl:value-of select="concat($modl, '/', $modl, '.xml&#xA;')" />
         <xsl:value-of select="concat($modl, '/base.css&#xA;')" />
         <xsl:for-each select="$module/exslt:functions/exslt:function | $module/exslt:elements/exslt:element">
            <xsl:variable name="etype" select="local-name(..)" />
            <xsl:variable name="ext" select="@name" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/base.css&#xA;')" />
            <xsl:value-of select="concat($modl, '/', $etype, '/', $ext, '/', $modl, '.', $ext, '.xml&#xA;')" />
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