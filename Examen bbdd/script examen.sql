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

-- 3) modifica el campo nombre, apellido1 y apellido2 a 60 caracteres, todo en la misma sentencia
-- comprobamos el tipo de esos campos haciendo describe
describe cliente;
--  comprobamos que los 3 campos son varchar de 100 caracteres. nombre y apellido1 son not null, y apellido2 si acepta valores null
alter table cliente modify nombre varchar(60) not null, modify apellido1 varchar(60) not null, modify apellido2 varchar(60) null;
-- volvemos a comprobar describe cliente y vemos que hemos actualizado los campos a lo que se nos pedia, manteniendo los nulos y los no nulos
describe cliente;


-- 4) crea una copia de la tabla cliente llamada cliente2 solo con los clientes de Sevilla y añade un nuevo sevillano a cliente2
-- comprobamos los sevillanos que hay en la tabla cliente
select * from cliente where ciudad like 'Sevilla';
-- la consulta nos devuelve 3 resultados, por lo que hay 3 sevillanos, nuestra tabla cliente2 debe tener 3 registros
-- vamos a crear la tabla cliente2 vacia
create table cliente2 like cliente;
-- vemos que efectivamente esta vacia
select * from cliente2;
-- vamos a añadir a nuestra tabla cliente2 solo los clientes de sevilla de la siguiente manera
insert into cliente2 select * from cliente where ciudad like 'Sevilla';
-- y comprobamos que cliente2 tenga solo 3 registros
select * from cliente2;
-- ahora añadimos un sevillano
insert into cliente2 (nombre, apellido1, apellido2, ciudad, correo, categoria) values ('Migue', 'Alvarez' , 'Reina', 'Sevilla', '11migu@migue.es','300');
-- no era necesario añadir el id, ya que es un autoincremental. 

-- 5) crea una vista vistaClientes que una las tablas cliente y cliente2, sin repeticion de registros. y otra vista llamada vistaClienteTodos que una ambas tablas con todos los registros. 
-- para crear una vista con dos tablas ignorando los registros repetidos, utilizamos union, que une dos tablas pero sin los registros repetidos. como los sevillanos de cliente2 ya estan en cliente,
-- vistaClientes debe tener los mismos registros que la tabla original cliente, pero contanto uno mas, que es el sevillano que hemos añadido nosotros a la tabla cilente2.
-- vamos a ver cuantos registros tiene la tabla cliente:
select * from cliente;
-- tiene 10 registros, vamos a crear la vista y a ver cuantos registros tiene
create or replace view vistaClientes as select * from cliente union select * from cliente2;
select * from vistaClientes;
-- efectivamente, tiene 11 registros, los 10 originales sin contar los duplicados, mas el sevillano nuevo
-- ahora vamos a crear la vistaClienteTodos, que contiene todos los registros de las dos tablas, contando tambien los repetidos
create or replace view vistaClientesTodos as select * from cliente union all select * from cliente2;
-- vamos a ver cuantos registros tiene
select * from vistaClientesTodos;
-- en este caso, vistaClientesTodos si que ha añadido tambien los registros repetidos y tiene en total 14 registros, los 10 originales mas los 4 de la tabla cliente2

-- 6)















