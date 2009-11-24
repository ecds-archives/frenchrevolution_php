<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="keyword"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="TEI.2">
    <p>
      <a>
        <xsl:attribute name="href">view.php?doc=<xsl:value-of select="docname"/>&amp;kw=<xsl:value-of select="$keyword"/></xsl:attribute>
        <xsl:apply-templates select="titleStmt/author"/> 
        <xsl:apply-templates select="titleStmt/title"/>
      </a>
      <br/>
      <xsl:apply-templates select="hits"/> match<xsl:if test="hits > 1">es</xsl:if>
    </p>
  </xsl:template>

  <xsl:template match="author">
    <xsl:if test=". != ''">
      <xsl:apply-templates/>,      
    </xsl:if>
  </xsl:template>

  <xsl:template match="title">
    <xsl:value-of select="substring-before(., ': electronic edition')"/>.
  </xsl:template>

</xsl:stylesheet>
