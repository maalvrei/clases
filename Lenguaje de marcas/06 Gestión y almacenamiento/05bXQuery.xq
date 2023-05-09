<html>
<head>
<link rel="stylesheet" type="text/css" href="05bXQuery.css"/>
<title>XQuery y HTML</title>
</head>
<body>
  <table>
    <tr><th>Modelo</th><th>Marca</th><th>Cliente</th><th>Fecha</th></tr>
    {
       for $com in //compra, $art in //articulo, $cli in //cliente
       where $com/@idcliente = $cli/@idcliente and $com/@codigo = $art/@codigo
      return <tr>
              <td>{$art/modelo/text()}</td>
              <td>{$art/marca/text()}</td>
              <td>{$cli/nombre/text()}</td>
              <td>{$com/fecha/text()}</td>
            </tr>
    }
  </table>
</body>
</html>