<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="documento">
  <html>
  <head>
    <link rel="stylesheet" type="text/css" href="Ejercicio05.css"/>
  </head>
  <body>
        <h1><xsl:value-of select="titulo"/></h1>(por <strong><xsl:value-of select="@autor"/></strong>)
      <main>
        <xsl:apply-templates/>
    </main>
  </body>
  </html>
  </xsl:template>
  
  
  <xsl:template match="tituloNivel2">
     <h2><xsl:value-of select="."/></h2>
  </xsl:template>
  <xsl:template match="contenido">
     <article><xsl:value-of select="."/></article>
  </xsl:template>
  
</xsl:stylesheet>
