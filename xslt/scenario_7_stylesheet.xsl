<?xml version="1.0"?>

<!--In this scenario, we are transforming the xml file into a JSON
What we are trying to get is the list of -->

<xsl:stylesheet version="1.0"
                xmlns:ns1="https://www.datasciencetech.institute"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="yes"/>

    <!-- Main template -->
    <xsl:template match="/ns1:culturalCenter">
        <culturalCenter
                xmlns="https://www.datasciencetech.institute"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="https://www.datasciencetech.institute main.xsd">
            <xsl:text>{"culturalCenter":{
                "activity":[</xsl:text>
            <!--iteration through activities-->
            <xsl:for-each select="ns1:activity">
                <activity>
                    <!--starting point of the JSON-->
                    <xsl:text>{"activityID":"</xsl:text><xsl:value-of select="ns1:activityID"/><xsl:text>",
                    "activityName":"</xsl:text><xsl:value-of select="ns1:activityName"/><xsl:text>",
                    "activityType":"</xsl:text><xsl:value-of select="ns1:activityType"/><xsl:text>",
                    "description":"</xsl:text><xsl:value-of select="ns1:description"/>
                    <xsl:text>"},</xsl:text>
                </activity>
            </xsl:for-each>
            <xsl:text>]}}</xsl:text>
        </culturalCenter>
    </xsl:template>
</xsl:stylesheet>