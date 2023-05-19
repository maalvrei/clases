<html>
<head>
<link rel="stylesheet" type="text/css" href="Ejercicio7Listas.css"/>
<title>HTML y LISTAS</title>
</head>
<body>

<ol>
{
  for $tit in //libro, $aut in //autor
      where $tit/autoria/@Cod_Autor=$aut/@IdAutor
      
   return 
   
    <li><strong>Cod_Libro: {$tit/@Cod_Libro/data()</strong>}
      <ul>
        <li>{$tit/Titulo/data()}</li>
        <li>{$aut/Nombre/data(), $aut/Apellidos/data()}</li>
      </ul>
    </li>
  

}
</ol>
     
</body>
</html>