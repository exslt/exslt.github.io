<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:func="http://exslt.org/functions"
                extension-element-prefixes="date func">

<date:months>
   <date:month length="31" abbr="Jan">January</date:month>
   <date:month length="28" abbr="Feb">February</date:month>
   <date:month length="31" abbr="Mar">March</date:month>
   <date:month length="30" abbr="Apr">April</date:month>
   <date:month length="31" abbr="May">May</date:month>
   <date:month length="30" abbr="Jun">June</date:month>
   <date:month length="31" abbr="Jul">July</date:month>
   <date:month length="31" abbr="Aug">August</date:month>
   <date:month length="30" abbr="Sep">September</date:month>
   <date:month length="31" abbr="Oct">October</date:month>
   <date:month length="30" abbr="Nov">November</date:month>
   <date:month length="31" abbr="Dec">December</date:month>
</date:months>

<date:days>
   <date:day abbr="Sun">Sunday</date:day>
   <date:day abbr="Mon">Monday</date:day>
   <date:day abbr="Tue">Tuesday</date:day>
   <date:day abbr="Wed">Wednesday</date:day>
   <date:day abbr="Thu">Thursday</date:day>
   <date:day abbr="Fri">Friday</date:day>
   <date:day abbr="Sat">Saturday</date:day>
</date:days>

<func:function name="date:parse-date">
  <xsl:param name="date-time" />
  <xsl:param name="format" />
  <xsl:param name="year" select="'NaN'" />
  <xsl:param name="month" select="'NaN'" />
  <xsl:param name="day" select="'NaN'" />
  <xsl:param name="hour" select="'NaN'" />
  <xsl:param name="minute" select="'NaN'" />
  <xsl:param name="second" select="'NaN'" />
  <xsl:param name="ampm" select="''" />
  <xsl:param name="days" select="'NaN'" />
  <xsl:param name="dow" select="'NaN'" />
  <xsl:param name="dow-in-month" select="'NaN'" />
  <xsl:param name="week" select="'NaN'" />
  <xsl:param name="week-in-month" select="'NaN'" />
  <xsl:param name="epoch" select="''" />
  <xsl:param name="timezone" select="''" />
  <xsl:choose>
    <xsl:when test="$format">
      <xsl:variable name="char" select="substring($format, 1, 1)" />
      <xsl:choose>
        <xsl:when test='$char = "&apos;"'>
          <xsl:choose>
            <xsl:when test='substring($format, 2, 1) = "&apos;"'>
              <xsl:if test='substring($date-time, 1, 1) = "&apos;"'>
                <func:result select="date:parse-date(substring($date-time, 2), substring($format, 2),
                                                     $year, $month, $day, $hour, $minute, $second,
                                                     $ampm, $days, $dow, $dow-in-month, $week, 
                                                     $week-in-month, $epoch, $timezone" />
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="literal-value" select='substring-before(substring($format, 2), "&apos;")' />
              <xsl:variable name="length-literal-value" select="string-length($literal-value)" />
              <xsl:if test="substring($date-time, 1, $length-literal-value) = $literal-value">
                <func:result select="date:parse-date(substring($date-time, $length-literal-value + 1), 
                                                     substring($format, $length-literal-value + 3),
                                                     $year, $month, $day, $hour, $minute, $second,
                                                     $ampm, $days, $dow, $dow-in-month, $week, 
                                                     $week-in-month, $epoch, $timezone" />
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="not(contains('abcdefghjiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', $char))">
          <xsl:if test="substring($date-time, 1, 1) = $char">
            <func:result select="date:parse-date(substring($date-time, 2), substring($format, 2),
                                                 $year, $month, $day, $hour, $minute, $second,
                                                 $ampm, $days, $dow, $dow-in-month, $week, 
                                                 $week-in-month, $epoch, $timezone" />
          </xsl:if>
        </xsl:when>
        <xsl:when test="not(contains('GyMdhHmsSEDFwWakKz', $char))">
           <xsl:message>
              Invalid token in format string: <xsl:value-of select="$char" />
           </xsl:message>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="next-different-char" select="substring(translate($format, $char, ''), 1, 1)" />
          <xsl:variable name="pattern-length">
            <xsl:choose>
              <xsl:when test="$next-different-char">
                <xsl:value-of select="string-length(substring-before($format, $next-different-char))" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="string-length($format)" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$char = 'G'">
              <xsl:if test="starts-with($date-time, 'AD') or starts-with($date-time, 'BC')">
                <func:result select="date:parse-date(substring($date-time, 3), substring($format, $pattern-length + 1),
                                                     $year, $month, $day, $hour, $minute, $second,
                                                     $ampm, $days, $dow, $dow-in-month, $week, 
                                                     $week-in-month, substring($date-time, 1, 2), $timezone" />
              </xsl:if>
            </xsl:when>
            <xsl:when test="$char = 'M'">
              <xsl:choose>
                <xsl:when test="$pattern-length >= 4">
                  <xsl:variable name="month-node" select="document('')/*/date:months/date:month[starts-with($date-time, .)]" />
                  <xsl:if test="$month-node">
                    <func:result select="date:parse-date(substring($date-time, string-length($month-node) + 1), 
                                                         substring($format, $pattern-length + 1),
                                                         $year, count($month-node/preceding-sibling::date:month) + 1, 
                                                         $day, $hour, $minute, $second,
                                                         $ampm, $days, $dow, $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$pattern-length = 3">
                  <xsl:variable name="month-node" select="document('')/*/date:months/date:month[starts-with($date-time, @abbr)]" />
                  <xsl:if test="$month-node">
                    <func:result select="date:parse-date(substring($date-time, string-length($month-node/@abbr) + 1), 
                                                         substring($format, $pattern-length + 1),
                                                         $year, count($month-node/preceding-sibling::date:month) + 1, 
                                                         $day, $hour, $minute, $second,
                                                         $ampm, $days, $dow, $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$pattern-length = 1 and not(substring($date-time, 1, 2) &lt;= 12)">
                  <xsl:if test="number(substring($date-time, 1, 1))">
                    <func:result select="date:parse-date(substring($date-time, 2), 
                                                         substring($format, 2),
                                                         $year, substring($date-time, 1, 1), 
                                                         $day, $hour, $minute, $second,
                                                         $ampm, $days, $dow, $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="substring($date-time, 1, 2) &lt;= 12">
                    <func:result select="date:parse-date(substring($date-time, 3), 
                                                         substring($format, 3),
                                                         $year, substring($date-time, 1, 2), 
                                                         $day, $hour, $minute, $second,
                                                         $ampm, $days, $dow, $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'E'">
              <xsl:choose>
                <xsl:when test="$pattern-length >= 4">
                  <xsl:variable name="day-node" select="document('')/*/date:days/date:day[starts-with($date-time, .)]" />
                  <xsl:if test="$day-node">
                    <func:result select="date:parse-date(substring($date-time, string-length($day-node) + 1), 
                                                         substring($format, $pattern-length + 1),
                                                         $year, $month, $day, $hour, $minute, $second,
                                                         $ampm, $days, count($day-node/preceding-sibling::date:day), $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="day-node" select="document('')/*/date:days/date:day[starts-with($date-time, @abbr)]" />
                  <xsl:if test="$day-node">
                    <func:result select="date:parse-date(substring($date-time, string-length($day-node/@abbr) + 1), 
                                                         substring($format, $pattern-length + 1),
                                                         $year, $month, $day, $hour, $minute, $second,
                                                         $ampm, $days, count($day-node/preceding-sibling::date:day), $dow-in-month, $week, 
                                                         $week-in-month, $epoch, $timezone" />
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'a'">
              <xsl:if test="starts-with($date-time, 'AM') or starts-with($date-time, 'PM')">
                <func:result select="date:parse-date(substring($date-time, 3), 
                                                     substring($format, $pattern-length + 1),
                                                     $year, $month, $day, $hour, $minute, $second,
                                                     $ampm, $days, count($day-node/preceding-sibling::date:day), $dow-in-month, $week, 
                                                     $week-in-month, $epoch, $timezone" />
                <xsl:call-template name="date:parse-date">
                  <xsl:with-param name="date-time" select="substring($date-time, 3)" />
                  <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                  <xsl:with-param name="year" select="$year" />
                  <xsl:with-param name="month" select="$month" />
                  <xsl:with-param name="day" select="$day" />
                  <xsl:with-param name="hour">
                    <xsl:choose>
                      <xsl:when test="$hour &lt; 12 and starts-with($date-time, 'PM')"><xsl:value-of select="$hour + 12" /></xsl:when>
                      <xsl:otherwise><xsl:value-of select="$hour" /></xsl:otherwise>
                    </xsl:choose>
                  </xsl:with-param>
                  <xsl:with-param name="minute" select="$minute" />
                  <xsl:with-param name="second" select="$second" />
                  <xsl:with-param name="ampm" select="substring($date-time, 1, 2)" />
                  <xsl:with-param name="days" select="$days" />
                  <xsl:with-param name="dow" select="$dow" />
                  <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                  <xsl:with-param name="week" select="$week" />
                  <xsl:with-param name="week-in-month" select="$week-in-month" />
                  <xsl:with-param name="epoch" select="$epoch" />
                  <xsl:with-param name="timezone" select="$timezone" />
                </xsl:call-template>
              </xsl:if>
            </xsl:when>
            <xsl:when test="$char = 'z'">
              <xsl:if test="starts-with($date-time, 'UTC')">
                <xsl:choose>
                  <xsl:when test="(substring($date-time, 4, 1) = '+' or
                                   substring($date-time, 4, 1) = '-') and
                                   substring($date-time, 5, 2) &lt;= 23 and
                                   substring($date-time, 7, 1) = ':' and
                                   substring($date-time, 8, 2) &lt;= 59">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="substring($date-time, 10)" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="substring($date-time, 4, 6)" />
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="substring($date-time, 4)" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="'Z'" />
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="number">
                <xsl:choose>
                  <xsl:when test="substring($date-time, 1, 1) = 0">
                    <xsl:value-of select="substring($date-time, 1, $pattern-length)" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:variable name="next-non-numeric-character" select="substring(translate($date-time, '0123456789', ''), 1, 1)" />
                    <xsl:choose>
                      <xsl:when test="$next-non-numeric-character"><xsl:value-of select="substring-before($date-time, $next-non-numeric-character)" /></xsl:when>
                      <xsl:otherwise><xsl:value-of select="$date-time" /></xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="new-date-time" select="substring($date-time, string-length($number) + 1)" />
              <xsl:choose>
                <xsl:when test="$char = 'y'">
                  <xsl:choose>
                    <xsl:when test="$pattern-length >= 2">
                      <xsl:call-template name="date:parse-date">
                        <xsl:with-param name="date-time" select="$new-date-time" />
                        <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                        <xsl:with-param name="year" select="$number" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="day" select="$day" />
                        <xsl:with-param name="hour" select="$hour" />
                        <xsl:with-param name="minute" select="$minute" />
                        <xsl:with-param name="second" select="$second" />
                        <xsl:with-param name="ampm" select="$ampm" />
                        <xsl:with-param name="days" select="$days" />
                        <xsl:with-param name="dow" select="$dow" />
                        <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                        <xsl:with-param name="week" select="$week" />
                        <xsl:with-param name="week-in-month" select="$week-in-month" />
                        <xsl:with-param name="epoch" select="$epoch" />
                        <xsl:with-param name="timezone" select="$timezone" />
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="date:parse-date">
                        <xsl:with-param name="date-time" select="$new-date-time" />
                        <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                        <xsl:with-param name="year">
                          <xsl:choose>
                            <xsl:when test="string-length($number) != 2"><xsl:value-of select="$number" /></xsl:when>
                            <xsl:when test="$number > 21">19<xsl:value-of select="$number" /></xsl:when>
                            <xsl:otherwise>20<xsl:value-of select="$number" /></xsl:otherwise>
                          </xsl:choose>
                        </xsl:with-param>
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="day" select="$day" />
                        <xsl:with-param name="hour" select="$hour" />
                        <xsl:with-param name="minute" select="$minute" />
                        <xsl:with-param name="second" select="$second" />
                        <xsl:with-param name="ampm" select="$ampm" />
                        <xsl:with-param name="days" select="$days" />
                        <xsl:with-param name="dow" select="$dow" />
                        <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                        <xsl:with-param name="week" select="$week" />
                        <xsl:with-param name="week-in-month" select="$week-in-month" />
                        <xsl:with-param name="epoch" select="$epoch" />
                        <xsl:with-param name="timezone" select="$timezone" />
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:when test="$char = 'd'">
                  <xsl:if test="$number &lt;= 31">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$number" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'h'">
                  <xsl:if test="$number >= 1 and $number &lt;= 12">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour">
                        <xsl:choose>
                          <xsl:when test="$ampm = 'PM'">
                            <xsl:choose>
                              <xsl:when test="$number = 12">12</xsl:when>
                              <xsl:otherwise><xsl:value-of select="$number + 12" /></xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:choose>
                              <xsl:when test="$number = 12">0</xsl:when>
                              <xsl:otherwise><xsl:value-of select="$number" /></xsl:otherwise>
                            </xsl:choose>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'H'">
                  <xsl:if test="$number &lt;= 23">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$number" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm">
                        <xsl:choose>
                          <xsl:when test="$number >= 12">PM</xsl:when>
                          <xsl:otherwise>AM</xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'k'">
                  <xsl:if test="$number >= 1 and $number &lt;= 24">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour">
                        <xsl:choose>
                          <xsl:when test="$number = 24">0</xsl:when>
                          <xsl:otherwise><xsl:value-of select="$number" /></xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm">
                        <xsl:choose>
                          <xsl:when test="$number >= 12 and $number != 24">PM</xsl:when>
                          <xsl:otherwise>AM</xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'K'">
                  <xsl:if test="$number &lt;= 11">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour">
                        <xsl:choose>
                          <xsl:when test="$ampm = 'PM'">
                            <xsl:value-of select="$number + 12" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$number" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'm'">
                  <xsl:if test="$number &lt;= 59">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$number" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 's'">
                  <xsl:if test="$number &lt;= 60">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$number" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'S'">
                  <xsl:call-template name="date:parse-date">
                    <xsl:with-param name="date-time" select="$new-date-time" />
                    <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                    <xsl:with-param name="year" select="$year" />
                    <xsl:with-param name="month" select="$month" />
                    <xsl:with-param name="day" select="$day" />
                    <xsl:with-param name="hour" select="$hour" />
                    <xsl:with-param name="minute" select="$minute" />
                    <xsl:with-param name="second">
                      <xsl:choose>
                        <xsl:when test="string($second) = 'NaN'">0.<xsl:value-of select="$number" /></xsl:when>
                        <xsl:otherwise><xsl:value-of select="$second" />.<xsl:value-of select="$number" /></xsl:otherwise>
                      </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="ampm" select="$ampm" />
                    <xsl:with-param name="days" select="$days" />
                    <xsl:with-param name="dow" select="$dow" />
                    <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                    <xsl:with-param name="week" select="$week" />
                    <xsl:with-param name="week-in-month" select="$week-in-month" />
                    <xsl:with-param name="epoch" select="$epoch" />
                    <xsl:with-param name="timezone" select="$timezone" />
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$char = 'k'">
                  <xsl:if test="$number &lt;= 5">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$number" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'D'">
                  <xsl:if test="$number &lt;= 366">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$number" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'w'">
                  <xsl:if test="$number &lt;= 53">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$number" />
                      <xsl:with-param name="week-in-month" select="$week-in-month" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="$char = 'W'">
                  <xsl:if test="$number &lt;= 6">
                    <xsl:call-template name="date:parse-date">
                      <xsl:with-param name="date-time" select="$new-date-time" />
                      <xsl:with-param name="format" select="substring($format, $pattern-length + 1)" />
                      <xsl:with-param name="year" select="$year" />
                      <xsl:with-param name="month" select="$month" />
                      <xsl:with-param name="day" select="$day" />
                      <xsl:with-param name="hour" select="$hour" />
                      <xsl:with-param name="minute" select="$minute" />
                      <xsl:with-param name="second" select="$second" />
                      <xsl:with-param name="ampm" select="$ampm" />
                      <xsl:with-param name="days" select="$days" />
                      <xsl:with-param name="dow" select="$dow" />
                      <xsl:with-param name="dow-in-month" select="$dow-in-month" />
                      <xsl:with-param name="week" select="$week" />
                      <xsl:with-param name="week-in-month" select="$number" />
                      <xsl:with-param name="epoch" select="$epoch" />
                      <xsl:with-param name="timezone" select="$timezone" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="formattedDate">
        <xsl:call-template name="date:_construct-date">
          <xsl:with-param name="year" select="$year" />
          <xsl:with-param name="month" select="$month" />
          <xsl:with-param name="day" select="$day" />
          <xsl:with-param name="hour" select="$hour" />
          <xsl:with-param name="minute" select="$minute" />
          <xsl:with-param name="second" select="$second" />
          <xsl:with-param name="days" select="$days" />
          <xsl:with-param name="dow" select="$dow" />
          <xsl:with-param name="dow-in-month" select="$dow-in-month" />
          <xsl:with-param name="week" select="$week" />
          <xsl:with-param name="week-in-month" select="$week-in-month" />
          <xsl:with-param name="epoch" select="$epoch" />
          <xsl:with-param name="timezone" select="$timezone" />
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="string($formattedDate)" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="date:_construct-date">
  <xsl:param name="year" select="'NaN'" />
  <xsl:param name="month" select="'NaN'" />
  <xsl:param name="day" select="'NaN'" />
  <xsl:param name="hour" select="'NaN'" />
  <xsl:param name="minute" select="'NaN'" />
  <xsl:param name="second" select="'NaN'" />
  <xsl:param name="days" select="'NaN'" />
  <xsl:param name="dow" select="'NaN'" />
  <xsl:param name="dow-in-month" select="'NaN'" />
  <xsl:param name="week" select="'NaN'" />
  <xsl:param name="week-in-month" select="'NaN'" />
  <xsl:param name="epoch" select="''" />
  <xsl:param name="timezone" select="''" />
  <xsl:message>
    year: <xsl:value-of select="$year" />
    month: <xsl:value-of select="$month" />
    day: <xsl:value-of select="$day" />
    hour: <xsl:value-of select="$hour" />
    minute: <xsl:value-of select="$minute" />
    second: <xsl:value-of select="$second" />
  </xsl:message>
  <xsl:variable name="Y" select="number($year)" />
  <xsl:variable name="M" select="number($month)" />
  <xsl:variable name="D" select="number($day)" />
  <xsl:variable name="h" select="number($hour)" />
  <xsl:variable name="m" select="number($minute)" />
  <xsl:variable name="s" select="number($second)" />
  <xsl:variable name="date-time">
    <xsl:choose>
      <xsl:when test="($h = $h or $m = $m or $s = $s) and
                      not($h = $h and $m = $m and $s = $s)">
        <xsl:call-template name="date:_construct-date">
          <xsl:with-param name="year" select="$Y" />
          <xsl:with-param name="month" select="$M" />
          <xsl:with-param name="day" select="$D" />
          <xsl:with-param name="hour">
            <xsl:choose>
              <xsl:when test="$h != $h">0</xsl:when>
              <xsl:otherwise><xsl:value-of select="$h" /></xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="minute">
            <xsl:choose>
              <xsl:when test="$m != $m">0</xsl:when>
              <xsl:otherwise><xsl:value-of select="$m" /></xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="second">
            <xsl:choose>
              <xsl:when test="$s != $s">0</xsl:when>
              <xsl:otherwise><xsl:value-of select="$s" /></xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="epoch" select="$epoch" />
          <xsl:with-param name="timezone" select="$timezone" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Y and $M and $D">
        <xsl:if test="$year > 0 and $epoch = 'BC'">-</xsl:if>
        <xsl:value-of select="concat(format-number($Y, '0000'), '-', 
                                     format-number($M, '00'), '-',
                                     format-number($D, '00'))" />
        <xsl:if test="$h = $h and $m = $m and $s = $s">
          <xsl:value-of select="concat('T', format-number($h, '00'),
                                       ':', format-number($m, '00'),
                                       ':', format-number($s, '00.#########'))" />
        </xsl:if>
      </xsl:when>
      <xsl:when test="$Y">
        <xsl:variable name="leap-year" select="$year mod 4 and (not($year mod 100) or $year mod 400)" />
        <xsl:variable name="months" select="document('')/*/date:months/date:month" />
        <xsl:choose>
          <xsl:when test="number($days)">
            <xsl:variable name="month-numbers">
              <xsl:for-each select="$months">
                <xsl:if test="(sum(preceding-sibling::date:month/@length) + ($leap-year and (position() > 2))) > $days">
                  <xsl:value-of select="position()" />:<xsl:text />
                </xsl:if>
              </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="month-number" select="substring-before($month-numbers, ':') - 1" />
            <xsl:variable name="month-node" select="$months[position() = $month-number]" />
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="$year" />
              <xsl:with-param name="month" select="$month-number" />
              <xsl:with-param name="day" select="$days - sum($month-node/preceding-sibling::date:month/@length)" />
              <xsl:with-param name="hour" select="$hour" />
              <xsl:with-param name="minute" select="$minute" />
              <xsl:with-param name="second" select="$second" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="number($dow) = number($dow) and number($week) = number($week)">
            <xsl:variable name="y-1" select="$Y - 1" />
            <xsl:variable name="start-day" select="($y-1 + floor($y-1 div 4) - floor($y-1 div 100) + floor($y-1 div 400)) mod 7" />
            <xsl:variable name="day-of-week">
              <xsl:choose>
                <xsl:when test="$dow = 0">7</xsl:when>
                <xsl:otherwise><xsl:value-of select="$dow" /></xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="day-in-year" select="$day-of-week - $start-day + (7 * ($week - ($start-day &lt;= 4)))" />
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year">
                <xsl:choose>
                  <xsl:when test="$day-in-year > (365 + $leap-year)"><xsl:value-of select="$Y + 1" /></xsl:when>
                  <xsl:otherwise><xsl:value-of select="$Y" /></xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
              <xsl:with-param name="days">
                <xsl:choose>
                  <xsl:when test="$day-in-year > (365 + $leap-year)"><xsl:value-of select="$day-in-year mod (365 + $leap-year)" /></xsl:when>
                  <xsl:otherwise><xsl:value-of select="$day-in-year" /></xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$M and number($dow) = number($dow) and number($week-in-month) = number($week-in-month)">
            <!--
              $dow runs 0 (Sunday) -> 6 (Saturday)
              $start-day runs 0 (Monday) -> 7 (Sunday)
              $start-day-of-month runs 0 (Monday) -> 7 (Sunday)
            -->
            <xsl:variable name="y-1" select="$Y - 1" />
            <xsl:variable name="start-day" select="($y-1 + floor($y-1 div 4) - floor($y-1 div 100) + floor($y-1 div 400)) mod 7" />
            <xsl:variable name="start-day-of-month" select="($start-day + sum(document('')/*/date:months/date:month[$M]/preceding-sibling::date:month/@length)) mod 7" />
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="$Y" />
              <xsl:with-param name="month" select="$M" />
              <xsl:with-param name="day">
                <xsl:choose>
                  <xsl:when test="number($dow)"><xsl:value-of select="(7 * $week-in-month - 1) - $start-day-of-month + $dow" /></xsl:when>
                  <xsl:otherwise><xsl:value-of select="(7 * $week-in-month - 1) - $start-day-of-month + 7" /></xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$h = $h or $m = $m or $s = $s or $D = $D">
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="$Y" />
              <xsl:with-param name="month">
                <xsl:choose>
                  <xsl:when test="$M"><xsl:value-of select="$M" /></xsl:when>
                  <xsl:otherwise><xsl:value-of select="1" /></xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
              <xsl:with-param name="day">
                <xsl:choose>
                  <xsl:when test="$D"><xsl:value-of select="$D" /></xsl:when>
                  <xsl:otherwise><xsl:value-of select="1" /></xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="$Y > 0 and $epoch = 'BC'">-</xsl:if>
            <xsl:value-of select="format-number($Y, '0000')" />
            <xsl:if test="$M">
              <xsl:text />-<xsl:value-of select="format-number($M, '00')" />
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$M and $D">
        <xsl:choose>
          <xsl:when test="$h = $h or $m = $m or $s = $s">
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="1" />
              <xsl:with-param name="month" select="$M" />
              <xsl:with-param name="day" select="$D" />
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat('--', format-number($M, '00'),
                                         '-', format-number($D, '00'))" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$M">
        <xsl:choose>
          <xsl:when test="$h = $h or $m = $m or $s = $s">
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="1" />
              <xsl:with-param name="month" select="$M" />
              <xsl:with-param name="day" select="1" />
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat('--', format-number($M, '00'), '--')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$D">
        <xsl:choose>
          <xsl:when test="$h = $h or $m = $m or $s = $s">
            <xsl:call-template name="date:_construct-date">
              <xsl:with-param name="year" select="1" />
              <xsl:with-param name="month" select="1" />
              <xsl:with-param name="day" select="$D" />
              <xsl:with-param name="hour" select="$h" />
              <xsl:with-param name="minute" select="$m" />
              <xsl:with-param name="second" select="$s" />
              <xsl:with-param name="epoch" select="$epoch" />
              <xsl:with-param name="timezone" select="$timezone" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat('---', format-number($D, '00'))" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$h = $h and $m = $m and $s = $s">
        <xsl:value-of select="concat(format-number($h, '00'), ':',
                                     format-number($m, '00'), ':',
                                     format-number($s, '00.#########'))" />
      </xsl:when>>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="string($date-time)" />
</xsl:template>

</xsl:stylesheet>