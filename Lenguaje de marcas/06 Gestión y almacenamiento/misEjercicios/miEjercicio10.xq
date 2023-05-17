"Obtener el nombre de los profesores: ",
for $prof in //profesor
return $prof/nombre/data(),
"Obtener el profesor cuyo código sea P02: ",
for $prof in //profesor
where $prof/@CodP="P02"
return $prof/nombre/data(),
"Obtener las asignaturas que son de primer o segundo curso",
for $asig in //asignatura
where $asig/curso="1" or $asig/curso="2"
return $asig/nombre/data(),
"Obtener las asignaturas con más de una práctica ",
for $asig in //asignatura
let $numAsig := count($asig/practica)
where $numAsig >1 
return $asig/nombre/data(),
"Obtener las prácticas que tiene la asignatura de nombre AGI ",
for $asig in //asignatura
let $numAsig := count($asig/practica)
where $asig/nombre="AGI" 
return $numAsig,
"Obtener el nombre de los profesores que imparten la asignatura de nombre AGI, de manera que la salida obtenida sea de la forma: <prof>Pepe</prof> ",

"Obtener el código y el nombre de las asignaturas que tienen más de una práctica."
