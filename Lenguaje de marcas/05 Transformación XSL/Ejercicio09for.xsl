<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <head>
            <title>Resultado HTML</title>
        </head>
        <body>
            <ul>
                <xsl:for-each select="inventario/producto">
                    <li>
                        Elemento
                        <xsl:value-of select="./@codigo"/>
                        <ul>
                            <li>
                                Nombre:
                                <xsl:value-of select="nombre"/>
                            </li>
                            <li>
                                Peso:
                                <xsl:value-of select="peso"/>
                                <xsl:value-of
                                    select="peso/@unidad"/>
                            </li>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
