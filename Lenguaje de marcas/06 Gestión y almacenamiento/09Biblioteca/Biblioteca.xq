"1.-Mostrar los títulos de los libros dentro de una una etiqueta TÍTULO",
for $t in //titulo/text()
return <TÍTULO>{$t}</TÍTULO>,
"2.- Mostrar los libros cuyo precio sea menor o igual a 30",
for $l in //libro
where $l/precio <= 30
return $l,
"3.- Mostrar el título y el autor de los libros del año 2005 usando la función concat()",
for $l in //libro
where $l/año=2005
return concat($l/titulo/text(),"--",$l/autor/text()),
"4.-Mostrar los años de publicación con su etiqueta dentro de otra llamada <publicación>, primero con for y luego con let",
for $a in //año
return <publicación>{$a}</publicación>,
"****",
let $a := //año
return <publicación>{$a}</publicación>,
"5.- Mostrar los titulos de los libros ordenados primero por categoría y luego por título en una sola consulta",
for $l in //libro
order by $l/@categoria,$l/titulo
return $l/titulo/text(),
"6.- Mostrar cuántos libros hay, y etiquetarlo con TOTAL",
let $num := count(//libro)
return <TOTAL>{$num}</TOTAL>,
"***",
let $num := //libro
return <TOTAL>{count($num)}</TOTAL>,
"7.- Mostrar el precio mínimo y máximo de los libros",
let $max := max(//precio), 
    $min := min(//precio)
return
<resultado>
  <max>{$max}</max>
  <min>{$min}</min>
</resultado>,
"8.- Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA",
for $l in //libro
let $precio_iva := ($l/precio * 1.21)
order by $precio_iva
return 
<libro>
  <titulo>{$l/titulo/text()}</titulo>
  <precio>{$l/precio/text()} €</precio>
  <precio_iva>{$precio_iva} €</precio_iva>
</libro>,
"9.-Mostrar la suma total de los precios de los libros con la etiqueta total",
let $l := //libro
return <total>{sum($l/precio)}</total>,
"10.- Mostrar en una tabla HTML todos los autores eliminando los que se repiten",
<html>
<body>
<table>
<tr><th>Autores en nuestra Biblioteca</th></tr>
{
  for $a in distinct-values(//autor)
return <tr><td>{$a}</td></tr>
}
</table>
</body>
</html>,
"11.- Mostrar en un documento  HTML con etiquetas semánticas que contengan el nombre del libro, su categoría con su correspondiente descripción",
<html>
<body>
<h1>Categorías de la biblioteca</h1>
{
  for $l in doc("Biblioteca.xml")//libro, $c in doc("Categorias.xml")//categoria
  where $l/@categoria = $c/nombre
  return
<section>
  <h2>{$l/titulo/text()}</h2>
  <h3>{$c/nombre/text()}</h3>
  <p>{$c/descripcion/text()}</p>
</section>
}   
</body>
</html>