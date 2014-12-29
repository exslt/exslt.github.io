<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                exclude-result-prefixes="exslt dc rdf">

<xsl:import href="utils.xsl" />

<xsl:variable name="title">
   <a href="http://www.exslt.org/">EXSLT</a>
</xsl:variable>

<xsl:template match="/">
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'index.html'" />
      <xsl:with-param name="title" select="$title" />
      <xsl:with-param name="menu">
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'home'" />
         </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:apply-templates mode="home" />
      </xsl:with-param>
      <xsl:with-param name="last-modified" select="exslt:modules/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
   </xsl:call-template>
   <xsl:call-template name="new-page">
      <xsl:with-param name="href" select="'exslt.html'" />
      <xsl:with-param name="title">
         <xsl:copy-of select="$title" />
         <xsl:text> - Implementer Page</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'developer-home'" />
         </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:apply-templates mode="developer-home" />
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
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'common'" />
         </xsl:call-template>
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
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'common'" />
         </xsl:call-template>
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
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'submissions'" />
         </xsl:call-template>
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
         <xsl:call-template name="menu">
            <xsl:with-param name="type" select="'common'" />
         </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:copy-of select="document('contact.xml', .)" />
      </xsl:with-param>
   </xsl:call-template>
   <xsl:document href="update.bat" method="text">
      <xsl:for-each select="exslt:modules/exslt:module">
         <xsl:text />cd <xsl:value-of select="@prefix" /><xsl:text>&#xA;</xsl:text>
         <xsl:apply-templates select="document(concat(@prefix, '/', @prefix, '.xml'), .)/*" 
                              mode="update-bat" />
         <xsl:text>cd ..&#xA;</xsl:text>
      </xsl:for-each>
      <xsl:call-template name="transform">
         <xsl:with-param name="input" select="'modules.xml'" />
         <xsl:with-param name="stylesheet" select="'style/package.xsl'" />
      </xsl:call-template>
      <xsl:call-template name="zip">
         <xsl:with-param name="output" select="'all-exslt.zip'" />
         <xsl:with-param name="file" select="'package.txt'" />
      </xsl:call-template>
      <xsl:call-template name="transform">
         <xsl:with-param name="input" select="'modules.xml'" />
         <xsl:with-param name="stylesheet" select="'style/xml-package.xsl'" />
      </xsl:call-template>
      <xsl:call-template name="zip">
         <xsl:with-param name="output" select="'exslt.zip'" />
         <xsl:with-param name="file" select="'xml-package.txt'" />
      </xsl:call-template>
   </xsl:document>
</xsl:template>

<xsl:template match="exslt:module" mode="list-entry">
   <xsl:param name="module" />
   <dt>
      <a href="{@prefix}/index.html"><xsl:value-of select="$module/exslt:name" /></a>
   </dt>
   <dd>
      <xsl:apply-templates select="$module/exslt:user-doc/*/*[1]" /> 
      <xsl:if test="not($module/exslt:user-doc)">
         <xsl:apply-templates select="$module/exslt:doc/*/*[1]" />
      </xsl:if>
   </dd>
</xsl:template>

<xsl:template match="exslt:modules" mode="home">
   <xsl:copy-of select="document('home.xml', .)" />
   <h2>News</h2>
   <xsl:copy-of select="document('news.xml', .)" />
   <h2>Modules</h2>
   <dl>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="@prefix" />
         <xsl:variable name="module-XML" select="document(concat($module, '/', $module, '.xml'), .)/exslt:module" />
         <xsl:choose>
            <xsl:when test="$module-XML/*/*/@core = 'yes'">
               <xsl:apply-templates select="." mode="list-entry">
                  <xsl:with-param name="module" select="$module-XML" />
               </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="modl" select="." />
               <xsl:variable name="extensions" select="$module-XML/exslt:elements/exslt:element | $module-XML/exslt:functions/exslt:function" />
               <xsl:variable name="implementations">
                  <xsl:for-each select="$extensions">
                     <xsl:variable name="ext-XML" select="document(concat(local-name(..), '/', @name, '/', $module, '.', @name, '.xml'), .)/*" />
                     <xsl:if test="$ext-XML/exslt:implementations/*">true</xsl:if>
                  </xsl:for-each>
               </xsl:variable>
               <xsl:if test="$implementations">
                  <xsl:apply-templates select="." mode="list-entry">
                     <xsl:with-param name="module" select="$module-XML" />
                  </xsl:apply-templates>
               </xsl:if>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:document href="{@prefix}/refresh.bat" method="text">
            <xsl:call-template name="transform">
               <xsl:with-param name="input" select="concat(@prefix, '.xml')" />
               <xsl:with-param name="stylesheet" select="'../style/module.xsl'" />
            </xsl:call-template>
         </xsl:document>
         <!--
         <xsl:document href="{@prefix}/update.bat" method="text">
            <xsl:apply-templates select="$module" mode="update-bat" />
            <xsl:call-template name="cd" />
            <xsl:call-template name="transform">
               <xsl:with-param name="input" select="'modules.xml'" />
               <xsl:with-param name="stylesheet" select="'style/home.xsl'" />
            </xsl:call-template>
            <xsl:call-template name="transform">
               <xsl:with-param name="input" select="'modules.xml'" />
               <xsl:with-param name="stylesheet" select="'style/package.xsl'" />
            </xsl:call-template>
            <xsl:call-template name="zip">
               <xsl:with-param name="output" select="'all-exslt.zip'" />
               <xsl:with-param name="file" select="'package.txt'" />
            </xsl:call-template>
            <xsl:call-template name="transform">
               <xsl:with-param name="input" select="'modules.xml'" />
               <xsl:with-param name="stylesheet" select="'style/xml-package.xsl'" />
            </xsl:call-template>
            <xsl:call-template name="zip">
               <xsl:with-param name="output" select="'exslt.zip'" />
               <xsl:with-param name="file" select="'xml-package.txt'" />
            </xsl:call-template>
            <xsl:call-template name="cd">
               <xsl:with-param name="to" select="@prefix" />
            </xsl:call-template>
         </xsl:document>
         -->
      </xsl:for-each>
   </dl>
   <h2>Sponsors</h2>
   <xsl:copy-of select="document('sponsors.xml', .)" />
</xsl:template>

<xsl:template match="exslt:modules" mode="developer-home">
   <xsl:copy-of select="document('implementer-home.xml', .)" />
   <h2>News</h2>
   <xsl:copy-of select="document('news.xml', .)" />
   <h2>Modules</h2>
   <dl>
      <xsl:for-each select="exslt:module">
         <xsl:variable name="module" select="document(concat(@prefix, '/', @prefix, '.xml'), .)/exslt:module" />
         <dt>
            <a href="{@prefix}/{@prefix}.html"><xsl:value-of select="$module/exslt:name" /></a>
         </dt>
         <dd>
            <xsl:apply-templates select="$module/exslt:doc/*/*[1]" />
         </dd>
      </xsl:for-each>
   </dl>
   <h2>Sponsors</h2>
   <xsl:copy-of select="document('sponsors.xml', .)" />
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