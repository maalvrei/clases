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
      <xsl:for-each select="subdivision">
      <h2><xsl:value-of select="tituloNivel2"/></h2>
      <article><xsl:value-of select="contenido"/></article>
      </xsl:for-each>
    </main>
  </body>
  </html>
  </xsl:template>  
  
</xsl:stylesheet>
