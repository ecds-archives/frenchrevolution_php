<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:variable name="figure-path">http://chaucer.library.emory.edu/frenchrevo/images/</xsl:variable>
  <xsl:variable name="figure-suffix">.jpg</xsl:variable>
  <xsl:variable name="thumbnail-path">http://chaucer.library.emory.edu/frenchrevo/images/thumbnails/</xsl:variable>
  <xsl:variable name="thumbnail-suffix">.gif</xsl:variable>


  <!-- ignore teiheader for now -->
  <xsl:template match="teiHeader"/>

  <xsl:template match="div">
    <div>
      <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
      <xsl:apply-templates/>
    </div>    
  </xsl:template>

  <xsl:template match="head">
    <p class="head"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="byline">
    <p class="byline"><xsl:apply-templates/></p>   
  </xsl:template>

  <xsl:template match="dateline">
    <p class="dateline"><xsl:apply-templates/></p>   
  </xsl:template>

  <xsl:template match="p|sp">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="lb">
    <br/>
  </xsl:template>

  <xsl:template match="quote">
    <div class="quote"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="lg">
    <p class="lg"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="l">
    <xsl:apply-templates/><br/>
  </xsl:template>
  
  <xsl:template match="title">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="item">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="listBibl">
    <ul class="bibl">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  
  <xsl:template match="listBibl/bibl">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="foreign">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="speaker">
    <b><xsl:apply-templates/></b>
  </xsl:template>

  <xsl:template match="hi">
    <span>
      <xsl:choose>
        <xsl:when test="@rend">
          <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="class">hi</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

<xsl:template match="figure">
  <img>
    <xsl:attribute name="src"><xsl:value-of select="concat($figure-path, @entity, $figure-suffix)"/></xsl:attribute>
    <xsl:attribute name="alt"><xsl:value-of select="normalize-space(figDesc)"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="normalize-space(figDesc)"/></xsl:attribute>
  </img>
</xsl:template>

</xsl:stylesheet>
