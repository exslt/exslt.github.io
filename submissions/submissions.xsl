<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:vcf="http://www.ietf.org/internet-drafts/draft-dawson-vcard-xml-dtd-03.txt"
                exclude-result-prefixes="xs">

<xsl:strip-space elements="*" />
<xsl:output indent="yes" />

<xsl:variable name="module" select="/*/module" />
<xsl:variable name="ext">
   <xsl:choose>
      <xsl:when test="/*/name"><xsl:value-of select="/*/name" /></xsl:when>
      <xsl:when test="/*/function"><xsl:value-of select="/*/function" /></xsl:when>
   </xsl:choose>
</xsl:variable>
<xsl:variable name="version">
   <xsl:choose>
      <xsl:when test="/*/version"><xsl:value-of select="/*/version" /></xsl:when>
      <xsl:when test="/*/@version"><xsl:value-of select="/*/@version" /></xsl:when>
   </xsl:choose>
</xsl:variable>

<xsl:variable name="etype">
   <xsl:choose>
      <xsl:when test="/implementation">functions</xsl:when>
      <xsl:otherwise><xsl:value-of select="name(/*)" />s</xsl:otherwise>
   </xsl:choose>
</xsl:variable>

<xsl:variable name="current-href">
   <xsl:choose>
      <xsl:when test="/function/@version = 1 or /element/@version = 1"></xsl:when>
      <xsl:otherwise>
         <xsl:text />../<xsl:value-of select="$module" />/<xsl:value-of select="$etype" />/<xsl:value-of select="$ext" />/<xsl:text />
         <xsl:value-of select="$module" />.<xsl:value-of select="$ext" />.xml<xsl:text />
      </xsl:otherwise>
   </xsl:choose>
</xsl:variable>

<xsl:variable name="current" select="document($current-href, /)" />

<xsl:template match="/">
   <xsl:if test="(/function or /element) and $version != 1 and not(contains($version, '.'))">
      <xsl:document href="../{$module}/{$etype}/{$ext}/{$module}.{$ext}.{$version - 1}.xml">
         <xsl:copy-of select="$current" />
      </xsl:document>
   </xsl:if>
   <xsl:document href="../{$module}/{$etype}/{$ext}/{$module}.{$ext}.xml">
      <xsl:apply-templates />
   </xsl:document>
</xsl:template>

<xsl:variable name="implementation" select="/implementation" />

<xsl:template match="implementation">
   <xsl:apply-templates select="$current" mode="implementation" />
</xsl:template>

<xsl:template match="@*|node()" mode="implementation">
   <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="implementation" />
   </xsl:copy>
</xsl:template>

<xsl:template match="exslt:implementations" mode="implementation">
   <xsl:copy>
      <xsl:copy-of select="exslt:vendor-implementation" />
      <xsl:copy-of select="exslt:implementation[@language != $implementation/language]" />
      <exslt:implementation src="{$implementation/src}" language="{$implementation/language}" version="{$implementation/version}">
         <xsl:apply-templates select="$implementation/meta" />
         <xsl:apply-templates select="$implementation/documentation" />
      </exslt:implementation>
   </xsl:copy>
</xsl:template>

<xsl:variable name="use-case" select="/use-case" />

<xsl:template match="use-case">
   <xsl:apply-templates select="$current" mode="use-case" />
</xsl:template>

<xsl:template match="@*|node()" mode="use-case">
   <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="use-case" />
   </xsl:copy>
</xsl:template>

<xsl:template match="exslt:use-cases" mode="use-case">
   <xsl:copy>
      <xsl:copy-of select="exslt:vendor-use-case" />
      <xsl:copy-of select="exslt:use-case[@language != $use-case/language]" />
      <exslt:use-case type="{$use-case/@type}" xslt="{$use-case/xslt}">
         <xsl:if test="string($use-case/data)">
            <xsl:attribute name="data">
               <xsl:value-of select="$use-case/data" />
            </xsl:attribute>
         </xsl:if>
         <xsl:if test="string($use-case/result)">
            <xsl:attribute name="result">
               <xsl:value-of select="$use-case/result" />
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="$use-case/meta" />
         <xsl:apply-templates select="$use-case/documentation" />
      </exslt:use-case>
   </xsl:copy>
</xsl:template>

<xsl:template match="function | element">
	<exslt:function version="{$version}" module="{$module}">
      <xsl:attribute name="status">
         <xsl:choose>
            <xsl:when test="@status"><xsl:value-of select="@status" /></xsl:when>
            <xsl:when test="$version = 1">new</xsl:when>
            <xsl:otherwise>revised</xsl:otherwise>
         </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="name" />
      <xsl:apply-templates select="meta" />
      <xsl:apply-templates select="documentation" />
      <xsl:apply-templates select="definition" />
      <exslt:implementations>
         <xsl:copy-of select="$current/*/exslt:implementations/*" />
      </exslt:implementations>
      <exslt:use-cases>
         <xsl:copy-of select="$current/*/exslt:use-cases/*" />
      </exslt:use-cases>
   </exslt:function>
</xsl:template>

<xsl:template match="name">
   <exslt:name><xsl:value-of select="." /></exslt:name>
</xsl:template>

<xsl:template match="meta">
   <rdf:Description ID="{$module}:{$ext}">
      <dc:subject>EXSLT</dc:subject>
      <dc:subject><xsl:value-of select="$module" /></dc:subject>
      <dc:subject><xsl:value-of select="$ext" /></dc:subject>
      <xsl:apply-templates select="keywords" />
      <xsl:apply-templates select="rights" />
      <xsl:if test="contains($version, '.')">
         <xsl:copy-of select="$current/rdf:Description/exslt:revision" />
      </xsl:if>
      <exslt:revision>
         <rdf:Description ID="{$module}:{$ext}.{$version}">
            <exslt:version><xsl:value-of select="$version" /></exslt:version>
            <dc:creator rdf:parseType="Resource">
               <xsl:apply-templates select="author" />
            </dc:creator>
            <dc:date><xsl:value-of select="../@date" /></dc:date>
            <dc:description>
               <xsl:apply-templates select="summary" />
            </dc:description>
         </rdf:Description>
      </exslt:revision>
   </rdf:Description>
</xsl:template>

<xsl:template match="implementation/meta">
   <rdf:Description ID="{$module}:{$ext}.{../language}">
      <dc:subject>EXSLT</dc:subject>
      <dc:subject><xsl:value-of select="$module" /></dc:subject>
      <dc:subject><xsl:value-of select="$ext" /></dc:subject>
      <dc:subject><xsl:value-of select="../language" /></dc:subject>
      <xsl:apply-templates select="keywords" />
      <xsl:apply-templates select="rights" />
      <exslt:revision>
         <rdf:Description ID="{$module}:{$ext}.{../language}.{../@version}">
            <exslt:version><xsl:value-of select="../@version" /></exslt:version>
            <dc:creator rdf:parseType="Resource">
               <xsl:apply-templates select="author" />
            </dc:creator>
            <dc:date><xsl:value-of select="../@date" /></dc:date>
            <dc:description>
               <xsl:apply-templates select="summary" />
            </dc:description>
         </rdf:Description>
      </exslt:revision>
   </rdf:Description>
</xsl:template>

<xsl:template match="use-case/meta">
   <rdf:Description ID="{$module}:{$ext}.use-case">
      <dc:subject>EXSLT</dc:subject>
      <dc:subject><xsl:value-of select="$module" /></dc:subject>
      <dc:subject><xsl:value-of select="$ext" /></dc:subject>
      <dc:subject><xsl:value-of select="../@type" /></dc:subject>
      <xsl:apply-templates select="keywords" />
      <xsl:apply-templates select="rights" />
      <exslt:revision>
         <rdf:Description ID="{$module}:{$ext}.use-case.1">
            <exslt:version><xsl:value-of select="../@version" /></exslt:version>
            <dc:creator rdf:parseType="Resource">
               <xsl:apply-templates select="author" />
            </dc:creator>
            <dc:date><xsl:value-of select="../@date" /></dc:date>
            <dc:description>
               <xsl:apply-templates select="summary" />
            </dc:description>
         </rdf:Description>
      </exslt:revision>
   </rdf:Description>
</xsl:template>

<xsl:template match="summary">
   <dc:description>
      <xsl:apply-templates select="." mode="documentation" />
   </dc:description>
</xsl:template>

<xsl:template match="node()" mode="docbook">
   <xsl:copy-of select="." />
</xsl:template>

<xsl:template match="*" mode="html">
   <xsl:element name="html:{local-name()}">
      <xsl:apply-templates select="@*|node()" mode="html" />
   </xsl:element>
</xsl:template>

<xsl:template match="@*|comment()|processing-instruction()|text()" mode="html">
   <xsl:copy-of select="." />
</xsl:template>

<xsl:template match="*" mode="xs">
   <xsl:element name="xs:{local-name()}">
      <xsl:apply-templates select="@*|node()" mode="xs" />
   </xsl:element>
</xsl:template>

<xsl:template match="@*|comment()|processing-instruction()|text()" mode="xs">
   <xsl:copy-of select="." />
</xsl:template>

<xsl:template match="author">
   <vcf:fn><xsl:value-of select="." /></vcf:fn>
   <vcf:email><xsl:value-of select="@email" /></vcf:email>
   <vcf:url><xsl:value-of select="@url" /></vcf:url>
</xsl:template>

<xsl:template match="keywords" name="keywords">
   <xsl:param name="keywords" select="." />
   <xsl:choose>
      <xsl:when test="contains($keywords, ',')">
         <dc:subject><xsl:value-of select="normalize-space(substring-before($keywords, ','))" /></dc:subject>
         <xsl:call-template name="keywords">
            <xsl:with-param name="keywords" select="substring-after($keywords, ',')" />
         </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
         <dc:subject><xsl:value-of select="normalize-space($keywords)" /></dc:subject>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="rights">
   <dc:rights>
      <xsl:copy-of select="node()" />
   </dc:rights>
</xsl:template>

<xsl:template match="documentation">
   <exslt:doc>
      <xsl:apply-templates select="." mode="documentation" />
   </exslt:doc>
</xsl:template>

<xsl:template match="function/definition">
   <exslt:definition>
      <xsl:apply-templates select="return" />
      <xsl:apply-templates select="arg" />
   </exslt:definition>
</xsl:template>

<xsl:template match="element/definition">
   <exslt:definition>
      <xsl:apply-templates mode="xs" />
   </exslt:definition>
</xsl:template>

<xsl:template match="return">
   <exslt:return>
      <xsl:copy-of select="@*[name() != 'written-in']" />
      <xsl:apply-templates select="." mode="documentation" />
   </exslt:return>
</xsl:template>

<xsl:template match="arg">
   <exslt:arg>
      <xsl:copy-of select="@*[name() != 'written-in']" />
      <xsl:apply-templates select="." mode="documentation" />
   </exslt:arg>
</xsl:template>

<xsl:template match="*" mode="documentation">
   <xsl:choose>
      <xsl:when test="@written-in = 'docbook'">
         <xsl:apply-templates mode="docbook" />
      </xsl:when>
      <xsl:otherwise>
         <html:div>
            <xsl:apply-templates mode="html" />
         </html:div>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

</xsl:stylesheet>