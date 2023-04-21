<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="lenguajes">
 <xsl:apply-templates select="clasificacion"/>
  </template>
  
<xsl:template match="clasificacion"> 
<h2><xsl:value-of select="@criterio"/></h2>
 
</xsl:template>
<xsl:apply-templates select="lenguaje"/>
<xsl:template match="lenguaje">
<p><xsl:value-of select="@tipo"/>: <xsl:value-of select="@ejemplos"/>
</xsl:template>

</xsl:stylesheet>
