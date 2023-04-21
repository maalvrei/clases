<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="bib">
  <html>
  <head>
  <style>
  table, th, td {border:1px green solid;}
  table {border-collapse:collapse;
  }
  .especial {background-color:red;}
  table tr td:first-child { text-align:right;}
  </style>
  </head>
  <body>
  <h1><a href="{@url}" target="_blank">  Biblioteca de la UCO</a></h1>
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
<xsl:if test="precio&gt;100">
 <td class="especial"><xsl:value-of select="titulo"/></td>
</xsl:if>  
  <xsl:if test="precio&lt;=100">
 <td><xsl:value-of select="titulo"/></td>
</xsl:if>  

  <td><xsl:value-of select="@año  "/></td>
  </tr>
  </xsl:template>
  
  
</xsl:stylesheet>
