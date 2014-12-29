<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:genericMath="http://exslt.org/genericMath"
                xmlns:exsl="http://exslt.org/functions"
                extension-element-prefixes="exsl"
                exclude-result-prefixes="math">
                
<xsl:import href="genericMath.minmax.template.xsl"/>

<exsl:function name="genericMath:max">
   <xsl:param name="nodes" select="/.." />
   <xsl:param name="greaterTemplateUID" select="/.." />

   <xsl:choose>
      <xsl:when test="not($nodes)">
         <exsl:return select="number('NaN')" />
      </xsl:when>
      <xsl:otherwise>
          <xsl:variable name="maxPos">
            <xsl:call-template name="pMax">
               <xsl:with-param name="nodes" select="$nodes" />
               <xsl:with-param name="start" select="1" />
               <xsl:with-param name="end" select="count($nodes)" />
               <xsl:with-param name="greaterTemplateUID" select="$greaterTemplateUID" />
            </xsl:call-template>
          </xsl:variable>

          <exsl:return select="$nodes[position()=$maxPos]" />
      </xsl:otherwise>
   </xsl:choose>
</exsl:function>

</xsl:stylesheet>
