<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:ns1="https://www.datasciencetech.institute"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Main template -->
<xsl:template match="/">
    <html>
        <head>
            <title>Tickets sold for each event</title>
        </head>

        <!-- General comment about this scenario -->
        <body>
            <p>
                <b>Remark: </b>There are <xsl:value-of select="count(ns1:culturalCenter/ns1:ticket)"/> events in general in our database.
                Tickets for these events are divided into 3 categoties: active, pending and expired.
                The total amount of tickets sold for these 3 categories:  <xsl:value-of select="sum(ns1:culturalCenter/ns1:ticket/ns1:ticketPrice)"/>.
            </p>

            <!-- Active tickets sold table -->
            <h3>Tickets sold for <xsl:value-of select="count(ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='active'])"/> events (ticket process is active)</h3>
            <table border="2" cellpadding="3">
                <tr bgcolor="#0076C4" align="center">
                    <th><b style="color:#dce2e6">Event</b></th>
                    <th><b style="color:#dce2e6">Active Tickets</b></th>
                </tr>
                <xsl:for-each select="ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='active']">
                    <tr >
                        <td><xsl:value-of select="ns1:eventName"/></td>
                        <td><xsl:value-of select="sum(ns1:ticketPrice)"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <!-- Pending tickets sold table -->
            <h3>Tickets sold for <xsl:value-of select="count(ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='pending'])"/> event (ticket process is pending)</h3>
            <table border="2" cellpadding="3">
                <tr bgcolor="#0076C4" align="center">
                    <th><b style="color:#dce2e6">Event</b></th>
                    <th><b style="color:#dce2e6">Pending Tickets</b></th>
                </tr>
                <xsl:for-each select="ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='pending']">
                    <tr>
                        <td><xsl:value-of select="ns1:eventName"/></td>
                        <td><xsl:value-of select="sum(ns1:ticketPrice)"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <!-- Expired tickets sold table -->
            <h3>Tickets sold for <xsl:value-of select="count(ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='expired'])"/> events (ticket process is expired)</h3>
            <table border="2" cellpadding="3">
                <tr bgcolor="#0076C4" align="center">
                    <th><b style="color:#dce2e6">Event</b></th>
                    <th><b style="color:#dce2e6">Expired Tickets</b></th>
                </tr>
                <xsl:for-each select="ns1:culturalCenter/ns1:ticket[ns1:ticketCondition='expired']">
                    <tr>
                        <td><xsl:value-of select="ns1:eventName"/></td>
                        <td><xsl:value-of select="sum(ns1:ticketPrice)"/></td>
                    </tr>
                </xsl:for-each>

            </table>

        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
