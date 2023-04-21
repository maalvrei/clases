<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="galeria">
  <html>
<head>
<link rel="stylesheet" type="text/css" href="10galeria.css"/>
</head> 
<body>
<h1>GALERÍA de <xsl:value-of select="@nombre"/></h1>
<main>
<xsl:apply-templates/>
</main>
</body>
  </html>
  </xsl:template>
<xsl:template match="imagen">
<figure>
<img src="{.}" alt=""/>
<figcaption><xsl:value-of  select="@titulo"/></figcaption>
</figure>
</xsl:template>  
  
</xsl:stylesheet>
