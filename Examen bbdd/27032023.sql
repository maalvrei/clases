create schema pruebas2 default character set latin1 collate latin1_spanish_ci;

use pruebas2;

create table t1 (
	a int,
	b char(10),
	c int,
	d int);

desc t1;

alter table t1 rename to t2;
show tables;

alter table t2 rename to t1;

-- renombrar campos

alter table t1 change a campoA int;
describe t1;

alter table t1 change campoB campoB varchar(10) null;

-- modify no puedo cambiar el nombre de los campos pero puedo cambiar todo lo demas

alter table t1 MODIFY campoB varchar(10) not null default 'periquillo';

alter table t1 modify c decimal(5,2) unsigned;

-- añadir y quitar columnas

alter table t1 add nombre varchar(20) not null;
describe t1;

alter table t1 add dni varchar(9) first;

alter table t1 add apellido varchar(15) after nombre;

alter table t1 drop c, drop d;

-- añadir indices

alter table t1 add primary key (dni), add index (apellido);

-- eliminar indices

alter table t1 drop index apellido;

-- para eliminar clave primaria no se pone el nombre

alter table t1 drop primary key;

create table t2 (a integer, b char(10));

desc t2;

alter table t2 modify a int unsigned not null, change b campoB varchar(20);

alter table t2 add campoC timestamp;

alter table t2 add index (a), add index(campoB);

show index from t2;

alter table t2 add id int not null auto_increment primary key first;

alter table t2 drop id; 