<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

 <xsl:template name="binSearch">
  <xsl:param name="argNode" select="/.."/>
  <xsl:param name="nodeSet" select="/.."/>
  <xsl:param name="First" select="Infinity"/>
  <xsl:param name="Last" select="0"/>
  <xsl:param name="compTemplateSelect" select="/.."/>

  <xsl:choose>
   <xsl:when test="$First > $Last">
     -1
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="Mid"
                  select="floor(($First + $Last) div 2)"/>

    <xsl:variable name="midNode" select="$nodeSet[position()=$Mid]"/>

     <xsl:variable name="Comparison">
       <xsl:apply-templates select="$compTemplateSelect[1]">
         <xsl:with-param name="node1" select="$argNode"/>
         <xsl:with-param name="node2" select="$midNode"/>
       </xsl:apply-templates>
     </xsl:variable>

     <xsl:choose>
        <xsl:when test="$Comparison = 0">
           <xsl:value-of select="$Mid"/>
         </xsl:when>
         <xsl:when test="$Comparison = -1">
           <xsl:call-template name="binSearch">
              <xsl:with-param name="argNode" select="$argNode"/>
              <xsl:with-param name="nodeSet" select="$nodeSet"/>
              <xsl:with-param name="First" select="$First"/>
              <xsl:with-param name="Last" select="$Mid - 1"/>
              <xsl:with-param name="compTemplateSelect"
                         select="$compTemplateSelect"/>
           </xsl:call-template>
         </xsl:when>
         <xsl:when test="$Comparison = 1">
           <xsl:call-template name="binSearch">
              <xsl:with-param name="argNode" select="$argNode"/>
              <xsl:with-param name="nodeSet" select="$nodeSet"/>
              <xsl:with-param name="First" select="$Mid + 1"/>
              <xsl:with-param name="Last" select="$Last"/>
              <xsl:with-param name="compTemplateSelect"
                         select="$compTemplateSelect"/>
           </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
             ERRROR
         </xsl:otherwise>
       </xsl:choose>
   </xsl:otherwise>

  </xsl:choose>
</xsl:template>
</xsl:stylesheet>


