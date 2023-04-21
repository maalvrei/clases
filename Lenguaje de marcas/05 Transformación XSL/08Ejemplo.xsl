<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="pais">
  <html>
  <head>
  <style>
  img {
    width:300px;
  }
  </style>
  </head>
  <body>
    <figure>
    <img>
    <xsl:attribute name="src">
      <xsl:value-of select="foto" />
    </xsl:attribute>
    </img>
    <figcaption>
    <a href="https://www.turismoroma.it/">

    <xsl:attribute name="href">
    <xsl:value-of select="https://www.turismoroma.it/es"/>
    </xsl:attribute>
    </a>
  </figcaption>
    </figure>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>