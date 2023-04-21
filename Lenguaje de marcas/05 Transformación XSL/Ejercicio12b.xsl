<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="ies">
  <head>
  <style>
    body {
    width:50%;
  }
  table, tr, th, td{ 
    border:3px solid purple; 
    border-collapse:collapse;
  }
  td, th {
    width: 50%;
  }
  td:nth-child(2), td:nth-child(3) {
    text-align:center;
  }
  </style>
  </head>
  <body>
    <h1>CICLOS FORMATIVOS</h1>
    <table>
    <tr><th>Nombre</th><th>Siglas</th><th>Año Decreto</th></tr>
          <xsl:apply-templates/>
    </table>
    </body>
  </xsl:template>
  
  <xsl:template match="ciclos/ciclo">
        <tr>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="@id"/></td> 
        <td><xsl:value-of select="decretotitulo/@año"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>