<?xml version="1.0"?>
<xsl:stylesheet version="1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:exslt="http://exslt.org/documentation"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                exclude-result-prefixes="exslt dc rdf">

<xsl:import href="utils.xsl" />
<xsl:import href="extension.package.xsl" />
<xsl:import href="extension.use-cases.xsl" />
<xsl:import href="function.stylesheet.xsl" />

<xsl:variable name="module" select="/*/@module" />
<xsl:variable name="extension" select="/*/exslt:name" />
<xsl:variable name="version" select="/*/@version" />

<xsl:variable name="latest" select="document(concat($module, '.', $extension, '.xml'), .)" />
<xsl:variable name="latest-version" select="$latest/*/@version" />

<xsl:variable name="extension-type" select="'Element'" />
<xsl:variable name="etype">
   <xsl:choose>
      <xsl:when test="$extension-type = 'Element'">elements</xsl:when>
      <xsl:otherwise>functions</xsl:otherwise>
   </xsl:choose>
</xsl:variable>

<xsl:variable name="title">
   <a href="http://www.exslt.org/">EXSLT</a>
   <xsl:text> - </xsl:text>
   <a href="http://www.exslt.org/{$module}"><xsl:value-of select="$module" /></a>
   <xsl:text>:</xsl:text>
   <a href="http://www.exslt.org/{$module}/{$etype}/{$extension}"><xsl:value-of select="$extension" /></a>
</xsl:variable>

<xsl:template match="/">
   <xsl:variable name="extension-name" select="concat($module, ':', $extension)" />
   <xsl:if test="$version = $latest-version">
      <xsl:message><xsl:value-of select="$extension-name" /> : Creating main extension page...</xsl:message>
      <xsl:call-template name="new-page">
         <xsl:with-param name="dir" select="concat($module, '/', $etype, '/', $extension, '/')" />
         <xsl:with-param name="href" select="'index.html'" />
         <xsl:with-param name="title" select="$title" />
         <xsl:with-param name="menu">
            <xsl:call-template name="menu">
               <xsl:with-param name="module" select="$module" />
               <xsl:with-param name="extension" select="$extension" />
               <xsl:with-param name="type" select="'user'" />
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="content">
            <xsl:apply-templates mode="user-content" />
         </xsl:with-param>
         <xsl:with-param name="last-modified" select="*/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
      </xsl:call-template>
      <xsl:message><xsl:value-of select="$extension-name" /> : Creating developer extension page...</xsl:message>
      <xsl:call-template name="new-page">
         <xsl:with-param name="dir" select="concat($module, '/', $etype, '/', $extension, '/')" />
         <xsl:with-param name="href" select="concat($module, '.', $extension, '.html')" />
         <xsl:with-param name="title">
            <xsl:copy-of select="$title" />
            <xsl:text> - Implementer Page</xsl:text>
         </xsl:with-param>
         <xsl:with-param name="menu">
            <xsl:call-template name="menu">
               <xsl:with-param name="module" select="$module" />
               <xsl:with-param name="extension" select="$extension" />
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="content">
            <xsl:apply-templates mode="developer-content" />
         </xsl:with-param>
         <xsl:with-param name="last-modified" select="*/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
      </xsl:call-template>
      <xsl:message><xsl:value-of select="$extension-name" /> : Creating extension stylesheet...</xsl:message>
      <xsl:apply-templates select="*" mode="stylesheet" />
      <xsl:message><xsl:value-of select="$extension-name" /> : Creating extension zip file list...</xsl:message>
      <xsl:apply-templates select="*" mode="package" />
      <xsl:message><xsl:value-of select="$extension-name" /> : Creating extension use case file list...</xsl:message>
      <xsl:apply-templates select="*" mode="use-case" />
   </xsl:if>
   <xsl:message><xsl:value-of select="$extension-name" /> : Creating extension version page...</xsl:message>
   <xsl:call-template name="new-page">
      <xsl:with-param name="dir" select="concat($module, '/', $etype, '/', $extension, '/')" />
      <xsl:with-param name="href" select="concat($module, '.', $extension, '.', $version, '.html')" />
      <xsl:with-param name="title">
         <xsl:copy-of select="$title" />
         <xsl:text> - </xsl:text>
         <a href="http://www.exslt.org/{$module}/{$etype}/{$extension}/{$module}.{$extension}.{$version}.html">
            <xsl:text />Version <xsl:value-of select="$version" />
         </a>
      </xsl:with-param>
      <xsl:with-param name="menu">
         <xsl:call-template name="menu">
            <xsl:with-param name="module" select="$module" />
            <xsl:with-param name="extension" select="$extension" />
         </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="content">
         <xsl:apply-templates mode="developer-content" />
      </xsl:with-param>
      <xsl:with-param name="last-modified" select="*/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date" />
   </xsl:call-template>
   <xsl:message><xsl:value-of select="$extension-name" /> : Creating extension update script...</xsl:message>
   <xsl:document href="update.bat" method="text">
      <xsl:apply-templates mode="update-bat" />
      <xsl:call-template name="cd" />
      <xsl:call-template name="cd" />
      <xsl:call-template name="transform">
         <xsl:with-param name="input" select="concat($module, '.xml')" />
         <xsl:with-param name="stylesheet" select="'../style/module.xsl'" />
      </xsl:call-template>
      <xsl:call-template name="zip">
         <xsl:with-param name="output" select="concat($module, '.zip')" />
         <xsl:with-param name="file" select="concat($module, '.package.txt')" />
      </xsl:call-template>
      <xsl:call-template name="cd" />
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
         <xsl:with-param name="to" select="$module" />
      </xsl:call-template>
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="$etype" />
      </xsl:call-template>
      <xsl:call-template name="cd">
         <xsl:with-param name="to" select="$extension" />
      </xsl:call-template>
   </xsl:document>
</xsl:template>

<xsl:template match="/*">
   <h4><xsl:value-of select="$extension-type" /> Syntax</h4>
   <xsl:choose>
      <xsl:when test="$extension-type = 'Element'">
         <pre>
            <xsl:apply-templates select="exslt:definition" mode="element-syntax" />
         </pre>
      </xsl:when>
      <xsl:otherwise>
         <pre>
            <xsl:apply-templates select="exslt:definition" mode="function-syntax" />
         </pre>
         <xsl:if test="exslt:implementations/exslt:implementation[@language = 'exslt:xslt']">
            <h4>Template Syntax</h4>
            <pre>
               <xsl:apply-templates select="exslt:definition" mode="template-syntax"/>
            </pre>
         </xsl:if>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="/*" mode="user-content">
   <p>
      <b>Implementer Page: </b>
      <a href="{$module}.{$extension}.html">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.html<xsl:text />
      </a><br />
      <b><xsl:value-of select="$extension-type" /> Package: </b>
      <a href="{$module}.{$extension}.zip">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.zip<xsl:text />
      </a>
   </p>
   <xsl:apply-templates select="." />
   <xsl:apply-templates select="exslt:user-doc" />
   <xsl:if test="not(exslt:user-doc)">
      <xsl:apply-templates select="exslt:doc" />
   </xsl:if>
   <xsl:apply-templates select="exslt:implementations" mode="user-content" />
   <xsl:apply-templates select="exslt:use-cases" mode="user-content" />
</xsl:template>

<xsl:template match="/*" mode="developer-content">
   <p>
      <b>Version: </b>
      <xsl:value-of select="$version" /><br />
      <b>Status: </b>
      <xsl:value-of select="@status" /><br />
      <b>User Page: </b>
      <a href="index.html">index.html</a><br />
      <b>XML Definition: </b>
      <a href="{$module}.{$extension}.xml">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.xml<xsl:text />
      </a><br />
      <b><xsl:value-of select="$extension-type" /> Package: </b>
      <a href="{$module}.{$extension}.zip">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.zip<xsl:text />
      </a>
   </p>
   <xsl:apply-templates select="." />
   <xsl:apply-templates select="exslt:doc" />
   <p>
      An implementation of this extension 
      <xsl:choose>
         <xsl:when test="$extension-type = 'Element'">element</xsl:when>
         <xsl:otherwise>function</xsl:otherwise>
      </xsl:choose>
      in the EXSLT <xsl:value-of select="$module" /> namespace must conform to the behaviour described in this document.
   </p>
   <xsl:apply-templates select="exslt:implementations" mode="developer-content" />
   <xsl:apply-templates select="exslt:use-cases" mode="developer-content" />
   <xsl:apply-templates select="rdf:Description" />
</xsl:template>

<xsl:template match="exslt:vendor-implementation" mode="user-content">
   <li>
      <a href="{@vendor-url}"><xsl:value-of select="@vendor" /></a>
      <xsl:text /> (version <xsl:value-of select="@vendor-version" />)<xsl:text />
   </li>
</xsl:template>

<xsl:template match="exslt:implementation" mode="user-content">
   <li>
      <a href="{@src}"><xsl:apply-templates select="." mode="language" /></a>
      <xsl:text /> (by <xsl:apply-templates select="(rdf:Description/exslt:revision/rdf:Description/dc:creator |
                                                     ../../rdf:Description/exslt:revision[1]/rdf:Description/dc:creator)[last()]" />)<xsl:text />
   </li>
</xsl:template>

<xsl:template match="exslt:implementations" mode="user-content">
   <h2>Implementations</h2>
   <xsl:variable name="vendor-implementations" select="exslt:vendor-implementation[@version = $version]" />
   <xsl:variable name="implementations" select="exslt:implementation[@version = $version]" />
   <xsl:choose>
      <xsl:when test="exslt:vendor-implementation">
         <xsl:choose>
            <xsl:when test="$vendor-implementations">
               <p>
                  The following XSLT processors support <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>:
               </p>
               <ul>
                  <xsl:apply-templates select="$vendor-implementations" mode="user-content" />
               </ul>
            </xsl:when>
            <xsl:otherwise>
               <p>There are currently no XSLT processors that we know of that support the latest version of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> natively.</p>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:variable name="old-vendor-implementations" select="exslt:vendor-implementation[@version != $version]" />
         <xsl:if test="$old-vendor-implementations">
            <p>The following processors support earlier versions of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>:</p>
            <ul>
               <xsl:apply-templates select="$old-vendor-implementations" mode="user-content" />
            </ul>
         </xsl:if>
      </xsl:when>
      <xsl:otherwise>
         <p>There are currently no XSLT processors that we know of that support <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> natively.</p>
      </xsl:otherwise>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="exslt:implementation">
         <xsl:choose>
            <xsl:when test="$implementations">
               <p>
                  Implementations of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> are available in the following languages:
               </p>
               <ul>
                  <xsl:apply-templates select="$implementations" mode="user-content" />
               </ul>
            </xsl:when>
            <xsl:otherwise>
               <p>There are currently no third-party implementations of the latest version of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>.</p>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:variable name="old-implementations" select="exslt:implementation[@version != $version]" />
         <xsl:if test="$old-implementations">
            <p>The following third-party implementations of earlier versions of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> are available:</p>
            <ul>
               <xsl:apply-templates select="$old-implementations" mode="user-content" />
            </ul>
         </xsl:if>
      </xsl:when>
      <xsl:otherwise>
         <p>There are currently no third-party implementations of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>.</p>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="exslt:implementations" mode="developer-content">
   <h2>Implementations</h2>
   <xsl:variable name="vendor-implementations" select="exslt:vendor-implementation" />
   <xsl:variable name="implementations" select="exslt:implementation" />
   <xsl:choose>
      <xsl:when test="$vendor-implementations">
         <p>
            Built-in support for <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> is available in the following XSLT processors:
         </p>
         <table>
            <tr>
               <th class="rowhead">Processor</th>
               <th>Processor Version</th>
               <th>Implemented Version</th>
            </tr>
            <xsl:for-each select="$vendor-implementations">
               <tr>
                  <td class="rowhead">
                     <a href="{@vendor-url}"><xsl:value-of select="@vendor" /></a>
                  </td>
                  <td><xsl:value-of select="@vendor-version" /></td>
                  <td><xsl:value-of select="@version" /></td>
               </tr>
            </xsl:for-each>
         </table>
      </xsl:when>
      <xsl:otherwise>
         <p>No XSLT processors that we know of have built-in support for <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>.</p>
      </xsl:otherwise>
   </xsl:choose>
   <xsl:choose>
      <xsl:when test="$implementations">
         <p>
            The following implementations of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code> are available:
         </p>
         <table>
            <tr>
               <th class="rowhead">Language</th>
               <th>Implemented Version</th>
               <th>Creator</th>
               <th>Date</th>
               <th>Download</th>
            </tr>
            <xsl:for-each select="$implementations">
               <xsl:variable name="language">
                  <xsl:apply-templates select="." mode="language" />
               </xsl:variable>
               <tr>
                  <td class="rowhead">
                     <a href="{@src}.html"><xsl:value-of select="$language" /></a>
                  </td>
                  <xsl:variable name="details" select="rdf:Description/exslt:revision[1]/rdf:Description
                      | self::node()[not(rdf:Description)]/../../rdf:Description/exslt:revision[1]/rdf:Description" />
                  <td><xsl:value-of select="@version" /></td>
                  <td><xsl:apply-templates select="$details/dc:creator" /></td>
                  <td><xsl:apply-templates select="$details/dc:date" /></td>
                  <td><a href="{@src}"><xsl:value-of select="@src" /></a></td>
               </tr>
               <xsl:call-template name="new-page">
                  <xsl:with-param name="dir" select="concat($module, '/', $etype, '/', $extension, '/')" />
                  <xsl:with-param name="href" select="concat(@src, '.html')" />
                  <xsl:with-param name="title">
                     <xsl:copy-of select="$title" />
                     <xsl:text> - </xsl:text>
                     <a href="http://www.exslt.org/{$module}/{$etype}/{$extension}/{@src}.html">
                        <xsl:value-of select="$language" />
                        <xsl:text> Implementation</xsl:text>
                     </a>
                  </xsl:with-param>
                  <xsl:with-param name="menu">
                     <xsl:call-template name="menu">
                        <xsl:with-param name="module" select="$module" />
                        <xsl:with-param name="extension" select="$extension" />
                        <xsl:with-param name="type" select="'implementation'" />
                     </xsl:call-template>
                  </xsl:with-param>
                  <xsl:with-param name="content">
                     <xsl:apply-templates select="." mode="implementation-page" />
                  </xsl:with-param>
                  <xsl:with-param name="last-modified" 
                                  select="(rdf:Description/exslt:revision[last()]/rdf:Description/dc:date |
                                           ancestor::*/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date)[last()]" />
               </xsl:call-template>
            </xsl:for-each>
         </table>
      </xsl:when>
      <xsl:otherwise>
         <p>There are currently no third-party implementations of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>.</p>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="exslt:implementation" mode="implementation-page" >
   <p>
      <b>Supported Version: </b>
      <xsl:value-of select="@version" /><br />
      <b>XML Definition: </b>
      <a href="{$module}.{$extension}.xml">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.xml<xsl:text />
      </a><br />
      <b>Source: </b>
      <a href="{@src}"><xsl:value-of select="@src" /></a>
   </p>
   <xsl:apply-templates select="exslt:doc" />
   <xsl:if test="@language = 'exslt:xslt' or @language = 'exslt:exslt'">
      <h2>Source</h2>
      <pre>
         <xsl:apply-templates select="document(@src, .)/xsl:stylesheet/node()" mode="serialise" />
      </pre>
   </xsl:if>
   <xsl:apply-templates select="rdf:Description" />
   <xsl:if test="not(rdf:Description)">
      <xsl:apply-templates select="ancestor::*/rdf:Description" />
   </xsl:if>
</xsl:template>

<xsl:template match="exslt:use-cases[exslt:use-case/@type = 'example']" mode="user-content">
   <h2>Examples</h2>
   <xsl:apply-templates select="exslt:use-case[@type = 'example' and not(@template = 'yes')][1]" />
   <xsl:apply-templates select="exslt:use-case[@type = 'example' and @template = 'yes'][1]" />
</xsl:template>

<xsl:template match="exslt:use-case">
   <h3>
      <xsl:choose>
         <xsl:when test="@template = 'yes'">Template</xsl:when>
         <xsl:otherwise>Function</xsl:otherwise>
      </xsl:choose>
   </h3>
   <xsl:choose>
      <xsl:when test="exslt:doc"><xsl:apply-templates select="exslt:doc" /></xsl:when>
      <xsl:otherwise>
         <p>
            <xsl:text />The following example shows how to use the <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>
            <xsl:choose>
               <xsl:when test="@template = 'yes'"> template:</xsl:when>
               <xsl:when test="$extension-type = 'Element'"> element:</xsl:when>
               <xsl:otherwise> function:</xsl:otherwise>
            </xsl:choose>
         </p>
      </xsl:otherwise>
   </xsl:choose>
   <xsl:if test="@data">
      <h4>Source</h4>
      <pre>
         <xsl:apply-templates select="document(@data, .)" mode="serialise" />
      </pre>
   </xsl:if>
   <h4>Stylesheet</h4>
   <pre>
      <xsl:apply-templates select="document(@xslt, .)/xsl:stylesheet/node()" mode="serialise" />
   </pre>
   <xsl:if test="@result">
      <h4>Result</h4>
      <pre>
         <xsl:apply-templates select="document(@result, .)" mode="serialise" />
      </pre>
   </xsl:if>
</xsl:template>

<xsl:template match="exslt:use-cases[exslt:use-case]" mode="developer-content">
   <h2>Use Cases</h2>
   <p>
      <b>Use Case Package: </b>
      <a href="{$module}.{$extension}.use-cases.zip">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.use-cases.zip<xsl:text />
      </a>
   </p>
   <p>
      The following use cases illustrate the functionality of <code><xsl:value-of select="$module" />:<xsl:value-of select="$extension" /></code>.
   </p>
   <table>
      <tr>
         <th class="rowhead">Details</th>
         <th>Calling Stylesheet</th>
         <th>XML Data</th>
         <th>Expected Result</th>
         <th>Category</th>
         <th>Template</th>
      </tr>
      <xsl:for-each select="exslt:use-case">
         <xsl:variable name="number"><xsl:number /></xsl:variable>
         <tr>
            <td class="rowhead">
               <xsl:choose>
                  <xsl:when test="$version = $latest-version">
                     <a href="{$module}.{$extension}.use-case.{$number}.html">
                        <xsl:value-of select="$number" />
                     </a>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="$number" />
                  </xsl:otherwise>
               </xsl:choose>
            </td>
            <td>
               <a href="{@xslt}"><xsl:value-of select="@xslt" /></a>
            </td>
            <td>
               <xsl:choose>
                  <xsl:when test="@data">
                     <a href="{@data}"><xsl:value-of select="@data" /></a>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
               </xsl:choose>
            </td>
            <td>
               <xsl:choose>
                  <xsl:when test="@result">
                     <a href="{@result}"><xsl:value-of select="@result" /></a>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
               </xsl:choose>
            </td>
            <td><xsl:value-of select="@type" /></td>
            <td>
               <xsl:choose>
                  <xsl:when test="@template = 'yes'">Y</xsl:when>
                  <xsl:otherwise>N</xsl:otherwise>
               </xsl:choose>
            </td>
         </tr>
         <xsl:if test="$version = $latest-version">
            <xsl:call-template name="new-page">
               <xsl:with-param name="dir" select="concat($module, '/', $etype, '/', $extension, '/')" />
               <xsl:with-param name="href" select="concat($module, '.', $extension, '.use-case.', $number, '.html')" />
               <xsl:with-param name="title">
                  <xsl:value-of select="$title" />
                  <xsl:text> - </xsl:text>
                  <a href="http://www.exslt.org/{$module}/{$etype}/{$extension}/{$module}.{$extension}.use-case.{$number}.html">
                     <xsl:text>Use Case </xsl:text>
                     <xsl:value-of select="$number" />
                  </a>
               </xsl:with-param>
               <xsl:with-param name="menu">
                  <xsl:call-template name="menu">
                     <xsl:with-param name="module" select="$module" />
                     <xsl:with-param name="extension" select="$extension" />
                     <xsl:with-param name="type" select="'use-case'" />
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="content">
                  <xsl:apply-templates select="." mode="use-case-page" />
               </xsl:with-param>
               <xsl:with-param name="last-modified" 
                               select="(rdf:Description/exslt:revision[last()]/rdf:Description/dc:date | 
                                        ancestor::*/rdf:Description/exslt:revision[last()]/rdf:Description/dc:date)[last()]" />
            </xsl:call-template>
         </xsl:if>
      </xsl:for-each>
   </table>
</xsl:template>

<xsl:template match="exslt:use-case" mode="use-case-page">
   <p>
      <b>Category: </b>
      <xsl:value-of select="@type" /><br />
      <b>XML Definition: </b>
      <a href="{$module}.{$extension}.xml">
         <xsl:value-of select="$module" />.<xsl:value-of select="$extension" />.xml<xsl:text />
      </a><br />
      <xsl:if test="$extension-type != 'Element'">
         <b>Function or Template: </b>
         <xsl:choose>
            <xsl:when test="@template = 'yes'">template</xsl:when>
            <xsl:otherwise>function</xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </p>
   <xsl:apply-templates select="exslt:doc" />
   <h2>Use Case</h2>
   <xsl:if test="@data">
      <h3>Source <span style="font-size: 75%">(<a href="{@data}">view</a>)</span></h3>
      <pre>
         <xsl:apply-templates select="document(@data, .)" mode="serialise" />
      </pre>
   </xsl:if>
   <h3>Stylesheet <span style="font-size: 75%">(<a href="{@xslt}">view</a>)</span></h3>
   <pre>
      <xsl:apply-templates select="document(@xslt, .)/xsl:stylesheet/node()" mode="serialise" />
   </pre>
   <xsl:if test="@result">
      <h3>Result <span style="font-size: 75%">(<a href="{@result}">view</a>)</span></h3>
      <pre>
         <xsl:apply-templates select="document(@result, .)" mode="serialise" />
      </pre>
   </xsl:if>
   <xsl:apply-templates select="rdf:Description" />
   <xsl:if test="not(rdf:Description)">
      <xsl:apply-templates select="ancestor::*[last()]/rdf:Description" />
   </xsl:if>
</xsl:template>

</xsl:stylesheet>