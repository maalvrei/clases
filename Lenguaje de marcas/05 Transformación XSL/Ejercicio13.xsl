<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:variable name="IVA" select="16"/>
  <xsl:template match="/">
  <html>
  <head>
  <style>
    div p {
    text-indent:1%;  
  }
  </style>
  </head>
  <body>
    <h1>Empleados </h1>
    <xsl:apply-templates/>
  </body>
  </html>
  </xsl:template>
  
  <xsl:template match="empleado">
    <p><strong>Nombre: </strong><xsl:value-of select="apellidos"/>, <xsl:value-of select="nombre"/></p>
    <div>
      <p>Sueldo base: <xsl:value-of select="base"/></p>
      <xsl:variable name="apliCoef1" select="base+coef1*10"/>
      <p>Aplicación Coeficiente1: <xsl:value-of select="$apliCoef1"/></p>
      <xsl:variable name="apliCoef2" select="base+coef2*numHijos"/>
      <p>Aplicación Coeficiente1: <xsl:value-of select="$apliCoef2"/></p>
      <xsl:variable name="siglas" select="concat(substring(nombre,1,1),substring(apellidos,1,1),@idEmpl)"/>
      <p>Siglas: <xsl:value-of select="$siglas"/></p>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
