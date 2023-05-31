drop database if exists automoviles;
create database if not exists automoviles default character set latin1 collate latin1_spanish_ci;
use automoviles;

create table clientes (
nif CHAR (9) not null,
nombre varchar (20) not null,
direccion varchar (50),
telefono varchar (20),
primary key (nif)
);

create table coches (
matricula char (8) not null,
marca varchar (20),
modelo varchar (20),
color varchar (20),
precio decimal (10 , 2) check (precio > 0),
nif_cliente char (9) not null,
primary key (matricula),
constraint fk_coche_cliente foreign key (nif_cliente) references clientes (nif) on delete cascade on update cascade
);

create table revisiones (
codigo int not null,
matricula_coche char (8) not null,
fecha date, 
filtro tinyint(1) default 0,
aceite tinyint(1) default 0,
frenos tinyint(1) default 0,
primary key (codigo),
constraint fk_revisiones_coches foreign key (matricula_coche) references coches (matricula) on delete cascade on update cascade
);

drop table revisiones;

INSERT INTO clientes VALUES
  ('111A', 'Ignacio Munda', 'Murcia', '555-11-22-33'),
  ('222B', 'Julia Otero', 'Burgos', '555-00-33-44'),
  ('333C', 'Pedro Almodóvar', 'Cádiz', '555-99-88-00'),
  ('444D', 'David Egea', 'Vizcaya', '555-00-88-77');

INSERT INTO clientes VALUES
  ('555E', 'Pepe Ruiz', 'Córdoba', '957-11-22-33'),
  ('666F', 'Carmen Romero', 'Córdoba', '957-00-33-44'),
  ('777G', 'Julio Romero', 'Sevilla', '955-00-33-44');

INSERT INTO coches VALUES
  ('2222-BBB', 'seat', 'ibiza', 'blanco', 12000, '111A'),
  ('3333-CCC', 'seat', 'toledo', 'gris', 18000, '222B'),
  ('4444-DDD', 'renault', 'clio', 'rojo', 15000, '222B'),
  ('6666-FFF', 'renault', 'megane', 'blanco', 19000, '444D');

INSERT INTO revisiones VALUES
  (1, '2222-BBB', '2022-01-01', 1, 0, 1),
  (2, '3333-CCC', '2022-02-15', 1, 1, 1),
  (3, '4444-DDD', '2021-12-15', 0, 0, 1),
  (4, '2222-BBB', '2021-11-05',1, 0, 1),
  (5, '3333-CCC', '2021-10-25', 1, 1, 0);
  
-- EJERCICIOS DE INSERCION, ACTUALIZACION Y ELIMINACION

-- 1 se nos pide cambiar el coche de matricula 2222-BBB a otra matricula diferente, q es 2000-BBB

update coches set matricula = '2000-BBB' where matricula like '2222-BBB';
select * from revisiones;

-- como las actualizaciones son en cascada, al cambiar la matricula en la tabla coches, tambien se cambia la matricula en la clave foranea matricula_coche de la tabla revisiones, donde antes ponia 2222-BBB ahora aparece 2000-BB
-- no hay modificaciones en la tabla cliente, este update afecta a coches y a revisiones

-- 2 

-- el enunciado dice que julio romero compra un seat malaga de color rojo por 10000 euros con matricula 1212-ABC. Esto requiere un insert en la tabla coches, donde el valor del campo para la clave 
-- foranea nif_cliente sea el nif de julio romero.
-- Podemos ver manualmente con un select en la tabla clientes cual es el valor del nif de julio romero y apuntarlo para añadirlo manualmente en el insert
-- yo he decidido crear una variable que almacene el dni de julio romero para pasarsela al insert y asi no tener margen de error.

set @nifJulioRomero = (select nif from clientes where nombre like 'Julio Romero');

-- aqui compruebo que exactamente el valor de la variable se corresponde con el nif de julio romero en la tabla clientes

select @nifJulioRomero, nif from clientes where nombre like 'Julio Romero';

-- y ya aqui hago el insert y compruebo que se ha añadido correctamente a la tabla coches

insert into coches (matricula, marca, modelo, color, precio, nif_cliente) values ('1212-ABC' , 'seat' , 'malaga' , 'rojo' , '10000' , @nifJulioRomero);
select * from coches;

-- 3 se nos pide eliminar a julio romero de la tabla clientes

SET sql_safe_updates=0;
delete from clientes where nif like @nifJulioRomero;
SET sql_safe_updates=1;

-- comprobamos que julio romero ya no esta en la tabla clientes

select * from clientes;

-- y como consecuencia, tambien ha desaparecido sus coches de la tabla coches

select * from coches;

-- vemos que en la tabla coches ya no aparece ningun coche con su nif, pero para asegurarnos, hacemos la siguiente consulta, que nos devuelve null ya que julio romero y su nif ya no existen en esta tabla coches;

select * from coches where nif_cliente like @nifJulioRomero;

-- 4 se nos piden dos indices, uno en la tabla coches compuesto por marca y modelo y mostrarlo;

create index index_marca_modelo on coches (marca, modelo);
show index from coches;

-- y otro en la tabla clientes, de doce caracteres para el campo nombre

create index index_nombre_cliente on clientes (nombre(12));
show index from clientes;

-- EJERCICIO 3 CONSULTAS

-- 1 

select clientes.nombre as 'Nombre del cliente', coches.matricula as 'Matrícula del vehículo', revisiones.codigo as 'Código de la revisión', revisiones.fecha as 'Fecha de la revisión' from clientes
join coches on clientes.nif = coches.nif_cliente
join revisiones on revisiones.matricula_coche = coches.matricula;

-- 2 

select clientes.nombre as 'Nombre del cliente', coches.matricula as 'Matrícula del vehículo', concat(coches.marca, ' ', coches.modelo) as 'Marca y modelo' from clientes
left join coches on clientes.nif = coches.nif_cliente
left join revisiones on coches.matricula = revisiones.matricula_coche;

-- 3

select revisiones.codigo, revisiones.matricula_coche, coches.marca, coches.modelo,if(filtro=1, 'PASADO', 'NO PASADO') as FILTRO, if(aceite=1, 'PASADO', 'NO PASADO') as ACEITE, if(frenos=1, 'PASADO', 'NO PASADO') as FRENOS
from revisiones
join coches on revisiones.matricula_coche = coches.matricula
group by revisiones.codigo;

-- 4 

select count(revisiones.matricula_coche) as 'Número de revisiones pasadas por el vehículo', revisiones.matricula_coche as 'Matrícula' from revisiones group by revisiones.matricula_coche;

-- 5 y 6

create table revisiones_2021 select revisiones.codigo as 'NumRevision', fecha, coches.matricula, coches.marca, coches.modelo, clientes.nif, clientes.nombre
from revisiones
join coches
on revisiones.matricula_coche = coches.matricula
join clientes 
on clientes.nif = coches.nif_cliente
where fecha >= '2021-01-01' and fecha <= '2021-12-31';

create table revisiones_2022 like revisiones;

insert into revisiones_2022 select * from revisiones where fecha >= '2022-01-01' and fecha <= '2022-12-31';

select revisiones_2022.codigo as 'NumRevision', revisiones_2022.fecha, coches.matricula, coches.marca, coches.modelo, clientes.nif, clientes.nombre
from revisiones_2022 join coches
on revisiones_2022.matricula_coche = coches.matricula
join clientes on clientes.nif = coches.nif_cliente;



-- 7

-- para ocultar la tabla original, debemos crear la tabla temporal con el mismo nombre

create temporary table clientes select * from clientes;

-- ponemos todas las direcciones a null. hay que tener en cuenta que lo que hagamos con las direcciones o con cualquier valor solo afectara a la tabla temporal, ya que al llamarse igual y estar en activo, la tabla original que se 
-- llamaba clientes está oculta.

SET sql_safe_updates=0;
update clientes set clientes.direccion = null;
SET sql_safe_updates=1;

-- lo comprobamos con el siguiente comando

select * from clientes;

-- una vez que lo hemos comprobado y vemos que todas las direcciones estan a null, podemos borrar la tabla temporal. como la tabla temporal sigue existiendo, el select solo afecta a esta tabla temporal, la origina sigue oculta

drop temporary table clientes;

-- hay que indicar en la sentencia drop que la tabla es temporal.
-- una vez eliminada, comprobamos que la tabla original puede volver a utilizarse y que sus datos están intactos

select * from clientes;




