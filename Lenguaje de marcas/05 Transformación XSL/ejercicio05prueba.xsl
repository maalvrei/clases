<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="bib">
  <html>
<head>
<style>
body { 
background:url("{bib/@logo}") no-repeat;
background-position: 20% top;

}
.especial {background-color:red;}
</style>
</head> 
<body>
  <nav><a href="{@url}" target="_blank">Web UCO </a></nav>
<table>
<tr><th>Precio</th><th>Nombre</th><th>Año</th></tr>

<xsl:apply-templates select="libro">
<xsl:sort select="precio" order="ascending" data-type="number" />

</xsl:apply-templates>

</table>
</body>
  </html>

  </xsl:template>
  
<xsl:template match="libro">
<tr>
<td><xsl:value-of select="precio"/></td>
<xsl:if test="precio &gt; 100">
<td class="especial"><xsl:value-of select="titulo"/></td>
</xsl:if>
<xsl:if test="precio &lt; 100">
<td><xsl:value-of select="titulo"/></td>
</xsl:if>
<td><xsl:value-of select="@año"/></td>
</tr>
</xsl:template>  
  
</xsl:stylesheet>
