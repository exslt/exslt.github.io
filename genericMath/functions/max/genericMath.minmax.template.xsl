<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:exsl-default-relation-gt="exsl-default-relation-gt"
xmlns:exsl-default-relation-lt="exsl-default-relation-lt"
>

<exsl-default-relation-gt:node/>
<exsl-default-relation-lt:node/>

 <xsl:variable name="defaultGT"
               select="document('')/*/exsl-default-relation-gt:*[1]"/>

 <xsl:variable name="defaultLT"
               select="document('')/*/exsl-default-relation-lt:*[1]"/>

 <xsl:template name="min">
   <xsl:param name="nodes" select="/.." />
   <xsl:param name="lessThanTemplateUID" select="$defaultLT" />

   <xsl:variable name="minPos">
    <xsl:call-template name="pMin">
      <xsl:with-param name="nodes" select="$nodes" />
      <xsl:with-param name="start" select="1" />
      <xsl:with-param name="end" select="count($nodes)" />
      <xsl:with-param name="lessThanTemplateUID" select="$lessThanTemplateUID" />
    </xsl:call-template>
   </xsl:variable>

   <!-- Important: this will not return the node - impossible in XSLT
        The node can be returned in EXSLT using exslt:result -->
   <xsl:value-of select="$nodes[position()=$minPos]"/>

 </xsl:template>

 <xsl:template name="max">
   <xsl:param name="nodes" select="/.." />
   <xsl:param name="greaterTemplateUID" select="$defaultGT" />

   <xsl:variable name="maxPos">
    <xsl:call-template name="pMax">
      <xsl:with-param name="nodes" select="$nodes" />
      <xsl:with-param name="start" select="1" />
      <xsl:with-param name="end" select="count($nodes)" />
      <xsl:with-param name="greaterTemplateUID" select="$greaterTemplateUID" />
    </xsl:call-template>
   </xsl:variable>

   <xsl:value-of select="$nodes[position()=$maxPos]"/>

 </xsl:template>

  <xsl:template name="pMin">
    <xsl:param name="nodes" select="/.." />
    <xsl:param name="start" select="0" />
    <xsl:param name="end" select="0" />
    <xsl:param name="lessThanTemplateUID" select="$defaultLT" />

    <xsl:call-template name="pMax">
      <xsl:with-param name="nodes" select="$nodes" />
      <xsl:with-param name="start" select="$start" />
      <xsl:with-param name="end" select="$end" />
      <xsl:with-param name="greaterTemplateUID" select="$lessThanTemplateUID" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="pMax">
  <xsl:param name="nodes" select="/.." />
  <xsl:param name="start" select="0" />
  <xsl:param name="end" select="0" />
  <xsl:param name="greaterTemplateUID" select="$defaultGT" />
  <xsl:choose>
     <xsl:when test="$start = $end">
        <xsl:value-of select="$start" />
     </xsl:when>
     <xsl:otherwise>
        <xsl:variable name="max-of-rest">
           <xsl:call-template name="pMax">
              <xsl:with-param name="nodes" select="$nodes" />
              <xsl:with-param name="start" select="$start + 1" />
              <xsl:with-param name="end"   select="$end" />
              <xsl:with-param name="greaterTemplateUID"
                              select="$greaterTemplateUID" />
           </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="isGreater">
         <xsl:apply-templates select="$greaterTemplateUID">
 						<xsl:with-param name="nodes" select="$nodes"/>
						<xsl:with-param name="n1-pos" select="$max-of-rest"/>
						<xsl:with-param name="n2-pos" select="$start"/>
         </xsl:apply-templates>
        </xsl:variable>

        <xsl:choose>
          <xsl:when test="$isGreater = 'true'">
             <xsl:value-of select="$max-of-rest" />
          </xsl:when>
          <xsl:otherwise>
             <xsl:value-of select="$start" />
          </xsl:otherwise>
        </xsl:choose>
     </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[namespace-uri() = 'exsl-default-relation-gt']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

    <xsl:value-of select="$nodes[$n1-pos] > $nodes[$n2-pos]"/>
  </xsl:template>

<xsl:template match="*[namespace-uri() = 'exsl-default-relation-lt']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

    <xsl:value-of select="$nodes[$n1-pos] &lt; $nodes[$n2-pos]"/>
  </xsl:template>


</xsl:stylesheet>


