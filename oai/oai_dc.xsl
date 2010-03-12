<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.openarchives.org/OAI/2.0/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:xq="http://metalab.unc.edu/xql"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  version="1.0">

  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="prefix"/>

  <!-- need unqualified dublin core for Primo -->
  <xsl:param name="qualified">false</xsl:param>

  <xsl:include href="../xsl/teiheader-dc.xsl"/>
  <xsl:include href="xmldbOAI/xsl/response.xsl"/>

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
          <xsl:call-template name="common-fields"/>
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
      
      <!-- (no sets in french revolution) -->

      <!-- NOTE: Primo requires sets, so adding one set for all pamphlets -->
      <setSpec>revolutionpamphlets</setSpec>
    </xsl:element>
  </xsl:template>


  <!-- FIXME: same description for all docs; worth including? -->
  <!--  <xsl:template match="encodingDesc/projectDesc"/> -->
  
  <xsl:template match="LastModified"/>	<!-- ignore in normal context -->
  
  
  <!-- default: ignore anything not explicitly selected (but do process child nodes) -->
  <xsl:template match="node()">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- <xsl:template match="text()|@*"/> -->
  
</xsl:stylesheet>
