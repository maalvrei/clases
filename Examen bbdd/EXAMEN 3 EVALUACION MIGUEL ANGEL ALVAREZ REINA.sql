-- EJERCICIO 1
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

-- EJERCICIO 2
-- 1) crea una vista v_pedidos con la siguiente consulta: ¿cuanto se ha ingresado de los pedidos del cliente aaron rivero? muestra todos los datos necesarios
-- vamos a ver primero cuantos pedidos ha hecho el cliente aaron rivero
select count(pedido.id) from pedido join cliente on id_cliente = cliente.id where nombre like 'Aarón' and apellido1 like 'Rivero';
-- esa consulta devuelve 3, es decir, aaron rivero a hecho 3 pedidos. ahora debemos ver cuanto ha gastado aaron en todos sus pedidos
select sum(total) from pedido join cliente on id_cliente = cliente.id where nombre like 'Aarón' and apellido1 like 'Rivero';
-- nos devuelve 3030.73, es lo que ha gastado aaron
-- creamos la vista con los pedidos
create or replace view v_pedidos as select * from pedido;
-- comprobamos que tiene los datos correctamente
select * from v_pedidos;
-- vamos a ver cuanto ha gastado aaron y si coincide con lo que hemos comprobado anteriormente
select sum(total) from v_pedidos join cliente on id_cliente = cliente.id where nombre like 'Aarón' and apellido1 like 'Rivero';
-- efectivamente, coincide

-- 2) crea una vista v_cuentaAnio, en la misma consulta cuenta el numero de pedidos por año, media de pedidos por año y el total de ingresos por año
create or replace view v_cuentaAnio as select * from pedido;
select count(id) as numPedidos, sum(total) as totalVentas,avg(total) as mediaDinero, year(fecha) as año from v_cuentaAnio group by año;

-- 3) crea una vista v_totalAnio utilizando la vista anterior, muestra el numero total de pedidos, el dinero total ingresado por pedidos, y la media total de ingresos.
create or replace view v_totalAnio as select * from v_cuentaAnio;
select count(id) as numPedidosTodosAños, round(sum(total),2) as totalIngresosTodosAños, round(avg(total),2) as mediaIngresosTodosAños from v_totalAnio;

-- EJERCICIO 3. SUBCONSULTAS
-- 1) devuelve los datos del cliente y del pedido del cliente que realizó el pedido mas caro en 2019
select
cliente.id as id_cliente, nombre, apellido1, apellido2, ciudad, correo, pedido.id as id_pedido, total, fecha as fecha_pedido
from cliente join pedido on cliente.id = pedido.id_cliente
where pedido.total = (select max(total) from pedido where year(fecha) = '2019');

-- 2) devuelve un listado de los datos de los comerciales que no han realizado ningun pedido

select nombre from comercial where id not in ( select id_comercial from pedido);

-- 3) devuelve un listado con los datos de los clientes y los pedidos de todos los los clientes que han realizado un pedido en el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados
-- ese año

select * from cliente join pedido on cliente.id = pedido.id_cliente where year(pedido.fecha) = 2017 and pedido.total >= (select avg(total) from pedido where year(fecha) = 2017);


-- EJERCICIO 4
-- 1) crea un procedimiento pedidosPorFechas que reciba una fecha y muestre por pantalla los pedidos realizados en esa fecha, si no hay ningun pedido, mostrara 'no se han registrado pedidos en esa fecha'

drop procedure if exists pedidosPorFechas;

DELIMITER //

create procedure pedidosPorFechas(in fecha_pedido date)
begin
    if fecha_pedido = any(select fecha from pedido) then
		select * from pedido where fecha = fecha_pedido;
    else
        select 'No se han registrado pedidos en esa fecha';
    end if;
    
end //

DELIMITER ;

call pedidosPorFechas('2017-10-04');

-- 2) crea un procedimiento llamado cobroComerciales que reciba el nombre y apellido1 de un comercial y devuelva el valor total de las comisiones recibidas de todos sus pedidos.
-- si el comercial no ha realizado pedidos, el procedimiento devolverá 0
drop procedure if exists cobrocomerciales;
delimiter //

create procedure cobrocomerciales(in nombre_comercial varchar(100), in apellido1_comercial varchar(100), out total_comisiones float)
begin
	declare idComercial int;
    select id from comercial where nombre like nombre_comercial and apellido1 like apellido1_comercial into idComercial;
	if idComercial = any(select pedido.id_comercial from pedido) then
		select sum(comision*total) from comercial join pedido on comercial.id = pedido.id_comercial where comercial.id = idComercial into total_comisiones;
	else
		select 0 into total_comisiones;
	end if;
end //

delimiter ;

call cobrocomerciales('Marta', 'Herrera', @total_comisiones);
select @total_comisiones;