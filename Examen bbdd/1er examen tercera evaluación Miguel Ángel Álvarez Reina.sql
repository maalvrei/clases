CREATE DATABASE IF NOT EXISTS BALONCESTO DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE BALONCESTO;

CREATE TABLE SELECCION (
	codigo char(3) Not Null PRIMARY KEY,
	nombre varchar(20) NOT NULL

)ENGINE=InnoDB CHARACTER SET latin1 COLLATE latin1_spanish_ci;

CREATE TABLE JUGADORES (
	codigo char(3) Not Null PRIMARY KEY,
	nombre varchar(20),
    apellidos varchar(20),
    posicion varchar(20),
    fechaNac date,
    codigo_seleccion char(3) NOT NULL,
    CONSTRAINT FK_Seleccion FOREIGN KEY(codigo_seleccion) REFERENCES SELECCION(codigo) ON UPDATE CASCADE
 
)ENGINE=InnoDB CHARACTER SET latin1 COLLATE latin1_spanish_ci;

DESCRIBE JUGADORES;

INSERT INTO SELECCION(codigo,nombre) VALUES
('ESP', 'España'),
('ARG', 'Argentina'),
('USA', 'Estados Unidos'),
('FRA', 'Francia');


INSERT INTO JUGADORES(codigo,nombre,apellidos,posicion,fechaNac,codigo_seleccion) VALUES
('RUB', 'Ricky', 'Rubio', 'Base' ,'1990-10-21','ESP'),
('NAV', 'Juan Carlos', 'Navarro', 'Alero' ,'1980-06-13','ESP'),
('GAS', 'Pau', 'Gasol', 'Pivot' ,'1985-01-29','ESP'),
('SCO', 'Luis', 'Scola', 'Ala-Pivot' ,'1980-04-30','ARG'),
('LAP', 'Nicolás', 'Laprovittola', 'Pivot' , '1990-01-31','ARG'),
('JAM', 'LeBron Raymone', 'James ', 'Pivot' , '1984-12-30','USA'),
('PAR', 'Tony', 'Parker', 'Base' , '1982-01-31','FRA');

use baloncesto;

-- 1. Muestra los nombres y apellidos de todos los jugadores nacidos en enero, en mayúsculas, ordenados por apellido y nombre

select upper(nombre), upper(apellidos) as mesNacimiento from jugadores where month(fechaNac) = 1 order by nombre asc, apellidos asc;

-- 2.Muestra los datos de los jugadores españoles de la siguiente forma: Pau Gasol -- Selección: España -- Juega de: Pivot

select concat(jugadores.nombre, ' -- Selección:' , seleccion.nombre , ' -- Juega de: ' , jugadores.posicion) as 'Información del jugador' from jugadores join seleccion on jugadores.codigo_seleccion = seleccion.codigo;

-- 3. Muestra el nombre del jugador hasta la primera letra 'i' que aparezca en su nombre y si no tienen letra 'i' el nombre completo

select if(instr(nombre, 'i') > 0, substring(nombre, 1, instr(nombre, 'i') - 1), nombre) as nombre_jugador from jugadores;

-- 4. Muestra los nombres, apellidos de todos los jugadores ( reemplazando "Ricky" por "Ricardo") y el año de su nacimiento. Ordena por año de nacimiento.

select if(nombre like 'Ricky', 'Ricardo', nombre) as nombre, apellidos, month(fechaNac) as mes from jugadores order by mes asc;

-- 5 Muestra los jugadores ordenados por edades (no es el año de nacimiento).

select TIMESTAMPDIFF(YEAR, fechaNac , curdate()) AS edad , nombre from jugadores order by edad asc;

-- 6 Muestra nombre, apellido, nombre selección, seguido de su fecha de nacimientoformateada de la siguiente forma ' Nacido el día: 31 de January de 1990'. Utiliza date_format.

SELECT date_format( fechaNac, 'Nacido el día: %d de %M de %Y') as fecha from jugadores;

-- 7 PUEDES UTILIZAR VARIABLES. Cuántos años de diferencia hay entre el jugador más joven y el más viejo

set @jugadorMasViejo = (select min(fechaNac) from jugadores);
set @jugadorMasJoven = (select max(fechaNac) from jugadores);
select @jugadorMasViejo;
select @jugadorMasJoven;

select concat('Hay ' , TIMESTAMPDIFF(YEAR, @jugadorMasViejo , @jugadorMasJoven) , ' años de diferencia entre el jugador más joven y el más viejo ') as diferencia;

-- 8. Muestra el nombre, apellidos y selección de todos los jugadores cuyo país empiece por E.

select jugadores.nombre, jugadores.apellidos, seleccion.nombre from jugadores join seleccion on jugadores.codigo_seleccion = seleccion.codigo where seleccion.nombre like 'E%';

-- 9) ¿Quien es el jugador más joven?. Muestra sus datos.

select codigo, nombre, apellidos, posicion, fechaNac, codigo_seleccion from jugadores where fechaNac = ( select min(fechaNac) from jugadores);

-- 10) Muestra los jugadores de la misma selección a la que pertenece Luis Scola. Debe aparecer código, nombre y apellido del jugador y el nombre de la selección.

select codigo, nombre, apellidos from jugadores where codigo_seleccion = (select codigo_seleccion from jugadores where nombre like 'Luis' and apellidos like 'Scola');



