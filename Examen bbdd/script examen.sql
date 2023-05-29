-- 1) añadir el campo correo entre ciudad y categoria a la tabla cliente, con 100 caracteres
-- haciendo describe vemos que despues de ciudad va categoria
describe cliente;
-- con el siguiente comando añadimos el campo correo despues de ciudad y antes de categoria
alter table cliente add correo varchar(100) after ciudad;
-- volvemos a ejecutar describe para ver que se ha hecho como queriamos y ya vemos que correo va despues de ciudad y antes de categoria
describe cliente;

-- 2) rellena los correos concatenando el id y las 4 primeras letras del nombre del cliente y como dominio tunombre.es, debe ir en minusculas
-- comprobamos que los correos están vacios
select correo, nombre, id from cliente;
-- añadimos los datos requeridos a la tabla cliente
set sql_safe_updates = 0;
update cliente set correo = CONCAT(id,lower(substring(nombre,1, 4)), '@migue.es');
set sql_safe_updates = 1;
-- vemos que los datos se han añadido correctamente
select correo, nombre, id from cliente;