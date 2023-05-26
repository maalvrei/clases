(:esta primera linea abre una etiqueta ul de html, que se corresponde con una linea no ordenada de html:)
<ul>
{
(:estas llaves indican que dentro de la etiqueta ul se introducirá codigo xquery, por lo que debe introducirse llaves:)
for $a in //artista
(:con este bucle for se empieza a iterar sobre el documento xml. se posiciona en //artista, es decir, en cada uno de los artistas individualmente. por ello, la variable $a almacenara la informacion de cada artista, uno por uno en cada iteracion:)
where $a/pais = 'España'
(:esta clausula where filtra los artistas sobre los que se aplicará el return. es decir, para aquellos artistas cuyo elemento "pais" no sea "España", el bucle no los tendrá en cuenta y no retornará sus datos. un efecto silimar se consigue si hubiesemos hecho, al declarar la variable $a lo siguiente = for $a in //artista[pais="España"].En definitiva, este where y cualquiera, lo que hace es filtrar aquellos elementos del documento xml que queremos tener en cuenta para trabajar con ellos.:)
return
(:aqui comenzamos a devolver datos. asi, con cada iteracion del bucle for, se devolvera un elemento <li></li>, que recordemos que iran dentro del elemento <ul></ul> inciado al principio del documento. cada elemento <li></li> tendrá dentro el contenido del nodo nombreCompleto, que es un elemento hijo de cada elemento artista. se añaden tambien llaves {} dentro de cada <li></li> para indicar que el contenido será conteniendo de las etiquetas xml. se hace con &a/nombreCompleto/text() ya que recordemos que para cada iteracion, $a es un artista, y para acceder a su elemento hijo nombreCompleto, debemos hacerlo con /nombreCompleto. Ademas, si queremos solo el contenido del elemento, y no su literal dentro de xquery, debemos utilziar text(), que nos devuelve solamente el contenido del nodo.:)
<li>
{$a/nombreCompleto/text()}
</li>
}
</ul>,
(:aqui cerramos la llave del bucle for que comentabamos anteriormente:)
(:y aqui cerramos la etiqueta ul. de modo que la consulta xquery devolvera lo siguiente:
<ul><li>Diego Velázquez</li><li>Francisco de Goya</li></ul>
vemos que tenemos una lista no ordenada de html, nos ha devuelto el bucle for dos elementos <li></li> que contienene el nombre de cada autor español, recordemos where $a/nombre='España'
:)
(:importante recordar que despues de </ul> se ha colocado una coma, para indicar que se empieza una nueva consulta:)
let $subtotal:=count(//artista[pais="España"])
(:en esta consulta utilizamos let en lugar de for. la clausula let lo que hace es amontonar en el interior interior de la variable $subtotal el resultado de contar todos los elementos //artista, cuyo elemento hijo pais cumplen una condicion y tienen como valor "España".la encargada de contar esos elementos es la funcion count, por lo que cada vez que encontremos un artista de españa, la variable $subtotal aumentara su valor en 1 :)
return concat("Total artistas encontrados: ",$subtotal)
(:por ultimo, se utiliza la funcion concat dentro del return, para devolve runa cadena que indica el total de artistas encontrados, concatenada con la variable $subtotal, que recordemos que almacena un numero:)