"1.-Usando XQuery, mostrar dentro de una etiqueta <suministrosGrandes> aquellos que superen la cantidad de 450. Ordenados por la cantidad de mayor a menor",
<suministrosGrandes>
{for $s in //suministra[cantidad>450]
order by $s/cantidad
return $s}
</suministrosGrandes>,
"2.- Ídem anterior pero en lugar de los números de proveedor, parte y cantidad, mostrar sus nombres. Emplear listas ordenadas",
<ol>
{
for $s in //suministra[cantidad>450], $p in //parte, $pr in //proveedor
where $s/numparte = $p/@numparte and $s/numprov = $pr/@numprov
return <li><ul><li>{$p/nombreparte}</li><li>{$pr/nombreprov}</li><li>{$s/cantidad}</li></ul></li>
}
</ol>,
"3.- Ídem empleando una tabla en un documento HTML con CSS asociado",
<html>
<head>
<body>
<table>
<tr>
<th>Nombre</th>
<th>Cantidad</th>
<th>Proovedor</th>
</tr>
{
  for $s in //suministra[cantidad>450], $p in //parte, $pr in //proveedor
  where $s/numparte = $p/@numparte and $s/numprov = $pr/@numprov
  return <tr><td>{$p/nombreparte}</td><td>{$s/cantidad}</td><td>{$pr/nombreprov}</td></tr>
}
</table>
</body>
</head>
</html>