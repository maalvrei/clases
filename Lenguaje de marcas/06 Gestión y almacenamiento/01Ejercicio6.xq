"1.- Mostrar cada uno de los nombres de los bailes",
for $baile in /bailes/baile
return $baile/nombre/text(),
"2.- Mostrar los nombres de los bailes seguidos con el número de plazas entre paréntesis",
for $baile in /bailes/baile
return concat($baile/nombre/text(), "(",$baile/plazas/text(),")"),
"3.- Mostrar los nombres de los bailes cuyo precio sea mayor de 30 y la moneda 'euro'",
for $baile in /bailes/baile
where $baile/precio > 30 and $baile/precio/@moneda = "euro"
return $baile/nombre/text(),
"4.- Mostrar los nombres de los
profesores y la sala en la que dan clase, ordenados por sala",
for $baile in /bailes/baile
order by $baile/sala
return
($baile/profesor,
$baile/sala),
"5.- Mostrar la suma de los precios de los bailes de la sala 1",
let $baile := /bailes/baile[sala=1]
return sum($baile/precio),
"6.- Mostrar cuántas plazas en total oferta el profesor 'Jesús Lozano' y en cuantos cursos imparte",
let $baile := //baile[profesor = "Jesús Lozano"]
return concat(sum($baile/plazas)," en ",count($baile/plazas)," cursos")