CREATE TABLE `alumnos_sinclave` select * from alumnos;
describe alumnos_sinclave;
CREATE TABLE alumnos_segunda like alumnos;
INSERT INTO alumnos_segunda select * from alumnos;
describe alumnos_segunda;

CREATE TABLE `asignaturas_sinclave` select * from asignaturas;
describe asignaturas_sinclave;
CREATE TABLE `asignaturas_segunda` like asignaturas;
INSERT INTO `asignaturas_segunda` select * from asignaturas;
describe asignaturas_segunda;

CREATE TABLE datos_personales select codigoAlumno , dni, nombre, apellidos, fechanacimiento from alumnos;
delete from datos_personales;

INSERT INTO datos_personales select codigoAlumno, dni, nombre, apellidos, fechanacimiento from alumnos where provincia like 'Jaén';
INSERT INTO datos_personales select codigoAlumno, dni, nombre, apellidos, fechanacimiento from alumnos where provincia like 'Madrid';
INSERT INTO datos_personales select codigoAlumno, dni, nombre, apellidos, fechanacimiento from alumnos where provincia like 'Córdoba';
drop table alumnos_segunda , asignaturas_segunda, asignaturas_sinclave;
drop table datos_personales;

create table AlumnosDeSegundo like alumnos;
insert into alumnosdesegundo SELECT * FROM alumnos WHERE codigo_alumno >= 102 AND codigo_alumno <= 106;
insert into alumnosdesegundo SELECT * FROM alumnos WHERE dni like '45145254E';
insert into alumnosdesegundo SELECT * FROM alumnos WHERE (Fecha_nacimiento >= '1980-01-01' AND Fecha_nacimiento <= '1981-12-31') and Codigo_alumno not in (102 , 103 , 104, 105, 106, 116 , 117);

insert into alumnosdesegundo SELECT * FROM alumnos WHERE provincia like 'Málaga' OR provincia like 'Mallorca' or provincia like 'Barcelona';
