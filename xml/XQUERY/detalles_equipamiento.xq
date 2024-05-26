let $doc := doc("pescaindalo_xsd.xml")
let $equipamiento_cod := "cp_42H"

return
<html>
<head>
    <title>Detalles de Equipamiento {$equipamiento_cod}</title>
</head>
<body>
    <h1>Detalles de Equipamiento {$equipamiento_cod}</h1>
    
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th>Tipo</th>
            <th>Precio</th>
            <th>Peso</th>
        </tr>
        {
            for $equipamiento in $doc//equipamiento[@cod_equipamiento = $equipamiento_cod]
            return 
                <tr>
                    <td>{$equipamiento/nombre/string()}</td>
                    <td>{$equipamiento/descripcion/string()}</td>
                    <td>{$equipamiento/tipo/string()}</td>
                    <td>
                        {
                            let $precio := xs:integer($equipamiento/precio/string())
                            return 
                                if ($precio > 50) then
                                    <span style="color:green">{$precio}</span>
                                else
                                    <span style="color:red">{$precio}</span>
                        }
                    </td>
                    <td>{$equipamiento/peso/string()}</td>
                </tr>
        }
    </table>
</body>
</html>
