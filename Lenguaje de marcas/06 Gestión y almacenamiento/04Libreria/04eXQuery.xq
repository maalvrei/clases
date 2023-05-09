"Combinando for y let",
"1.-Uso de count",
for $a in //libro
let $b :=$a/autor
return 
<LIBRO>{$a/titulo, <NUMAUTORES>{count ($b)}</NUMAUTORES>}</LIBRO>,
"2.-Listar año y título de los libros que tienen más de un autor",
for $a in //libro
where count($a/autor)>1
return <LIBRO>{$a/@año}{$a/titulo/text()}</LIBRO>,
"*************",
"3.- Muestra los comentarios de cada libro. Dos archivos",
for $t in doc("04Libros.xml")//titulo, $e in  doc("04Comentarios.xml")//entrada
where $t = $e/titulo
return <APUNTE>{$t, $e/comentario}</APUNTE>