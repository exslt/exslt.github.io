<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">

<date:month-lengths>
   <date:month>31</date:month>
   <date:month>28</date:month>
   <date:month>31</date:month>
   <date:month>30</date:month>
   <date:month>31</date:month>
   <date:month>30</date:month>
   <date:month>31</date:month>
   <date:month>31</date:month>
   <date:month>30</date:month>
   <date:month>31</date:month>
   <date:month>30</date:month>
   <date:month>31</date:month>
</date:month-lengths>

<xsl:variable name="date:date-time" select="'1970-01-01T00:00:00Z'" />

<xsl:template name="date:seconds">
	<xsl:param name="date-time">
      <xsl:choose>
         <xsl:when test="function-available('date:date-time')">
            <xsl:value-of select="date:date-time()" />
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date:date-time" />
         </xsl:otherwise>
      </xsl:choose>
   </xsl:param>
   <xsl:choose>
     <xsl:when test="starts-with($date-time, 'P') or starts-with($date-time, '-P')">
       <xsl:variable name="sign" select="(starts-with($date-time, '-') * -2) + 1" />
       <xsl:variable name="period">
          <xsl:choose>
            <xsl:when test="starts-with($date-time, '-')"><xsl:value-of select="substring($date-time, 3)" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="substring($date-time, 2)" /></xsl:otherwise>
          </xsl:choose> 
       </xsl:variable>
       <xsl:variable name="seconds">
         <xsl:message terminate="yes">Not yet implemented seconds from period</xsl:message>
       </xsl:variable>
       <xsl:value-of select="$seconds" />
     </xsl:when>
     <xsl:otherwise>
       <xsl:variable name="neg" select="starts-with($date-time, '-')" />
       <xsl:variable name="no-neg">
          <xsl:choose>
             <xsl:when test="$neg or starts-with($date-time, '+')">
                <xsl:value-of select="substring($date-time, 2)" />
             </xsl:when>
             <xsl:otherwise>
                <xsl:value-of select="$date-time" />
             </xsl:otherwise>
          </xsl:choose>
       </xsl:variable>
       <xsl:variable name="no-neg-length" select="string-length($no-neg)" />
       <xsl:variable name="timezone">
          <xsl:choose>
             <xsl:when test="substring($no-neg, $no-neg-length) = 'Z'">Z</xsl:when>
             <xsl:otherwise>
                <xsl:variable name="tz" select="substring($no-neg, $no-neg-length - 5)" />
                <xsl:if test="(substring($tz, 1, 1) = '-' or 
                               substring($tz, 1, 1) = '+') and
                              substring($tz, 4, 1) = ':'">
                   <xsl:value-of select="$tz" />
                </xsl:if>
             </xsl:otherwise>
          </xsl:choose>
       </xsl:variable>
       <xsl:variable name="seconds">
          <xsl:if test="not(string($timezone)) or
                        $timezone = 'Z' or 
                        (substring($timezone, 2, 2) &lt;= 23 and
                         substring($timezone, 5, 2) &lt;= 59)">
             <xsl:variable name="dt" select="substring($no-neg, 1, $no-neg-length - string-length($timezone))" />
             <xsl:variable name="dt-length" select="string-length($dt)" />
             <xsl:variable name="year" select="substring($dt, 1, 4) * (($neg * -2) + 1)" />
             <xsl:variable name="y-1" select="$year - 1" />
             <xsl:variable name="leaps" 
                           select="floor($y-1 div 4) -
                                   floor($y-1 div 100) +
                                   floor($y-1 div 400)" />
             <xsl:variable name="leap" select="(not($year mod 4) and $year mod 100) or not($year mod 400)" />
             <xsl:variable name="year-days" select="($year * 365) + $leaps" />
             <xsl:choose>
                <xsl:when test="not(number($year))" />
                <xsl:when test="$dt-length = 4">
                   <xsl:value-of select="$year-days * 24 * 60 * 60" />
                </xsl:when>
                <xsl:when test="substring($dt, 5, 1) = '-'">
                   <xsl:variable name="month" select="substring($dt, 6, 2)" />
                   <xsl:variable name="month-lengths" select="document('')/*/date:month-lengths/date:month" />
                   <xsl:variable name="month-days" 
                                 select="sum($month-lengths[position() &lt; $month])" />
                   <xsl:choose>
                      <xsl:when test="not($month &lt;= 12)" />
                      <xsl:when test="$dt-length = 7">
                        <xsl:value-of select="($year-days + $month-days) * 24 * 60 * 60" />
                      </xsl:when>
                      <xsl:when test="substring($dt, 8, 1)">
                         <xsl:variable name="day" select="substring($dt, 9, 2)" />
                         <xsl:if test="$day &lt;= 31">
                            <xsl:variable name="days">
                               <xsl:variable name="days" 
                                             select="$year-days + $month-days + $day" />
                               <xsl:choose>
                                  <xsl:when test="$leap and $month > 2">
                                     <xsl:value-of select="$days + 1" />
                                  </xsl:when>
                                  <xsl:otherwise>
                                     <xsl:value-of select="$days" />
                                  </xsl:otherwise>
                               </xsl:choose>
                            </xsl:variable>
                            <xsl:choose>
                               <xsl:when test="$dt-length = 10">
                                  <xsl:value-of select="$days * 24 * 60 * 60" />
                               </xsl:when>
                               <xsl:when test="substring($dt, 11, 1) = 'T' and
                                               substring($dt, 14, 1) = ':' and
                                               substring($dt, 17, 1) = ':'">
                                  <xsl:variable name="hour" select="substring($dt, 12, 2)" />
                                  <xsl:variable name="min" select="substring($dt, 15, 2)" />
                                  <xsl:variable name="sec" select="substring($dt, 18)" />
                                  <xsl:if test="$hour &lt;= 23and
                                                $min &lt;= 59 and
                                                $sec &lt;= 60">
                                     <xsl:variable name="min-s" select="60" />
                                     <xsl:variable name="hour-s" select="60 * 60" />
                                     <xsl:variable name="day-s" select="60 * 60 * 24" />

                                     <xsl:variable name="tz-adj">
                                        <xsl:variable name="tz" 
                                                      select="(substring($timezone, 2, 2) * $hour-s) + 
                                                              (substring($timezone, 5, 2) * $min-s)" />
                                        <xsl:choose>
                                           <xsl:when test="starts-with($timezone, '-')">
                                              <xsl:value-of select="$tz" />
                                           </xsl:when>
                                           <xsl:when test="starts-with($timezone, '+')">
                                              <xsl:value-of select="$tz * -1" />
                                           </xsl:when>
                                           <xsl:otherwise>0</xsl:otherwise>
                                        </xsl:choose>
                                     </xsl:variable>
                                     <xsl:value-of select="$sec + ($min * $min-s) + ($hour * $hour-s) + ($days * $day-s) + $tz-adj" />
                                  </xsl:if>
                               </xsl:when>
                            </xsl:choose>
                         </xsl:if>
                      </xsl:when>
                   </xsl:choose>
                </xsl:when>
             </xsl:choose>
          </xsl:if>
       </xsl:variable>
       <xsl:value-of select="$seconds - 62167219200" />   
     </xsl:otherwise>
   </xsl:choose>
</xsl:template>

</xsl:stylesheet>