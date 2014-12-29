<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:gt1="gt1"
	xmlns:gt2="gt2"
  exclude-result-prefixes="gt1 gt2"
>
  <gt1:gt1/>
  <gt2:gt2/>

 <xsl:include href="genericSearchSort.sort.template.xsl"/>

 <xsl:output omit-xml-declaration="yes"/>

 <xsl:variable name="gt1-Node" select="document('')/*/gt1:*[1]"/>
 <xsl:variable name="gt2-Node" select="document('')/*/gt2:*[1]"/>

 <xsl:variable name="theNodes"
                      select="/dates/datesUnSorted/date/@value"/>

 <xsl:variable name="theNodes2"
                      select="/dates/datesUnSorted2/date/@value"/>

 <xsl:variable name="numToSort" select="5"/>


 <xsl:template match="/">
 
 <xsl:variable name="NL" select="'&#xA;'"/>

<result>
 <xsl:text>&#xA;</xsl:text>
 <xsl:variable name="Result1">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes"/>
   <xsl:with-param name="kToSort" select="$numToSort"/>
   <xsl:with-param name="comparisonSelector" select="$gt1-Node"/>
  </xsl:call-template>
 </xsl:variable>
 
 <xsl:value-of select="concat('Result1: ', $Result1, $NL)"/>

 <xsl:variable name="Result2">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes"/>
   <xsl:with-param name="comparisonSelector" select="$gt1-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result2: ', $Result2, $NL)"/>

 <xsl:variable name="Result3">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes"/>
   <xsl:with-param name="comparisonSelector" select="$gt2-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result3: ', $Result3, $NL)"/>

 <xsl:variable name="Result4">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes2"/>
   <xsl:with-param name="comparisonSelector" select="$gt2-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result4: ', $Result4, $NL)"/>

 <xsl:variable name="Result5">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="NonExistent"/>
   <xsl:with-param name="comparisonSelector" select="$gt2-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result5: ', $Result5, $NL)"/>

 <xsl:variable name="Result6">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes"/>
   <xsl:with-param name="kToSort" select="count($theNodes) + 1"/>
   <xsl:with-param name="comparisonSelector" select="$gt1-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result6: ', $Result6, $NL)"/>

 <xsl:variable name="Result7">
  <xsl:call-template name="genericSort">
   <xsl:with-param name="theNodes" select="$theNodes"/>
   <xsl:with-param name="kToSort" select="count($theNodes)"/>
   <xsl:with-param name="comparisonSelector" select="$gt1-Node"/>
  </xsl:call-template>
 </xsl:variable>

 <xsl:value-of select="concat('Result7: ', $Result7, $NL)"/>
 </result>
 </xsl:template>

 <xsl:template name="compareNodes1"
               match="node()[namespace-uri()='gt1']">

   <xsl:param name="node1" select="/.."/>
   <xsl:param name="node2Pos" select="0"/>
   <xsl:param name="sourceNodeset" select="/.."/>

   <xsl:variable name="Value1" select="$node1"/>
   <xsl:variable name="Value2"
                 select="$sourceNodeset[position()=$node2Pos]"/>

   <xsl:choose>
     <xsl:when test="$node2Pos = 0">
       <xsl:value-of select="'1'"/>
     </xsl:when>
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

 <xsl:template name="compareNodes2"
               match="node()[namespace-uri()='gt2']">

   <xsl:param name="node1" select="/.."/>
   <xsl:param name="node2Pos" select="0"/>
   <xsl:param name="sourceNodeset" select="/.."/>

   <xsl:variable name="Value1" select="$node1"/>
   <xsl:variable name="Value2"
                 select="$sourceNodeset[position()=$node2Pos]"/>

   <xsl:choose>
     <xsl:when test="$node2Pos = 0">
       <xsl:value-of select="'1'"/>
     </xsl:when>
     <xsl:when test="0 - $Value1 > 0 - $Value2">
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

