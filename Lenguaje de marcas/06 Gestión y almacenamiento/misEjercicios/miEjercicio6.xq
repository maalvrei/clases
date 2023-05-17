"Muestra el nombre de todos los bailes: ",
for $baile in //baile
return $baile/nombre/data(),
"Muestra el nombre y precio de todos los bailes (elementos completos): ",
for $baile in //baile
return ($baile/nombre,$baile/precio),
"Muestra el nombre y precio de todos los bailes donde su precio es mayor que 40: ",
for $baile in //baile
where $baile/precio>40
return ($baile/nombre,$baile/precio),
"Mostrar los bailes ordenados por nombre: ",
for $baile in //baile
order by $baile/nombre ascending
return $baile/nombre,
"Mostrar los nombres de los bailes que contienen una a: ",
for $baile in //baile
where contains($baile/nombre,"a")
return $baile/nombre,
"Mostrar el nombre de los bailes donde el apellido del profesor sea Lozano: ",
for $baile in //baile
where contains($baile/profesor,"Lozano")
return $baile/nombre