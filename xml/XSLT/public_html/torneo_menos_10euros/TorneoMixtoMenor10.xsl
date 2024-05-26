<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/pescaindalo">
        <html>
            <head>
                <title>Torneos Mixtos con precio menor a 10 euros</title>
            </head>
            <body>
                <h1>Torneos Mixtos con precio menor a 10 euros</h1>
                <table border="1">
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Zona</th>
                        <th>Mixto</th>
                        <th>Recomendaciones</th>
                        <th>Precio</th>
                    </tr>
                    
                    <xsl:for-each select="torneos/torneo[number(precio) &lt; 10 and mixto = 'SI']">
                        <xsl:sort select="number(precio)" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="@cod_zona"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="fecha"/></td>
                            <td><xsl:value-of select="zona_torneo/@cod_zona"/></td>
                            <td><xsl:value-of select="mixto"/></td>
                            <td><xsl:value-of select="recomendaciones"/></td>
                            <td><xsl:value-of select="precio"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
