"Mostrar cada título con su autor: ",
" ",
for $libro in //libro
let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
return concat("Libro: ", $libro/Titulo, ", Autor: ", $autor/Nombre),
" ",
"Mostrar cada título con su autor de otra forma:",
" ",
for $tit in //libro, $aut in //autor
where $tit/autoria/@Cod_Autor = $aut/@IdAutor
return($tit/Titulo/data(),concat($aut/Nombre/data() , " " , $aut/Apellidos/data())),
"Ídem anterior pero con el siguiente formato visual y ordenador por nombre de autor: ",
" ",
for $libro in //libro
let $autor := //autor[@IdAutor = $libro/autoria/@Cod_Autor]
return concat( $libro/Titulo," ---------> ", $autor/Nombre),
" ",
"Lo mismo de otra forma: ",
" ",
for $tit in //libro, $aut in //autor
where $tit/autoria/@Cod_Autor = $aut/@IdAutor
order by $aut/Nombre
return concat($tit/Titulo/data(), "-----> " , $aut/Nombre/data()),
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
" ",
"Generar las listas bien: ",
" ",
<html>
<head>
<body>
<ol>
{
  for $l in //libro, $a in //autor
  where $l/autoria/@Cod_Autor = $a/@IdAutor
  return 
  <li>
  Código libro: {$l/@Cod_Libro/data()}
  <ul>
  <li>{$l/Titulo/data()}</li>
  <li>{concat($a/Nombre/data() , " " , $a/Apellidos/data())}</li>
  </ul>
  </li>
}
</ol>
</body>
</head>
</html>