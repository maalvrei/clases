

-- 1. Haz un select a cada tabla para saber el número de registros que tiene cada una. Observa los campos y los datos que contienen.

select * from alumnos;
select * from asignaturas;

-- 2. Ordena la tabla asignaturas por departamento descendente y nombre asignaturas ascendente.

select departamento, nombre from asignaturas ORDER BY departamento DESC, nombre ASC;

-- 3. Devuelve el nombre y apellidos de los 5 primeros alumnos y el departamento al que pertenecen, ordenados por departamento.

select a.codigo_alumno, a.nombre, asig.departamento from alumnos a, asignaturas asig 
where a.codigo_asignatura = asig.codigo 
order by departamento limit 5;

select a.codigo_alumno, a.nombre, asig.departamento from alumnos a
join asignaturas asig on a.codigo_asignatura = asig.codigo 
order by asig.Departamento limit 5;

-- 4. Muestra las diferentes provincias de los alumnos.

select distinct provincia from alumnos;

-- 5. Cuenta el númro de alumnos que tengo de diferentes provincias. Debe aparecer el nombre de la provincia y en número de alumnos.

select count(dni) as "Número de alumnos", provincia as Provincia from alumnos group by provincia;

/*6. Muestra la información siguiente con estos "Alias". Y ordena por orden alfabético los alumnos.
Codigo_alumno= Código del alumno.
Apellidos= Apellidos del alumno
Direccion= Direción del alumno.
Asignaturas.nombre= "Asignatura que cursa el alumno"
Asignaturas.departamenteo="Departamento al que corresponde el alumno" */

select alumnos.nombre as "Nombre del alumno" , alumnos.codigo_alumno as "Código del alumno" , alumnos.Apellidos as "Apellido del alumno" , alumnos.direccion as "Dirección del alumno" , asignaturas.nombre as "Asignatura que cursa el alumno" , asignaturas.departamento as "Departamento al que corresponde el alumno"
from alumnos join asignaturas on alumnos.Codigo_asignatura = asignaturas.codigo
order by alumnos.Nombre;

-- 7. Muestra los datos de los alumnos cuyo código postal es menor de 28000.

select * from alumnos where alumnos.CP < 28000;

-- 8. Muestra los datos de los alumnos cuyo código postal está entre 14100 y 28000 (ambos imcluídos). Utiliza and y between. Luego muestra los que NO están incluídos (usando AND y between).

select * from alumnos where CP between 14100 and 28000;

select * from alumnos where CP not between 14100 and 28000; 

-- 9. Muestra código alumno, nombre y apellido de los alumnos que son de Córdoba o Madrid y además su código_asignatura sea igual 1 ó 4.

select a.Codigo_alumno, a.Nombre, a.Apellidos, a.Provincia , a.Codigo_asignatura from alumnos a where a.Provincia = "Córdoba" or a.Provincia = "Madrid" and a.Codigo_asignatura = 1 or a.Codigo_asignatura = 4 order by a.Provincia;

-- 10. Muestra código alumno, nombre y apellido de los alumnos y nombre de la asignatura, cuyo código de alumno está entre 104 y 108 y cursan la asignatura "Administración de Base de datos"

select a.Codigo_alumno, a.Nombre, a.Apellidos, asig.Nombre from alumnos a
join asignaturas asig
on a.Codigo_asignatura = asig.Codigo
where a.Codigo_alumno between 104 and 108
and asig.nombre = "Administración de Base de Datos";

-- 11. Quiro saber cuántas horas lectivas tiene cada asignatura (un crédito = 25 horas lectivas)

select a.Creditos*25 as "Número de horas lectivas", a.Nombre from asignaturas a;

-- 12. Muestra los datos de los 5 primeros alumnos matriculados(consideramos que el orden de matrícula es el orden de inserción en la tabla) (Utiliza IF). El resultado de la función IF debe aparecer con el Alias PRIMERAS_MATRICULAS Si es uno de los 5 primeros alumnos matriculados debe aparecer la leyenda 'Cincuenta primeros matriculados',  en caso contrario debe aparecer la leyenda 'Resto de alumnos matriculados'

select *, if (codigo_alumno >= 100 and codigo_alumno <105 , "Cinco primeros alumnos" , "Resto de alumnos matriculados") as "Primeras matrículas"
from alumnos
order by "Primeras matrículas" desc;

-- 13.  Muestra las direcciones que comiencen por C/

select a.Direccion from alumnos a where a.Direccion like 'C/%';

-- 14. Muestra los alumnos cuyo segundo apellido sea García.

select a.Apellidos as Apellidos from alumnos a where Apellidos like '%García';

-- 15. Muestra los alumnos cuyo segundo apellido no sea García.

select a.Apellidos as Apellidos from alumnos a where Apellidos not like '%García';

-- 16. Muestra los alumnos cuyo primer apellido sea García.

select a.Apellidos as Apellidos from alumnos a where Apellidos like 'García%';

-- 17. Muestra los alumnos que tengan el apellido García, da igual si primero o segundo.

select a.Apellidos as Apellidos from alumnos a where Apellidos like '%García%';

-- 18) Muestra los alumnos cuyo segundo apellido sea Estrada o López

select a.Apellidos as Apellidos from alumnos a where Apellidos like '%Estrada' or Apellidos like '%López';

-- 19) Muestra los alumnos de la comunidad de Valencia (utiliza operador IN en una consulta y en otra diferente el  operador LIKE) 
-- provincias= Alicante , Castellón y Valencia .

select a.Nombre, a.Provincia from alumnos a where a.provincia in ("Alicante", "Castellón" , "Valencia");

select a.Nombre, a.Provincia from alumnos a where a.provincia like "Alicante" or a.provincia like "Castellón" or a.provincia like "Valencia";

-- 20 Muestra los datos de todos los alumnos, busca los ANDALUCES (COMPRUEBA LAS 8 PROVINCIAS) utiliza IF, debe aparecer la leyenda “Alumno Andaluz” y en caso contrario “lo siento, no eres Andaluz”, ordena de forma que primero salgan los andaluces.

select *,
if (a.provincia = "Sevilla"
or a.provincia = "Córdoba"
or a.provincia = "Almería"
or a.provincia = "Granada"
or a.provincia = "Jaen"
or a.provincia = "Málaga"
or a.provincia = "Cádiz"
or a.provincia = "Huelva",
"Andaluz", "No andaluz") as "Andaluz o no"
from alumnos a;

-- 21) Muestra los 4 departamentos que existen y Cuenta las asignaturas que tiene cada departamento. 

select distinct departamento, count(nombre) as "Número de asignaturas" from asignaturas group by departamento;

-- 22) Muestra las asignaturas que existen (y sus créditos) y cuenta el número de alumnos matriculados en cada una de ella.

select distinct asig.nombre, asig.creditos, count(a.DNI) as "Número de alumnos" from asignaturas asig join alumnos a on asig.Codigo = a.Codigo_asignatura group by asig.Codigo;

-- 23) Muestra las asignaturas que existen (y sus créditos) y cuenta el número de alumnos matriculados en cada una de ella, pero sólo de las asignaturas de más de 15 créditos.

select distinct asig.nombre, asig.creditos, count(a.DNI) as "Número de alumnos" from asignaturas asig join alumnos a on asig.Codigo = a.Codigo_asignatura where asig.Creditos >15 group by asig.Codigo;

-- 23) Cuenta cuántos alumnos tengo de Madrid en cada asignatura (Muestra el nombre de la asignatura y el número de alumnos)

select count(a.dni) as "Número de alumnos", asig.nombre as "Nombre de la asignatura" from alumnos a join asignaturas asig on a.Codigo_asignatura = asig.Codigo group by asig.nombre;

-- 24) Añade lo que haga falta a la consulta anterior para mostrar sólo las asignaturas que tienen más de un alumno matriculado de Madrid.

select count(a.dni) as "Número de alumnos", asig.nombre as "Nombre de la asignatura", a.Provincia
from alumnos a
join asignaturas asig
on a.Codigo_asignatura = asig.Codigo
where a.Provincia ="Madrid"
group by asig.nombre;

-- 25) Muestra la Suma de los créditos de todas las asignaturas que tiene cada uno de los departamentos.

select sum(creditos), departamento from asignaturas group by departamento;

-- 26) A la consulta anterior. Solo sumaré las asignaturas de más de 10 créditos.

select sum(creditos), departamento from asignaturas where creditos > 10 group by departamento;

-- 27) A la consulta anterior. Sólo mostraré los departamentos que oferten más de 25 créditos en total

select departamento, sum(creditos) sumaCre  from asignaturas where creditos > 10 
group by departamento having sumaCre > 25;