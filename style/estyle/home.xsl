<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="exslt dc rdf"
                extension-element-prefixes="exsl">

<xsl:import href="utils.xsl" />

<xsl:variable name="title">
   <a href="http://www.exslt.org/">EXSLT</a>
</xsl:variable>

<xsl:template match="/">
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'index.html'" />
      <xsl:with-param name="title" select="$title" />
      <xsl:with-param name="menu">
         <xsl:call-template name="menu" />
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:apply-templates mode="home" />
      </xsl:with-param>
      <xsl:with-param name="last-modified" select="exslt:modules/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
   </xsl:call-template>
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'download.html'" />
      <xsl:with-param name="title">
         <xsl:copy-of select="$title" />
         <xsl:text> Downloads</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu" />
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:apply-templates mode="download" />
      </xsl:with-param>
      <xsl:with-param name="last-modified" select="exslt:modules/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
   </xsl:call-template>
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'howto.html'" />
      <xsl:with-param name="title">
         <xsl:text>How to Use </xsl:text>
         <xsl:copy-of select="$title" />
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu" />
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:copy-of select="document('howto.xml', .)" />
      </xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'submissions/index.html'" />
      <xsl:with-param name="title">
         <xsl:copy-of select="$title" />
         <xsl:text> Submissions</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu" />
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:copy-of select="document('submissions.xml', .)" />
      </xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'contact.html'" />
      <xsl:with-param name="title">
         <xsl:copy-of select="$title" />
         <xsl:text> - Contacts</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu" />
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:copy-of select="document('contact.xml', .)" />
      </xsl:with-param>
   </xsl:call-template>
   <exsl:document href="update.bat" method="text">
      <xsl:for-each select="exslt:modules/exslt:module">
         <xsl:text />cd <xsl:value-of select="@prefix" /><xsl:text>&#xA;</xsl:text>
         <xsl:apply-templates select="document(concat(@prefix, '/', @prefix, '.xml'), .)/*" 
                              mode="update-bat" />
         <xsl:text>cd ..&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:text>saxon modules.xml style/package.xsl&#xA;</xsl:text>
      <xsl:text>wzzip -P -o all-exslt.zip @package.txt&#xA;</xsl:text>
   </exsl:document>
</xsl:template>

<xsl:template match="exslt:modules" mode="home">
   <xsl:copy-of select="document('home.xml', .)" />
   <h2>Modules</h2>
   <dl>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <dt><a href="{@prefix}/index.html"><xsl:value-of select="$module/exslt:name" /></a></dt>
         <dd>
            <xsl:apply-templates select="$module/exslt:doc/*/*[1]" />
         </dd>
         <exsl:document href="{@prefix}/refresh.bat" method="text">
            <xsl:text />saxon <xsl:value-of select="@prefix" />.xml ../style/module.xsl&#xA;<xsl:text />
         </exsl:document>
         <exsl:document href="{@prefix}/update.bat" method="text">
            <xsl:apply-templates select="." mode="bat-file" />
            <xsl:text>cd ..&#xA;</xsl:text>
            <xsl:text>saxon modules.xml style/home.xsl&#xA;</xsl:text>
            <xsl:text>saxon modules.xml style/package.xsl&#xA;</xsl:text>
            <xsl:text>wzzip -P -o all-exslt.zip @package.txt&#xA;</xsl:text>
            <xsl:text />cd <xsl:value-of select="@prefix" /><xsl:text>&#xA;</xsl:text>
         </exsl:document>
      </xsl:for-each>
   </dl>
</xsl:template>


<xsl:template match="exslt:modules" mode="download">
   <xsl:copy-of select="document('download.xml', .)" />
   <h2>Modules</h2>
   <p>
      You can download all the modules at once, or download each module individually.
   </p>
   <table>
      <tr>
         <th class="rowhead">Module</th>
         <th>Version</th>
         <th>Download</th>
      </tr>
      <tr>
         <td class="rowhead">All Modules</td>
         <td>-</td>
         <td><a href="all-exslt.zip">all-exslt.zip</a></td>
      </tr>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <tr>
            <td class="rowhead">
               <a href="{@prefix}/index.html"><xsl:value-of select="$module/exslt:name" /></a>
            </td>
            <td>
               <xsl:value-of select="$module/@version" />
            </td>
            <td>
               <a href="{@prefix}/{@prefix}.zip">
                  <xsl:value-of select="concat(@prefix, '.zip')" />
               </a>
            </td>
         </tr>
      </xsl:for-each>
   </table>
</xsl:template>

</xsl:stylesheet>