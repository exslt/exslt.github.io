<xsl:stylesheet version="1.0"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          xmlns:math="http://www.exslt.org/math"
          extension-element-prefixes="math">
<xsl:import href="math.constant.template.xsl" />

<xsl:template match="/">

<xsl:for-each select="//test">
<xsl:value-of select="node()"/> constant with precision=<xsl:value-of select="@p"/><br />

<xsl:call-template name="math:constant">
   <xsl:with-param name="name" select="node()" />
   <xsl:with-param name="precision" select="@p" />
</xsl:call-template>

<br />
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>