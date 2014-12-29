<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/XSL/TransformAlias"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:func="http://exslt.org/functions"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="xsl exslt"
                extension-element-prefixes="exsl">

<xsl:namespace-alias stylesheet-prefix="#default" result-prefix="xsl" />

<xsl:output indent="yes" />

<xsl:variable name="module" select="/exslt:function/@module" />
<xsl:variable name="extension" select="/exslt:function/exslt:name" />

<xsl:template match="/">
   <xsl:apply-templates select="*" mode="stylesheet" />
</xsl:template>

<xsl:template match="exslt:element" mode="stylesheet" />

<xsl:template match="exslt:function" mode="stylesheet">
   <xsl:if test="exslt:implementations/exslt:implementation">
      <xsl:variable name="module-name" select="translate(document(concat('../../', $module, '.xml'), .)/exslt:module/exslt:name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
      <exsl:document href="{$module}.{$extension}.xsl">
         <stylesheet version="1.0"
                     extension-element-prefixes="{$module}">
            <xsl:attribute name="{$module}:doc" namespace="http://exslt.org/{$module-name}">
               <xsl:text>http://www.exslt.org/</xsl:text>
               <xsl:value-of select="$module" />
            </xsl:attribute>
            <xsl:for-each select="exslt:implementations/exslt:implementation">
               <xsl:choose>
                  <xsl:when test="@language = 'exslt:xslt' or @language = 'exslt:exslt'">
                     <import href="{@src}" />
                  </xsl:when>
                  <xsl:otherwise>
                     <func:script language="{@language}" implements-prefix="{$module}" src="{@src}" />
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </stylesheet>
      </exsl:document>	
   </xsl:if>
</xsl:template>

</xsl:stylesheet>