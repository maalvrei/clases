drop database if exists Bares;
create database if not exists Bares default character set latin1 collate latin1_spanish_ci;
use Bares;

-- Aquí creo las tablas con los campos más básicos, sin índices ni las columnas que almacenarán las claves foráneas.

create table existencias (

cod_articulo varchar (10) not null primary key check (cod_articulo > 0),
nombre varchar (60) not null,
cantidad int not null check (cantidad >= 0),
precio decimal (10 , 0) not null check (precio > 0)
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

create table pub (

cod_pub varchar (5) not null primary key check (cod_pub > 0),
nombre varchar (60) not null,
licencia_fiscal varchar (60) not null,
domicilio varchar (60),
fecha_apertura date not null,
horario varchar (60) not null check (horario in ('HOR1', 'HOR2', 'HOR3'))
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

create table titular (

cod_titular int primary key check (cod_titular > 0),
dni_titular varchar (8) not null unique,
nombre varchar (60) not null,
domicilio varchar (60)
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

create table empleado (

cod_empleado int primary key check (cod_empleado > 0),
dni_empleado varchar (9) not null unique,
nombre varchar (60) not null,
domicilio varchar (60)
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

create table localidad (

cod_postal varchar (5) primary key check (cod_postal > 1000 and cod_postal < 60000),
nombre_loc varchar (60) not null,
provincia varchar (60) not null
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

-- Una vez que tengo creadas todas las tablas, creo la tabla pub_empleado, ya que esta sólo contiene la funcion del empleado y dos claves foraneas de pub y empleado.
-- En ella he preferido establecer como clave primaria una clave compuesta por cod_pub y cod_empleado.

create table pub_empleado(

cod_pub varchar(5),
cod_empleado int,
funcion varchar(9) check (funcion in ('CAMARERO' , 'SEGURIDAD' , 'LIMPIEZA')) not null,
constraint fk_pub foreign key (cod_pub) references pub(cod_pub) on update cascade,
constraint fk_empleado foreign key (cod_empleado) references empleado (cod_empleado) on update cascade,
primary key (cod_pub, cod_empleado, funcion)
) engine=InnoDB default charset latin1 collate latin1_danish_ci;

-- A continuación, creo las columnas de las tablas que me faltaban, en las cuales almacenaré las claves foráneas. Para añadir también el índice, utilizo constraint al introducir la clave foránea.

alter table existencias add cod_pub varchar (5);
alter table existencias add constraint fk_pub_existencias foreign key (cod_pub) references pub(cod_pub) on update cascade;

alter table pub add cod_localidad varchar (5);
alter table pub add constraint fk_pub_localidad foreign key (cod_localidad) references localidad (cod_postal) on update cascade;

alter table titular add cod_pub varchar (5);
alter table titular add constraint fk_titular_pub foreign key (cod_pub) references pub (cod_pub) on update cascade;

-- Y aquí añado los índices a los nombres de cada tabla y el indice compuesto en la tabla localidad. 

alter table titular add index index_nombre_titular (nombre(10));

alter table pub add index index_nombre_pub (nombre(10));

alter table empleado add index index_nombre_empleado (nombre(10));

create index index_locidad_provincia on localidad (nombre_loc, provincia);

-- No sé por qué pero al crear la tabla pub_empleado no me crea el índice de la clave foránea cod_pub. Lo he creado manualmente aquí.

create index fk_pub on pub_empleado (cod_pub);

-- Y eso es todo. Los índices a los dni ya los añadi en la creacion de la tabla al definirlos como unique. 



