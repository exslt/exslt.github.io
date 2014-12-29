<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:math="http://www.exslt.org/math"
                exclude-result-prefixes="math">
<xsl:template name="math:power">
  <xsl:param name="value" select="1" />
  <xsl:param name="base" select="/.." />
  <xsl:param name="power" select="/.." />

  <xsl:choose>
    <xsl:when test="$power=0">
      <xsl:value-of select="$value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="math:power">
        <xsl:with-param name="value">
          <xsl:value-of select="$value * $base"/>
        </xsl:with-param>  
        <xsl:with-param name="base">
          <xsl:value-of select="$base"/>
        </xsl:with-param>
        <xsl:with-param name="power">
          <xsl:value-of select="$power - 1"/>
        </xsl:with-param>
      </xsl:call-template>  
    </xsl:otherwise>  
  </xsl:choose>  
</xsl:template>

</xsl:stylesheet>
