<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="costes">
  <html>
  <head>
    <title>Costes estipulados</title>
    <link href="Ejercicio07.css" rel="stylesheet" type="text/css"/> <!-- a diferencia de cuando está en documento HTML. en XML indicamos que es etiqueta única -->
  </head>
  <body>
    <h1>Costes totales</h1>
      <table>
        <caption>Período <xsl:value-of select="@periodo"/></caption>
        <thead>
          <tr>
            <th>Denominación</th>
            <th>Ciudad</th>
            <th>Fecha</th>
            <th>Evaluación</th>
            <th>Coste (€)</th>
          </tr>
        </thead>
        <tbody>
            <xsl:apply-templates select="detalle"/>
        </tbody>
        <tfoot>
          <tr>

            <td colspan="4">TOTAL</td>
            <td>163</td>
          </tr>
        </tfoot>
    </table>
    </body>
    </html>
  </xsl:template>
  
  <xsl:template match="detalle">
         <tr>
            <td><xsl:value-of select="denominacion"/></td>
            <td><xsl:value-of select="ciudad"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <td><xsl:value-of select="evaluacion"/></td>
            <td><xsl:value-of select="coste"/></td>
          </tr>  
  </xsl:template>
  
</xsl:stylesheet>
