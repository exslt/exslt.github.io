<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:math="http://www.exslt.org/math"
                exclude-result-prefixes="math">

<exsl:function name="math:min">
   <xsl:param name="nodes" select="/.." />
   <xsl:choose>
      <xsl:when test="not($nodes)">
         <exsl:return select="number('NaN') />
      </xsl:when>
      <xsl:otherwise>
         <xsl:for-each select="$nodes">
            <xsl:sort />
            <xsl:if test="position() = 1">
               <exsl:return select="number(.)" />
            </xsl:if>
         </xsl:for-each>
      </xsl:otherwise>
   </xsl:choose>
</exsl:function>

</xsl:stylesheet>