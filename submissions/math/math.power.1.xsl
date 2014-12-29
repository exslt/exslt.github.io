<xsl:stylesheet version="1.0"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          xmlns:math="http://www.exslt.org/math"
          extension-element-prefixes="math">
<xsl:import href="math.power.template.xsl" />

<xsl:template match="/">

<xsl:for-each select="//test">
<xsl:value-of select="node()"/> to the <xsl:value-of select="@power"/> power =
<xsl:call-template name="math:power">
   <xsl:with-param name="power" select="3" />
   <xsl:with-param name="base" select="3" />
</xsl:call-template>

<br />
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>