-- Cambiamos todos los CP de Jaén Capital a 40280



-- El alumno 30222333G, ha cambiado de dirección a C/Mayor, 25, Alcázar de San Juan, Ciudad Real, 30520. Teléfono fijo: 926205020.

select * from alumnos where dni = '30222333G ';

update alumnos
set direccion = 'C/Mayor, 25', localidad = 'Alcázar de San Juan', provincia = 'Ciudad Real', cp = '30520', telefono_fijo = '926205020' where dni = '30222333G ';

-- Los Códigos postales de Madrid empiezan por 28000, comprueba si hay códigos postales erróneos y los modificas con 28100.

select * from alumnos where Provincia like 'Madrid' and cp not like '28%';

set sql_safe_updates = 0;

update alumnos set cp = '28100' where provincia like 'Madrid' and cp not like '28%';

set sql_safe_updates = 1;

-- Hay un error con el alumno 112, Su nombre es Carmen y recibe la asignatura "Sistemas Expertos".

select * from alumnos where codigo_alumno = 112;

update alumnos set nombre = 'Carmen', codigo_asignatura = '6' where codigo_alumno = 112;

-- El alumno con código 108 tiene datos incorrectos, su nombre es Lucía Arellano López, vive en la C/ Tendillas, de Córdoba capital, su teléfono fijo es 957145522 y su movil 630447788.

update alumnos set nombre = 'Lucía' , apellidos = 'Arellano López' , direccion = 'C/ Tendillas' , localidad = 'Córdoba' , provincia = 'Córdoba', telefono_fijo = '957145522', telefono_movil = '630447788'
where codigo_alumno = 108;

-- Busca todos los alumnos cuya dirección no lleve asignada calle y concatena 'C/ ' .



-- (ESTE LO HAREMOS EN CLASE, QUE TENGO QUE ESPLICAROS ALGUNAS COSAS) Vamos a cambiar todos los códigos de asignaturas de la tabla Asignaturas. el nuevo formato es: codigo + 200 .El código de asignatura que cursan   los alumnos debe cambiar automáticamente. Es posible que esté activado el modo seguro de actualización, con lo que tendrás que desactivarlo y luego volver a activarlo.
