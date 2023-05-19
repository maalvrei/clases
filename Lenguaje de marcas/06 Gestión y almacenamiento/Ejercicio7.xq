"Ejercicio 7",

"--------------",

"Mostrar cada título con su autor:",

for $tit in //libro, $aut in //autor
where $tit/autoria/@Cod_Autor=$aut/@IdAutor
return($tit/Titulo/data(), concat($aut/Nombre/data(), " ", $aut/Apellidos/data())),

"------------",

"Ídem anterior pero con el siguiente formato visual y ordenador por nombre de autor",

for $tit in //libro, $aut in //autor
where $tit/autoria/@Cod_Autor=$aut/@IdAutor
order by $aut/Nombre
return concat($tit/Titulo/data(), "------> ", $aut/Nombre/data(), " ", $aut/Apellidos/data()),

"-----------"