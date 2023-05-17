"Mostrar cada título con su autor: ",
" ",
for $libro in //libro
let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
return concat("Libro: ", $libro/Titulo, ", Autor: ", $autor/Nombre),
" ",
"Ídem anterior pero con el siguiente formato visual y ordenador por nombre de autor: ",
" ",
for $libro in //libro
let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
return concat( $libro/Titulo," ---------> ", $autor/Nombre),
" ",
"Generar la tabla: ",
" ",
<html>
<head>
<link rel="stylesheet" type="text/css" href="miEjercicio6.css"/>
<title>XQuery y HTML</title>
</head>
<body>
<table>
<tr>
<th>Titulo</th>
<th>Autor</th>
</tr>
{for $libro in //libro
let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
return 
  <tr>
  <td>{$libro/Titulo/text()}</td>
  <td>{concat($autor/Nombre/text()," ",$autor/Apellidos/text())}</td>
  </tr>
}
</table>
</body>
</html>,
" ",
"=============================================",

"Generar las listas: ",
" ",
<html>
<head>
<link rel="stylesheet" type="text/css" href="miEjercicio6.css"/>
<title>XQuery y HTML</title>
</head>
<body>
{
  for $libro in //libro
  let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
  return
  <ol>
  <li>{$libro/@Cod_Libro/data()}
  <ul>
  <li>
  {$libro/Titulo/text()}
  </li>
  <li>{concat($autor/Nombre/text()," ",$autor/Apellidos/text())}</li>
  </ul>
  </li>
  </ol>
}
</body>
</html>,
" "