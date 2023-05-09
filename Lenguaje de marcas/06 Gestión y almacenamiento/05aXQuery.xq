 for $com in //compra, $art in //articulo, $cli in //cliente
 where $com/@idcliente = $cli/@idcliente and $com/@codigo = $art/@codigo
 return ($art/modelo/text(),$art/marca/text(),$cli/nombre/text(),$com/fecha/text() ),
 "***************",
 "Nombre de los cliente que no está en la lista de la compra",
let $cli := //cliente/@idcliente
let $com := //compra/@idcliente

return $cli[not(.=$com)]/../nombre/text()