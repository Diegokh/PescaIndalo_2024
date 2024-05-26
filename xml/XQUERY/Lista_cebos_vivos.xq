let $doc := doc("pescaindalo_xsd.xml")
let $cebos_vivos := $doc//cebo[clase = "Cebo Vivo"]
return
<html>
    <head>
        <title>Cebos Vivos</title>
    </head>
    <body>
        <h1>Lista de Cebos Vivos</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                {
                    for $cebo in $cebos_vivos
                    order by xs:decimal($cebo/precio) ascending
                    return
                        <tr>
                            <td>{$cebo/nombre/text()}</td>
                            <td>{$cebo/descripcion/text()}</td>
                            <td>{$cebo/precio/text()}</td>
                        </tr>
                }
            </tbody>
        </table>
    </body>
</html>
