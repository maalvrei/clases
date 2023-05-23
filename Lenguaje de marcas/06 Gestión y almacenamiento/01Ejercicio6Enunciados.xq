"1.- Mostrar cada uno de los nombres de los bailes",
for $b in //baile
return $b/nombre/data(),
"2.- Mostrar los nombres de los bailes seguidos con el número de plazas entre paréntesis",
for $b in //baile
return concat($b/nombre, " (" , $b/plazas, ") "),
"3.- Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda 'euro'",
for $b in //baile[precio>30 and precio/@moneda="euro"]
return $b/nombre/data(),
"4.- Mostrar los nombres de los
profesores y la sala en la que dan clase, ordenados por sala",
for $b in //baile
order by $b/sala
return ($b/profesor, $b/sala),
"5.- Mostrar la suma de los precios de los bailes de la sala 1",
let $sumada := //baile[sala="1"]/precio
return sum($sumada),
"6.- Mostrar cuántas plazas en total oferta el profesor 'Jesús Lozano' y en cuantos cursos imparte",
let $baile := //baile[profesor="Jesús Lozano"]
return concat(sum($baile/plazas), " en " , count($baile/plazas), " cursos")
