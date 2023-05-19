"1.-Mostrar los títulos de los libros dentro de una una etiqueta TÍTULO",
for $libro in //libro
return <titulo>{$libro/titulo/data()}</titulo>,
"2.- Mostrar los libros cuyo precio sea menor o igual a 30",
for $libro in //libro
where $libro/precio>30
return $libro/titulo,
"3.- Mostrar el título y el autor de los libros del año 2005 usando la función concat()",
for $libro in //libro
let $autor := $libro/autor
where $libro/año="2005"
return concat($libro/titulo/data() , ", ", $autor),
"4.-Mostrar los años de publicación con su etiqueta dentro de otra llamada <publicación>, primero con for y luego con let (sin for)",
for $año in //año
return <publicacion>{$año}</publicacion>,
for $libro in //libro
let $año := $libro/año
return <publicacion>{$año}</publicacion>,
"5.- Mostrar los titulos de los libros ordenados primero por categoría y luego por título en una sola consulta. Pista: order by criterio1, criterio2 ",
for $l in //libro
order by $l/@categoria, $l/titulo
return $l/titulo/data(),
" ",
"6.- Mostrar cuántos libros hay, y etiquetarlo con TOTAL",
let $tot := count(//libro)
return <total>{$tot}</total>,
" ",
"7.- Mostrar el precio mínimo y máximo de los libros",
let $min:= min(//precio)
let $max:= max(//precio)
return ($min,$max),
" ",
"8.- Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA",

"9.-Mostrar la suma total de los precios de los libros con la etiqueta total",

"10.- Mostrar en una tabla HTML todos los autores eliminando los que se repiten. Pista: for $a in distinct-values(//autor)",

"11.- Mostrar en un docuemnto  HTML con etiquetas semánticas que contengan el nombre del libro y su categoría con su correspondiente descripción"