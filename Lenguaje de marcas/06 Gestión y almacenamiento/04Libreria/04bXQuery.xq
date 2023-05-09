"1.- Mostrar el atributo año de cada libro",
for $lib in //libro return  $lib/@año,
"2.- idem pero sólo mostrando los valores del atributo año",
for $lib in//libro return  $lib/@año/data(),
"3.- idem anterior pero con función string",
for $lib in //libro return  string($lib/@año),
"4.- idem anterior pero sólo año menor que 2000 y ordenado por año",
for $lib in //libro 
where $lib/@año <2000
order by $lib/@año
return  string($lib/@año)