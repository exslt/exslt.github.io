<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:gt1="gt1"
xmlns:gt2="gt2"
xmlns:lt1="lt1"
xmlns:lt2="lt2"
  exclude-result-prefixes="gt1 gt2 lt1 lt2"
>

  <gt1:node/>
  <gt2:node/>
  <lt1:node/>
  <lt2:node/>


  <xsl:variable name="gt1-node" select="document('')//gt1:*"/>
  <xsl:variable name="gt2-node" select="document('')//gt2:*"/>
  <xsl:variable name="lt1-node" select="document('')//lt1:*"/>
  <xsl:variable name="lt2-node" select="document('')//lt2:*"/>


 <xsl:output omit-xml-declaration="yes"/>

 <xsl:include href="genericMath.minmax.template.xsl"/>
 
 <xsl:variable name="nodes" select="/dates/datesUnSorted/date/@value"/>

<xsl:template match="/">
<xsl:variable name="vMax1">
 <xsl:call-template name="pMax">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
   <xsl:with-param name="greaterTemplateUID" select="$gt1-node"/>
 </xsl:call-template>
</xsl:variable>

<Result>
<xsl:text>&#xA;</xsl:text>
<xsl:value-of select="concat('Max1: nodes[',$vMax1, '] = ', $nodes[position()=$vMax1] )"/>
<xsl:text>&#xA;</xsl:text>

<xsl:variable name="vMax2">
 <xsl:call-template name="pMax">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
   <xsl:with-param name="greaterTemplateUID" select="$gt2-node"/>
 </xsl:call-template>
</xsl:variable>

<xsl:value-of select="concat('Max2: nodes[',$vMax2, '] = ', $nodes[position()=$vMax2] )"/>
<xsl:text>&#xA;</xsl:text>

<xsl:variable name="vMax3">
 <xsl:call-template name="pMax">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
 </xsl:call-template>
</xsl:variable>

<xsl:value-of select="concat('Max3: nodes[',$vMax3, '] = ', $nodes[position()=$vMax3] )"/>
<xsl:text>&#xA;</xsl:text>


<xsl:variable name="vMin1">
 <xsl:call-template name="pMin">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
   <xsl:with-param name="lessThanTemplateUID" select="$lt1-node"/>
 </xsl:call-template>
</xsl:variable>

<xsl:value-of select="concat('Min1: nodes[',$vMin1, '] = ', $nodes[position()=$vMin1] )"/>
<xsl:text>&#xA;</xsl:text>

<xsl:variable name="vMin2">
 <xsl:call-template name="pMin">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
   <xsl:with-param name="lessThanTemplateUID" select="$lt2-node"/>
 </xsl:call-template>
</xsl:variable>

<xsl:value-of select="concat('Min1: nodes[',$vMin2, '] = ', $nodes[position()=$vMin2] )"/>
<xsl:text>&#xA;</xsl:text>

<xsl:variable name="vMin3">
 <xsl:call-template name="pMin">
   <xsl:with-param name="nodes" select="$nodes"/>
   <xsl:with-param name="start" select="1"/>
   <xsl:with-param name="end" select="count($nodes)"/>
 </xsl:call-template>
</xsl:variable>

<xsl:value-of select="concat('Min3: nodes[',$vMin3, '] = ', $nodes[position()=$vMin3] )"/>
<xsl:text>&#xA;</xsl:text>

</Result>
</xsl:template>

<xsl:template match="*[namespace-uri() = 'gt1']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

    <xsl:value-of select="$nodes[$n1-pos] > $nodes[$n2-pos]"/>
  </xsl:template>

 <xsl:template match="*[namespace-uri() = 'gt2']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

    <xsl:value-of
    select="100 - $nodes[position()=$n1-pos]
            >
            100 - $nodes[position()=$n2-pos]"/>
  </xsl:template>

 <xsl:template match="*[namespace-uri() = 'lt1']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

    <xsl:value-of select="$nodes[$n1-pos] &lt; $nodes[$n2-pos]"/>
  </xsl:template>

 <xsl:template match="*[namespace-uri() = 'lt2']">
	<xsl:param name="nodes" select="/.."/>
	<xsl:param name="n1-pos" select="0"/>
	<xsl:param name="n2-pos" select="0"/>

<xsl:value-of select="substring($nodes[position()=$n1-pos],5) &lt;
substring($nodes[position()=$n2-pos],5)"/>

  </xsl:template>


</xsl:stylesheet>


