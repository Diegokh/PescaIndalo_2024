<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/pescaindalo">
        <html>
            <head>
                <title>Cañas de pescar con precio mayor a 50 euros</title>
            </head>
            <body>
                <h1>Cañas de pescar con precio mayor a 50 euros</h1>
                <table border="1">
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                        <th>Peso</th>
                    </tr>
                    
                    <xsl:for-each select="equipamientos/equipamiento[tipo='Caña de pescar' and number(precio) > 50]">
                        <xsl:sort select="number(precio)" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="@cod_equipamiento"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="descripcion"/></td>
                            <td><xsl:value-of select="tipo"/></td>
                            <td><xsl:value-of select="precio"/></td>
                            <td><xsl:value-of select="peso"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>