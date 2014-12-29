<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<xsl:template name="genericSort">
  <xsl:param name="theNodes" select="/.."/>
  <xsl:param name="kToSort" select="0"/>
  <xsl:param name="comparisonSelector" select="/.."/>

 <xsl:variable name="cntNodes" select="count($theNodes)"/>

 <xsl:variable name="numToSort">
  <xsl:choose>
   <xsl:when test="$kToSort = 0">
     <xsl:value-of  select="$cntNodes"/>
   </xsl:when>
   <xsl:otherwise>
     <xsl:value-of  select="$kToSort"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:variable>
 
 <xsl:choose>
   <xsl:when test="0 = $cntNodes
                or $kToSort &lt; 0
                or $kToSort > $cntNodes">
   <xsl:text>NaN</xsl:text>
   </xsl:when>

   <xsl:otherwise>

    <xsl:variable name="posLength"
                  select="string-length($cntNodes)"/>

    <xsl:variable name="theBuffer2">
      <xsl:for-each select="$theNodes[position() &lt;= $numToSort]">
   	   <xsl:value-of select="concat(substring('0000000000000000000',
   	                                          20 - $posLength),
   	                                ' ')"/>
      </xsl:for-each>
     </xsl:variable>

      <xsl:variable name="theResult">
        <xsl:call-template name="mergeSingleNode">
         <xsl:with-param name="theSiblings"
                         select="$theNodes"/>
         <xsl:with-param name="siblPosition" select="1"/>
         <xsl:with-param name="sortPad" select="$theBuffer2"/>
         <xsl:with-param name="posLength" select="$posLength"/>
         <xsl:with-param name="gtTypeNode" select="$comparisonSelector"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:value-of select="$theResult"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
 
 
   <xsl:template name="mergeSingleNode">
   	<xsl:param name="theSiblings" select="/.."/>
    <xsl:param name="siblPosition" select="0"/>
    <xsl:param name="sortPad" />
    <xsl:param name="posLength" select="0"/>
    <xsl:param name="gtTypeNode" select="/.."/>

    <xsl:choose>
     <xsl:when test="$siblPosition > count($theSiblings)">

      <xsl:value-of select="$sortPad"/>
     </xsl:when>
     <xsl:otherwise>
    	<xsl:variable name="Last"
                    select="string-length($sortPad) div ($posLength + 1)"/>
    	  <xsl:variable name="argNumber"
                      select="$theSiblings[position()=$siblPosition]"/>

<!--
<xsl:value-of select="concat('Last: ', $Last, ', argNumber: ', $argNumber,
', sortPad `', $sortPad, '`', '&#xA;')"/>
-->
 
    	  <xsl:variable name="mergePosition">
  		   <xsl:call-template name="binSearch">
   			   <xsl:with-param name="argNumber" select="$argNumber"/>
   			   <xsl:with-param name="posSortedEls" select="$sortPad"/>
           <xsl:with-param name="sourceNodeset" select="$theSiblings"/>
   			   <xsl:with-param name="posLength" select="$posLength"/>
   			   <xsl:with-param name="First" select="1"/>
   			   <xsl:with-param name="Last" select="$Last"/>
           <xsl:with-param name="gtTypeNode" select="$gtTypeNode"/>
  		</xsl:call-template>
	     </xsl:variable>
<!--
<xsl:value-of select="concat('mergePosition: ', $mergePosition,'&#xA;')"/>
-->

	  <xsl:choose>
     	    <xsl:when test="$mergePosition > 0">

      		<xsl:variable name="newSortPad">
      		  <xsl:if test="$mergePosition > 1">
       	    <xsl:value-of select="substring($sortPad,
                                            $posLength + 2,
                                            ($mergePosition - 1) * ($posLength + 1))"/>
      		  </xsl:if>
      		  
            <xsl:variable name="format"
                 select="substring('0000000000000000001',20 - $posLength)"
                 />
                 
      		  <xsl:variable name="formattedPosition">
              <xsl:number value="$siblPosition"
                          format="{$format}"
              />
      		  </xsl:variable>

<!--
            <xsl:value-of select="concat('FP: `', $formattedPosition, '`&#xA;')"/>
-->
      		  <xsl:value-of
      		  select="concat($formattedPosition,' ')"/>

      		  <xsl:if test="$mergePosition != $Last">
       	    <xsl:value-of
  			  select="substring($sortPad,
                            $mergePosition * ($posLength + 1) + 1,
						                ($posLength + 1) * ($Last - $mergePosition)) "/>
      		  </xsl:if>
      		</xsl:variable>


      		<!-- Now the recursive call -->

     		<xsl:call-template name="mergeSingleNode">
      		  <xsl:with-param name="theSiblings" select="$theSiblings"/>
      		  <xsl:with-param name="siblPosition"
      		                                  select="$siblPosition + 1"/>
      		  <xsl:with-param name="sortPad" select="$newSortPad"/>
            <xsl:with-param name="posLength" select="$posLength"/>
            <xsl:with-param name="gtTypeNode" select="$gtTypeNode"/>
     		</xsl:call-template>
     	    </xsl:when>
     	    <xsl:otherwise>

      	      <!-- A recursive call with the same $sortPad-->

     		<xsl:call-template name="mergeSingleNode">
      		  <xsl:with-param name="theSiblings" select="$theSiblings"/>
      		  <xsl:with-param name="siblPosition"
                            select="$siblPosition + 1"/>
      		  <xsl:with-param name="sortPad" select="$sortPad"/>
            <xsl:with-param name="posLength" select="$posLength"/>
            <xsl:with-param name="gtTypeNode" select="$gtTypeNode"/>
     		</xsl:call-template>
     	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:otherwise>
   </xsl:choose>

   </xsl:template>

 <xsl:template name="binSearch">
  <xsl:param name="argNumber" select="-Infinity"/>
  <xsl:param name="posSortedEls" />
  <xsl:param name="sourceNodeset" select="/.."/>
  <xsl:param name="posLength" select="Infinity"/>
  <xsl:param name="First" select="Infinity"/>
  <xsl:param name="Last" select="0"/>
  <xsl:param name="gtTypeNode" select="/.."/>

  <xsl:choose>
   <xsl:when test="$First > $Last">
   	<xsl:value-of select="$Last"/>
   </xsl:when>
   <xsl:otherwise>
   	<xsl:variable name="Mid"
                  select="floor(($First + $Last) div 2)"/>
    	<xsl:variable name="midElementPos"
 	                  select="substring($posSortedEls,
                                      ($posLength+1) * ($Mid - 1)+1,
                                      $posLength)"/>

<!--
    	<xsl:variable name="midElement"
    	select="$sourceNodeset[position()=$midElementPos]"/>
-->
     <xsl:variable name="Comparison">
       <xsl:apply-templates select="$gtTypeNode[1]">
         <xsl:with-param name="node1" select="$argNumber"/>
         <xsl:with-param name="node2Pos" select="$midElementPos"/>
         <xsl:with-param name="sourceNodeset" select="$sourceNodeset"/>
       </xsl:apply-templates>
     </xsl:variable>

 	<xsl:choose>
      <xsl:when test="$Comparison = 0">
         <xsl:value-of select="$Mid"/>
      </xsl:when>
      <xsl:when test="$Comparison = -1">
       <xsl:choose>
        <xsl:when test="$First &lt; $Last">
          <xsl:call-template name="binSearch">
   		      <xsl:with-param name="argNumber" select="$argNumber"/>
   		      <xsl:with-param name="posSortedEls" select="$posSortedEls"/>
            <xsl:with-param name="sourceNodeset" select="$sourceNodeset"/>
   		      <xsl:with-param name="posLength" select="$posLength"/>
   		      <xsl:with-param name="First" select="$First"/>
   		      <xsl:with-param name="Last" select="$Mid - 1"/>
            <xsl:with-param name="gtTypeNode" select="$gtTypeNode"/>
          </xsl:call-template>
       </xsl:when>
       <xsl:otherwise><!-- First = Last and the comparison is lt -->
         <xsl:value-of select="$First - 1"/>
       </xsl:otherwise>
      </xsl:choose>
     </xsl:when>
     <xsl:when test="$Comparison = 1">
        <xsl:choose>
          <xsl:when test="$First &lt; $Last">
       	    <xsl:call-template name="binSearch">
       	    <xsl:with-param name="argNumber" select="$argNumber"/>
       	    <xsl:with-param name="posSortedEls" select="$posSortedEls"/>
            <xsl:with-param name="sourceNodeset" select="$sourceNodeset"/>
       	    <xsl:with-param name="posLength" select="$posLength"/>
       	    <xsl:with-param name="First" select="$Mid + 1"/>
       	    <xsl:with-param name="Last" select="$Last"/>
            <xsl:with-param name="gtTypeNode" select="$gtTypeNode"/>
     		</xsl:call-template>
       	</xsl:when>
          <xsl:otherwise><!-- First = Last and the comparison is gt -->
           <xsl:value-of select="$Last"/>
          </xsl:otherwise>
        </xsl:choose>
     </xsl:when>
     <xsl:otherwise>
        ERRROR
     </xsl:otherwise>

   </xsl:choose>
  </xsl:otherwise>


 </xsl:choose>
</xsl:template>

</xsl:stylesheet>

