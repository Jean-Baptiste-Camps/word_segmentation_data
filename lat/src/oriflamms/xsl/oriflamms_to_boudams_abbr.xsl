<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:variable name="myCollection" select="collection('../?select=*.xml')"/>
    
    
    
    <xsl:template match="/">
        
        <xsl:apply-templates select="descendant::tei:w | descendant::tei:pc"/>
        
    </xsl:template>
    
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr | tei:orig | tei:sic"/>
    </xsl:template>
    
    <xsl:template match="tei:w">
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="text()">
        <!--<xsl:value-of select="normalize-unicode(normalize-space(.), 'nfd')"/>-->
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    
</xsl:stylesheet>