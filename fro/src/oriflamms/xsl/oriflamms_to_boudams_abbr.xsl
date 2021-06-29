<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        
        <xsl:apply-templates select="descendant::tei:w | descendant::tei:pc | descendant::tei:lb[not(ancestor::tei:w)]"/>
        
    </xsl:template>
    
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr | tei:orig | tei:sic"/>
    </xsl:template>
    
    <xsl:template match="tei:w">
        <xsl:if test="not(preceding::element()[1]/local-name() = 'lb' and preceding::element()[1]/@break='no')">
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if test="not(following::element()[1]/local-name() = 'lb' and following::element()[1]/@break='no')">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:lb[ancestor::tei:w or @break='no']"/>
    
    
    <xsl:template match="text()">
        <!--<xsl:value-of select="normalize-unicode(normalize-space(.), 'nfd')"/>-->
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    
</xsl:stylesheet>
