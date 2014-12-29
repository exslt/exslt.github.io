<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:date-node="date-node"
    xmlns:compNode1="compNode1"
    exclude-result-prefixes="date-node compNode1"
>
  <xsl:output omit-xml-declaration="yes"/>
<xsl:include href="genericSearchSort.binSearch.template.xsl"/>

  <date-node:date value="20001123"/>
  
  <compNode1:node/>

  <xsl:variable name="Comp1" select="document('')/*/compNode1:*[1]"/>

 <xsl:variable name="theNode" select="document('')/*/date-node:date[1]"/>

<!--
 <xsl:variable name="theNode" select="dates/date1"/>
 <xsl:variable name="Comp1" select="//xxx"/>
-->

 <xsl:template match="/">
  <Result>
  <xsl:call-template name="binSearch">
   <xsl:with-param name="argNode" select="$theNode"/>
   <xsl:with-param name="nodeSet" select="dates/date"/>
   <xsl:with-param name="First" select="1"/>
   <xsl:with-param name="Last" select="count(dates/date)"/>
   <xsl:with-param name="compTemplateSelect" select="$Comp1"/>
  </xsl:call-template>
  </Result>
 </xsl:template>

 <xsl:template name="compareNodes1"
               match="node()[namespace-uri()='compNode1']">

   <xsl:param name="node1" select="/.."/>
   <xsl:param name="node2" select="/.."/>

   <xsl:variable name="Value1" select="$node1/@value"/>
   <xsl:variable name="Value2" select="$node2/@value"/>

   <xsl:choose>
     <xsl:when test="$Value1 > $Value2">
       <xsl:value-of select="'1'"/>
     </xsl:when>
     <xsl:when test="$Value1 = $Value2">
       <xsl:value-of select="'0'"/>
     </xsl:when>
     <xsl:otherwise>
       <xsl:value-of select="'-1'"/>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:template>
</xsl:stylesheet>


