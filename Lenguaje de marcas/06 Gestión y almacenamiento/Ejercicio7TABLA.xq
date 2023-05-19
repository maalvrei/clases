<html>
<head>
<link rel="stylesheet" type="text/css" href="Ejercicio9TABLA.css" />
</head>
<body>
<table>
<tr><th>Título</th><th>Autor</th></tr>
{
for $a in //libro/autoria/@Cod_Autor, $b in //Autores/autor/@IdAutor
where $a/data() = $b/data()
return <tr><td>{$a/../../Titulo/text()}</td>
<td>{concat($b/../Nombre/text()," ",$b/../Apellidos/text())}</td></tr>
}
</table>
</body>
</html>