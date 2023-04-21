<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  
   <!-- Plantilla raíz -->
  <xsl:template match="/">
    <html>
    <head>
    <style>
    table, tr , td, th{
      border:2px black solid;
      
}
      tr td:first-child {text-align:right;}
    .alto { background-color:red;}    
    </style>
      
    </head>
      <body>
          <table>
      <tr><th>Precio</th><th>Nombre</th><th>Año</th></tr>
      <xsl:for-each select="bib/libro">
        <xsl:sort select="precio" order="ascending" data-type="number" />
        <tr>
      <td> <xsl:value-of select="precio" /></td>
      <xsl:choose>
        <xsl:when test="precio &gt; 100">
          <td class="alto"><xsl:value-of select="titulo" /></td>
        </xsl:when>
        <xsl:otherwise>
          <td><xsl:value-of select="titulo" /></td>
        </xsl:otherwise>
      </xsl:choose>
      <td><em><xsl:value-of select="@año" /></em></td>
    </tr>
       </xsl:for-each>
    </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>