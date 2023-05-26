"Nombre y país de todos los artistas en este formato de salida: nombre (país)",
for $a in //artista
return concat($a/nombreCompleto/data(), " (" , $a/pais/data(), ")"),
"El número total de artistas que nacieron antes de 1600 con el siguiente formato de salida: Total artistas encontrados: 3",
let $a := //artista[nacimiento<1600]
return concat("Total de artistas encontrados : ",count($a)),
"Nombre de los artistas para los que no hay año de fallecimiento con el siguiente formato de salida: nombre",
for $a in //artista
where empty($a/fallecimiento)
return $a/nombreCompleto/data()