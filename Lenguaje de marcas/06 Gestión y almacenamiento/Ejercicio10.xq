"1.- Nombre de los profesores",
for $a in //profesor/nombre
return $a/text(),
"2.- Profesor cuyo código es P02",
for $a in //profesor
where $a/@CodP = "P02"
return $a,
"3.- Asignaturas que son de primer o segundo curso",
for $a in //asignatura
where $a/curso <=2
return string($a/nombre),
"4.- Asignaturas con más de una práctica",
for $a in //asignatura
where count($a/practica)>1
return $a/nombre/text(),
"5.- las prácticas que tiene la asignatura de nombre AGI ",
for $a in //asignatura
where $a/nombre ="AGI"
return (concat("Número de prácticas:",count($a/practica)),$a/practica/text()),
"6.- el nombre de los profesores que imparten la asignatura de nombre AGI",
for $a in //asignatura, $p in //profesor, $i in //imparte
where $a/nombre="AGI" and $a/@CodA=$i/@CodA and $p/@CodP=$i/@CodP
return <prof>{$p/nombre/text()}</prof>,
"7.- el código y el nombre de las asignaturas que tienen más de una práctica ",
for $a in //asignatura
where count($a/practica)>1
return concat($a/nombre/text(),": código ",$a/@CodA/data())