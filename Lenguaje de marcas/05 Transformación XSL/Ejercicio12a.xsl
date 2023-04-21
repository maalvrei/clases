<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="ies">
  <head>
  <style>
    body {
    width:40%;
  }
    div {
      border: 1px grey solid;
      padding-left: 5%;
      border-radius:0 0  25% 0;
      margin-bottom: 5%;
   }
  </style>
  </head>
  <body>
    <h1>CICLOS FORMATIVOS</h1>
    <xsl:for-each select="ciclos/ciclo">
      <xsl:if test="decretotitulo/@año='2010' or decretotitulo/@año='2008'">
      <div>
        <p><xsl:value-of select="@id"/> <em> (<xsl:value-of select="grado"/>)</em></p>
        <p>Nombre: <xsl:value-of select="nombre"/></p>
        <p>Año del decreto: <xsl:value-of select="decretotitulo/@año"/></p>
        </div>
      </xsl:if>
    </xsl:for-each>
    </body>
  </xsl:template>
</xsl:stylesheet>