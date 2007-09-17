<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.openarchives.org/OAI/2.0/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:xq="http://metalab.unc.edu/xql"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  version="1.0">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="prefix"/>

  <xsl:include href="../xsl/response.xsl"/>

  <!-- list identifiers : header information only -->
  <xsl:template match="TEI.2" mode="ListIdentifiers">
    <xsl:call-template name="header"/>
  </xsl:template>

  <!-- get or list records : full information (header & metadata) -->
  <xsl:template match="TEI.2">
    <record>
      <xsl:call-template name="header"/>
      <metadata>
        <oai_dc:dc>

          <xsl:apply-templates/>

          <!-- constant values for all records -->
          <dc:relation>http://beck.library.emory.edu/frenchrevolution/</dc:relation>
          <dc:language>French</dc:language>
          <dc:subject scheme="LCSH">France--History--Revolution, 1789-1799--Pamphlets.</dc:subject>
          <dc:subject scheme="LCSH">France--Politics and government--1789-1799.</dc:subject>
          <dc:type>Text</dc:type>
          <dc:format>text/xml</dc:format>
        </oai_dc:dc>
      </metadata>
    </record>
  </xsl:template>

  <xsl:template name="header">
    <xsl:element name="header">            
    <xsl:element name="identifier">	<!-- oai identifier -->
      <!-- identifier prefix is passed in as a parameter; should be defined in config file -->
      <xsl:value-of select="concat($prefix, @id)" /> 
    </xsl:element>
    <xsl:element name="datestamp">
      <xsl:value-of select="LastModified"/>
    </xsl:element>
    
    <!-- get setSpec names (must match what is in config.xml) -->

    <!-- no sets in french revolution -->
    <!--     <setSpec><xsl:value-of select="concat(@type, 's')"/></setSpec> -->

  </xsl:element>
</xsl:template>


<!-- article title -->
<xsl:template match="titleStmt/title">
  <xsl:element name="dc:title"><xsl:value-of select="."/></xsl:element>
</xsl:template>


<xsl:template match="titleStmt/author">
  <xsl:element name="dc:creator"><xsl:value-of select="."/></xsl:element>
</xsl:template>

<!-- source = original publication information -->
<xsl:template match="sourceDesc/bibl">
  <xsl:element name="dc:source">
    <xsl:value-of select="title"/>, 
    <xsl:value-of select="pubPlace"/>: 
    <xsl:value-of select="date"/>.
  </xsl:element>
</xsl:template>


  <!-- article date -->
  <xsl:template match="sourceDesc/bibl/date">
    <xsl:element name="dc:date"><xsl:value-of select="."/></xsl:element>
  </xsl:template>

  <!-- contributor -->
  <xsl:template match="titleStmt/respStmt">
    <xsl:element name="dc:contributor"><xsl:value-of select="concat(resp, ' ', name)"/></xsl:element>
  </xsl:template>

  <!-- publisher -->
  <xsl:template match="publicationStmt">
    <xsl:element name="dc:publisher">  <xsl:value-of select="publisher"/>, <xsl:value-of
    select="pubPlace"/>. <xsl:value-of select="date"/>: <xsl:value-of
    select="address/addrLine"/>.</xsl:element>
    <!-- pick up rights statement -->
    <xsl:apply-templates/>
  </xsl:template>

  <!-- rights -->
  <xsl:template match="availability">
    <xsl:element name="dc:rights"><xsl:value-of select="p"/></xsl:element>
  </xsl:template>

  <!-- subject -->
  <xsl:template match="seriesStmt/title">
    <!-- is this correct? should it be relation? -->
    <xsl:element name="dc:subject"><xsl:value-of select="."/></xsl:element>
  </xsl:template>

  <!-- description -->
  <!-- any description? available in the text? (only generic/repeated project description) -->



  <!-- ark identifier -->
<xsl:template match="idno[@type='ark']">
  <xsl:element name="dc:identifier">
    <xsl:value-of select="."/>
  </xsl:element>
</xsl:template>



<!-- default: ignore anything not explicitly selected (but do process child nodes) -->
<xsl:template match="node()">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()|@*"/>


</xsl:stylesheet>
