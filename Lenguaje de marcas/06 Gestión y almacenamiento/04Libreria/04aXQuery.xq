(:comentario que no se ejecuta:)
"1 - Título de los libros",
/bib/libro/titulo,
"2 - Título de los libros >50euros",
/bib/libro[precio>50]/titulo,
"***** Expresiones FLWOR *****",
"3.- Título de los libros ",
for $a in /bib/libro/titulo return $a,
"4.- Título de los libros >50euros ",
for $a in /bib/libro 
where $a/precio > 50
return $a/titulo,
"5.- Título de los libros >50euros y editorial sea Addison-Wesley ",
for $a in /bib/libro 
where $a/precio > 50 and $a/editorial ="Addison-Wesley"
return $a/titulo

