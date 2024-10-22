<?xml version="1.0"?>

<xsl:stylesheet version="1.0" 
                xmlns:ns1="https://www.datasciencetech.institute"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Define a key to group <ns:public> elements by gender -->
    <xsl:key name="genderGroup" match="ns1:public" use="ns1:gender" />

    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Gender Ratio of the Public</title>
            </head>

            <body>
                <h1>Gender Ratio of the Public</h1>
                <xsl:variable name="maleCount" select="count(key('genderGroup', 'Male'))" />
                <xsl:variable name="femaleCount" select="count(key('genderGroup', 'Female'))" />
                <p>Total Male: <xsl:value-of select="$maleCount" /></p>
                <p>Total Female: <xsl:value-of select="$femaleCount" /></p>
                <p>Gender Ratio: 
                    <xsl:value-of select="$maleCount" />
                    <xsl:text> / </xsl:text>
                    <xsl:value-of select="$femaleCount" />
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
