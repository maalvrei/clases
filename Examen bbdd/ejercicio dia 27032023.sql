-- 1) Modifica el nombre del campo telefono_movil a telefonoM.
describe alumnos;
alter table alumnos change telefonoM telefonoM varchar(9) not null;

-- 2) Modifica el campo nombre a varchar(60) caracteres.

describe alumnos;

alter table alumnos modify nombre varchar(60);
alter table alumnos modify nombre varchar(60) not null;


-- 3) Añade un nuevo campo sexo, el tipo es un char de un caracter, por defectos
-- es &#39;F&#39; y con una restriccion ckeck que sólo permita los valores M o F; además debe ir antes de la dirección.

describe alumnos;
alter table alumnos add sexo char(1) default 'F' check (sexo = 'F' or sexo = 'M') after apellidos;

-- 4) Modifica el campo cp a CodigoPostal (es un número de 5 dígitos) cambia al valor que creas más oportuno, debe ser sin signo.

alter table alumnos change cp CodigoPostal mediumint unsigned;

-- 5) Modifica el campo nombre y apellidos a un varchar(100) caracteres y provincia a varchar(30) caracteres. En la misma sentencia.

alter table alumnos modify nombre varchar(100) not null, modify provincia varchar (30) not null;

-- 6) Inserta un nuevo campo correoContacto, varchar(150) no nulo. Irá después del campo telefonoM.

alter table alumnos add correoContacto varchar (150) not null after telefonoM;

-- 7) El campo correoContacto se llamará correoPersonal.

alter table alumnos change correoContacto correoPersonal varchar (150);

-- 8) Inserta los correos de cada alumno.

set sql_safe_updates = 0;
update alumnos set correoPersonal = CONCAT(lower(left(nombre,1)), substring(nombre,2, 4),right(dni, 6), '@gmail.com');
set sql_safe_updates = 1;

select correoPersonal,nombre from alumnos;

-- 11) Carmen Moreno García ha cambiado su domicilio a C/ Arganzuela, 32 de Madrid, CP=28021 cambiar los datos necesarios.

update alumnos set direccion = 'C/ Arganzuela, 32', localidad = 'Madrid', CodigoPostal = 28021 where codigo_alumno = 110;

-- 12) Elimina la clave foránea que tiene alumnos con asignaturas.

alter table alumnos drop foreign key alumnos_asignatura_fk;
show index from alumnos;

show create table alumnos;

-- 13) Elimina las claves principales de las tablas alumnos y asignaturas.

alter table alumnos drop primary key;
alter table asignaturas drop primary key;
show index from alumnos;
show index from asignaturas;


-- 14) Vuelve a crear las claves principales.

alter table alumnos add primary key (Codigo_alumno);
alter table asignaturas add primary key (Codigo);

-- 15) Vuelve a crear las claves foráneas.

alter table alumnos add constraint alumnos_asignatura_fk foreign key (Codigo_asignatura) references asignaturas (codigo) on delete no action on update cascade;

-- 16) Inserta 2 nuevos alumnos.

insert into alumnos values (122, '49126859D', 'Timo', 'Alvarez Hurtado', 'M', 'San Patricio 79', 'La Puebla de Cazalla', 'Sevilla', 41540, '957855478' , '784512456' , 'migueli@gmail.com', 4 , '1996-04-12');
insert into alumnos values (123, '49176459D', 'Jaime', 'Mochuelo', 'M', 'Victoria 1', 'La Puebla de Cazalla', 'Sevilla', 41540, '985475344' , '644512458' , 'jaimemochu@gmail.com', 7 , '1996-12-28');

-- **** Añade los siguientes índices: Utiliza ALTER TABLE.

-- 17) Indexa el campo DNI. Decide qué índice es el más adecuado.

alter table alumnos add unique index(dni);

-- 18) Indexa los campos nombre y apellidos en un índice compuesto.

alter table alumnos add index (nombre, apellidos);

-- 19) Crea el índice provincias.

alter table alumnos add index (provincia);

-- 20) Elimina el índice provincias.

alter table alumnos drop index provincia;

-- 21) Crea un índice con los 4 primeros caracteres de la localidad.

alter table alumnos add index (localidad(4));
show index from alumnos;
-- 22) Elimina los índices anteriores con ALTER TABLE

alter table alumnos drop index dni, drop index nombre, drop index localidad;

-- Crea todos los índices anteriores con CREATE INDEX. Luego los eliminas con DROP INDEX.

create unique index dni_unico on alumnos (dni);
create index indx_nombre_apellidos on alumnos (nombre, apellidos);
create index indx_provincia on alumnos (provincia);
create index indx_localidad on alumnos (localidad(4));

drop index dni_unico on alumnos;
drop index indx_nombre_apellidos on alumnos;
drop index indx_provincia on alumnos;
drop index indx_localidad on alumnos;