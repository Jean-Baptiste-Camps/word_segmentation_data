<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:variable name="myCollection" select="collection('../?select=*.xml')"/>
    
    
    
    <xsl:template match="/">
        
        <xsl:result-document href="../output/oriflamms_abbr.tsv">
            <xsl:apply-templates select="$myCollection/descendant::tei:lb" mode="main"/>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr | tei:orig | tei:sic"/>
    </xsl:template>
    
    <xsl:template match="tei:lb" mode="main">
        <xsl:variable name="monLb" select="generate-id(.)"/>
        <!-- Get content -->
        <!-- It should be straightforward, but there is ONE issue:
            some w contain a linebreak and we need to treat them differently
        -->
        <xsl:variable name="myContent">
            <!-- YUK, I'll have to do for-each and call-template :/ -->
            <xsl:for-each select="./following::tei:w[generate-id(preceding::tei:lb[1]) = $monLb] | ./ancestor::tei:w">
                <xsl:call-template name="handleWords">
                    <xsl:with-param name="word" select="."/>
                    <xsl:with-param name="monLb" select="$monLb"/>
                </xsl:call-template>
            </xsl:for-each>            
        </xsl:variable>
        <!-- It's actually even a bit more complicated, because they are cases where it is encoded as
        <w xml:id="w_mss-dates_1740">lau</w><lb break="no" n="17" xml:id="line_IRHT_P_001198_1-17"/><w xml:id="w_mss-dates_1741">des</w>
        
        So, need to handle when
        1. My current lb has a @break='no' and is not in a w: -> do not take the word that immediately follows it
        2. and/or the following lb has a @break='no' ans is not in a w -> take the first word after it
        
        -->
        <xsl:variable name="myContentNorm">
            <xsl:choose>
                <!-- CASE 1 -->
                <xsl:when test="@break='no' and not(ancestor::tei:w)">
                    <xsl:apply-templates select=" 
                        ./following::tei:w[generate-id(preceding::tei:lb[1]) = $monLb][position() > 1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="./following::tei:w[generate-id(preceding::tei:lb[1]) = $monLb]"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- CASE 2 -->
            <!-- CANNOT BE HANDLED HERE BECAUSE OF TRAILING SPACE, SEE THE tei:w template -->
        </xsl:variable>
        <!-- Left: unspaced line -->
        <xsl:value-of select="replace($myContent, '\s+', '')"/>        
        <xsl:text>&#9;</xsl:text>
        <!-- Right: normalised line -->
        <xsl:value-of select="normalize-space($myContentNorm)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:lb" mode="#default"/>
    
    <xsl:template match="tei:w">
        <xsl:text> </xsl:text>
        <xsl:variable name="content">
            <xsl:apply-templates/>
            <!-- CASE 2: are we missing a part to be taken from next word ? -->
            <xsl:if test="following::element()[1]/local-name()='lb' and following::element()[1]/@break='no' and not(following::element()[1]/ancestor::tei:w)">
                <xsl:variable name="otherID"/>
                <xsl:apply-templates select=" 
                    ./following::element()[1]/following::tei:w[1]/node()"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="replace($content, '\s+', '')"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template name="handleWords">
        <xsl:param name="word"/>
        <xsl:param name="monLb"/>
        <xsl:text> </xsl:text>
        <!-- Two possibilities
        1. the lb inside is the one opening the line we are currently handling -> we want only what follows it
        2. the lb inside is the one opening the NEXT line -> we want only what's before
        -->
        <xsl:choose>
            <xsl:when test="$word/descendant::tei:lb">
                <xsl:choose>
                    <xsl:when test="generate-id($word/descendant::tei:lb[1]) = $monLb">
                        <!-- CASE 1 -->
                        <!-- Take only text after the line break -->
                        <xsl:apply-templates select="$word/child::node()[preceding-sibling::tei:lb]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- CASE 2 -->
                        <!-- Take only text before the line break -->
                        <xsl:apply-templates select="$word/child::node()[following-sibling::tei:lb]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- NO LB PRAISE ODIN -->
                <xsl:apply-templates select="$word/child::node()"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    
</xsl:stylesheet>