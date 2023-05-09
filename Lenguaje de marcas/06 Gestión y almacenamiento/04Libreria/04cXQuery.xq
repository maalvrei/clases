"1.- Mostrar el título y precio de cada libro",
for $lib in //libro/titulo/text()|//libro/precio/text()
return $lib,
"2.- Mostrar autores con un título que incluya la palabra Web",
for $lib in //libro
where contains($lib/titulo, "Web")
return $lib/autor,
"3.- Mostrar todos los títulos de libros menos los del año 2000 y 1992",
for $lib in //libro
where $lib/@año != 2000 and $lib/@año != 1992
return $lib/titulo/text(),
"4.- Muestra los títulos de los libros anteriores al 2000 ordenados por años incluyendo etiquetas HTML",
for $lib in //libro
where $lib/@año <2000
order by $lib/@año
return <LIBRO>{$lib/@año}{$lib/titulo/data()} </LIBRO>,
"5.- Mostrar apellido, nombre dentro de una etiqueta PERSONA ordenado  descendentemente por apellido ",
for $lib in doc("04Libros.xml")//autor
order by $lib/apellido descending
return <PERSONA>{$lib/apellido/data()}, {$lib/nombre/data()}</PERSONA>