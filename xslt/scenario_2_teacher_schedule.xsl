<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="https://www.datasciencetech.institute/scheduling">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/ns:culturalCenter">
        <html>
            <body>
                <h1 style="color:#A81639">Schedule of Teacher Shi-Woo Park</h1>
                <table border="1" bgcolor="#f4eee8">
                    <!-- Table Headers for Days of the Week -->
                    <tr bgcolor="#FF4040">
                        <th>Time</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                    <!-- Iterate over predefined time slots -->
                    <xsl:for-each select="document('')/*/ns:timeSlots/slot">
                        <xsl:variable name="currentSlot" select="." />
                        <tr>
                            <td><xsl:value-of select="$currentSlot" /></td>

                            <!-- Iterate over days of the week -->
                            <xsl:for-each select="document('')/*/ns:days/day">
                                <xsl:variable name="currentDay" select="." />

                                <!-- Check for activities/events on that day and time -->
                                <!-- Check for activities/events on that day and time -->
                                <td>
                                    <xsl:variable name="activitiesCount" select="count(/ns:culturalCenter/ns:timeslot[substring(ns:startTime, 1, 2) &lt;= substring($currentSlot, 1, 2) and substring(ns:endTime, 1, 2) &gt; substring($currentSlot, 1, 2) and ns:daysOfWeek = $currentDay])" />
                                    
                                    <!-- If there are two overlapping activities/events -->
                                    <xsl:if test="$activitiesCount = 2">
                                        <xsl:for-each select="/ns:culturalCenter/ns:timeslot[substring(ns:startTime, 1, 2) &lt;= substring($currentSlot, 1, 2) and substring(ns:endTime, 1, 2) &gt; substring($currentSlot, 1, 2) and ns:daysOfWeek = $currentDay and ns:teacher='Shi-Woo Park']">
                                            <div style="border:2px solid black; margin:5px; width: 70%; float: left; background-color:#f5cebe">
                                                <strong style="color:#114e60"><xsl:value-of select="ns:name" /></strong><br/>
                                                <b style="color:#5E5E5E"><xsl:value-of select="substring(ns:startTime, 1, 5)" /> - <xsl:value-of select="substring(ns:endTime, 1, 5)" /> </b><br/>
                                                Room: <strong style="color:#1E1E1E"><xsl:value-of select="ns:roomID" /></strong><br/>
                                                Teacher: <b style="color:#C72820"><xsl:value-of select="ns:teacher" /></b>
                                            </div>
                                        </xsl:for-each>
                                    </xsl:if>

                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Define the predefined time slots and days -->
    <ns:timeSlots>
        <slot>09:00</slot>
        <slot>10:30</slot>
        <slot>12:00</slot>
        <!--        <slot>12:30:00</slot>-->
        <slot>13:00</slot>
        <!--        <slot>13:30:00</slot>-->
        <slot>14:00</slot>
        <!--        <slot>14:30:00</slot>-->
        <!--        <slot>15:00:00</slot>-->
        <slot>15:30</slot>
        <!--        <slot>16:00:00</slot>-->
        <!--        <slot>16:30:00</slot>-->
        <slot>17:00</slot>
    </ns:timeSlots>

    <ns:days>
        <day>Monday</day>
        <day>Tuesday</day>
        <day>Wednesday</day>
        <day>Thursday</day>
        <day>Friday</day>
        <day>Saturday</day>
        <day>Sunday</day>
    </ns:days>
</xsl:stylesheet>