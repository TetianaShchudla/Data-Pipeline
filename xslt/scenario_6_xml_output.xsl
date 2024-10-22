<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:ns1="https://www.datasciencetech.institute"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <!-- Main template -->
    <xsl:template match="/ns1:culturalCenter">
        <culturalCenter
                xmlns="https://www.datasciencetech.institute"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="https://www.datasciencetech.institute main.xsd">
            <xsl:for-each select="ns1:teacher">
                <teacher>
                    <xsl:copy-of select="ns1:firstName"/>
                    <xsl:copy-of select="ns1:lastName"/>
                    <xsl:copy-of select="ns1:activity"/>
                    <xsl:copy-of select="ns1:phone"/>
                    <xsl:copy-of select="ns1:email"/>
                </teacher>
            </xsl:for-each>
        </culturalCenter>
    </xsl:template>
</xsl:stylesheet>
