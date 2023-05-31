create table if not exists libros3 (

id int unsigned not null primary key,
titulo varchar(50),
numPaginas int check (numPaginas > 10),
editorial varchar(50) not null check (editorial in ('Alfaguara' , 'SM' , 'Anaya')),
precio int not null,
constraint chk_precio CHECK (precio > 0 and precio < 60)

);

show create table libros3;

insert into libros3 values (1 , 'La Regenta' , 850 , 'Alfaguara' , 20);
insert into libros3 values (2 , 'El Buscón' , 55 , 'Alfaguara' , 20);

create index idx_tit on libros3 (titulo);

show index from libros3;

select * from libros3;

create database if not exists prueba_tablas;

use prueba_tablas;

drop table coches;

create table coches (

idprod int not null auto_increment,
nombre varchar(120),
descripcion varchar(255),
primary key (idprod)

);

INSERT INTO coches VALUES 
(1,'Audi A3 TDI','El Audi A3 es un compacto premium, cuyos rivales principales son los BMW Serie 1, Mercedes Clase A e Infiniti Q30.'),
(2,'Audi A4 TDI','El Audi A4 es la berlina de referencia de Audi, el rival de BMW Serie 3 y Mercedes Clase C'),
(3,'Audi A8 TDI','El Audi A8 es la gran berlina de Audi, rivaliza con el BMW Serie 7, el Mercedes Clase S y el Lexus LS'),
(4,'Audi 100','El modelo en sus variantes deportivas y de lujo se comercializó En 1995'),
(5,'Audi 100 CV','un cinco cilindros en línea de 2,3 litros y 133 CV,'),
(6,'coche con Equipo de Audio 100 Wats',NULL),
(7,'coche para audiencias',NULL);

select * from coches;

-- 1. Busco los Audi, utilizo like

select * from coches where nombre like '%AUDI%';

create fulltext index idx_full_nombre on coches (nombre);

show index from coches;

select nombre, descripcion from coches where match (nombre) against ('Audi TDI 100');

select nombre, descripcion from coches where match (nombre) against ('Mercedes');

drop index idx_full_nombre on coches;

create fulltext index idx_full_nomdesc on coches (nombre, descripcion);

select nombre, descripcion from coches where match (nombre, descripcion) against ('tdi 1995');