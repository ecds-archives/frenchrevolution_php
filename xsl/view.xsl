<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exist="http://exist.sourceforge.net/NS/exist"
  exclude-result-prefixes="exist" version="1.0">

  <xsl:import href="tei.xsl"/>

  <xsl:output method="xml" omit-xml-declaration="yes"/>


  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- from Michael Kazanjian's styling for pat -->

  <xsl:template match="div1|div2|div3">
    <div>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="head|title|titlePart|author|byline|docAuthor|figure|stanza|epigraph|prologue|epilogue">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="date|pubPlace|publisher|docImprint|docTitle">
    <br/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="bibl">
    <p>
      <xsl:apply-templates/>
    </p>
    <hr/>
  </xsl:template>

  <xsl:template match="figDesc|argument|hi">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="pb">
    <div class="pagebreak">
      <span class="page">Page <xsl:value-of select="@n"/></span>
      <hr/>
    </div>
  </xsl:template>

  <xsl:template match="note">
    <hr/>
    <p>Note: <xsl:apply-templates/></p>
    <hr/>
  </xsl:template>

  <xsl:template match="exist:match">
    <span class="match"><xsl:apply-templates/></span>
  </xsl:template>

</xsl:stylesheet>
