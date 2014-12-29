<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/XSL/TransformAlias"
                xmlns:exslt="http://exslt.org/documentation"
                exclude-result-prefixes="xsl exslt">

<xsl:namespace-alias stylesheet-prefix="#default" result-prefix="xsl" />

<xsl:variable name="module" select="/exslt:module/@prefix" />

<xsl:template match="/">
   <xsl:apply-templates select="*" mode="stylesheet" />
</xsl:template>

<xsl:template match="exslt:module" mode="stylesheet">
   <xsl:variable name="extensions">
      <!-- no way to define extension elements in a stylesheet as yet -->
      <!-- <xsl:for-each select="exslt:functions/exslt:function | exslt:elements/exslt:element" /> -->
      <xsl:for-each select="exslt:functions/exslt:function">
         <exslt:extension href="{concat('functions/', @name, '/', $module, '.', @name, '.xml')}" />
      </xsl:for-each>
   </xsl:variable>
   <xsl:variable name="extension-docs" select="document($extensions/exslt:extension/@href, .)/*" />
   <xsl:if test="$extension-docs/exslt:implementations/exslt:implementation">
      <xsl:message>Implementations</xsl:message>
      <xsl:document href="{$module}.xsl" indent="yes">
         <stylesheet version="1.0"
                     extension-element-prefixes="{$module}">
            <xsl:attribute name="{$module}:doc" namespace="http://exslt.org/{exslt:name}">
               <xsl:text>http://www.exslt.org/</xsl:text>
               <xsl:value-of select="$module" />
            </xsl:attribute>
            <xsl:for-each select="$extension-docs[exslt:implementations/exslt:implementation]">
               <import href="functions/{exslt:name}/{$module}.{exslt:name}.xsl" />
            </xsl:for-each>
         </stylesheet>
      </xsl:document>	
   </xsl:if>
</xsl:template>

</xsl:stylesheet>