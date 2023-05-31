-- Pregunta 1

INSERT INTO exaempresa.departamento (nombre, presupuesto, gastos) VALUES ('Proyectos' , 0 , 0);
INSERT INTO exaempresa.departamento (nombre, presupuesto, gastos) VALUES ('Publicidad' , 0 , 1000);

-- Pregunta 2

INSERT INTO exaempresa.empleado (nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) VALUES ('41234836R' , 'Irene' , 'Salas' , 'Flores' , 'M' , '1994-06-01' , 6);
INSERT INTO exaempresa.empleado (nif, nombre, apellido1, apellido2, sexo, nacimiento, codigo_departamento) VALUES ('82635162B' , 'Juan Antonio' , 'Sáez' , 'Guerrero' , 'H' , '1980-11-21' , 6);

-- Pregunta 3

select empleado.nombre as 'Nombre del empleado', departamento.nombre as 'Nombre del departamento' from empleado
join departamento
on empleado.codigo_departamento = departamento.codigo
order by departamento.nombre ASC;

-- Pregunta 4

select * , if (sexo like 'H', 'ES HOMBRE', 'ES MUJER') AS SEXO
from empleado
order by SEXO;

-- Pregunta 5

select nombre, presupuesto, gastos from departamento
where presupuesto >= 120000 and presupuesto <= 280000 and gastos > 20000;

-- Pregunta 6

select nombre, apellido1, apellido2 from empleado where apellido2 IS NULL;

-- Pregunta 7

select count(nif) as "Numero de empleados", departamento.nombre
from empleado
join departamento on empleado.codigo_departamento = departamento.codigo
group by departamento.nombre;

-- Pregunta 8
-- Hacemos primero la prueba para ver los datos correspondientes al departamento Proyectos antes de actualizarlo

select * from departamento where nombre like 'Proyectos';

-- Lo cual nos devuelve 0 presupuesto y 0 gastos, sabiendo esto podemos actualizarlo

set sql_safe_updates = 0;
update departamento set presupuesto = 200000 where nombre like 'Proyectos';
update departamento set gastos = 3000 where nombre like 'Proyectos';
set sql_safe_updates = 1;

-- Pregunta 9 y 10
-- Primero visualizamos el gasto de publicidad con la siguiente sentencia
select gastos, nombre from departamento where nombre like 'publicidad';

-- Una vez lo sabemos, que en este caso es 1000, añadimos los gastos al departamento contabilidad 
set sql_safe_updates = 0;
update departamento set gastos = gastos + 1000 where nombre like 'Contabilidad';
set sql_safe_updates = 1;

-- Vemos que se haya actualizado...

SELECT gastos FROM departamento;

-- Y vemos que sí, ya que antes eran 3000 y ahora 4000
-- Ya podemos eliminar el departamento publicidad

set sql_safe_updates = 0;
delete from departamento where nombre like 'publicidad';
set sql_safe_updates = 1;

-- Pregunta 11

select sum(presupuesto) as 'Total de presupuestos iniciales', sum(gastos) as 'Total de dinero gastado' , sum(presupuesto) - sum(gastos) as 'Total del dinero restante' from departamento; 

-- Pregunta 12

select nombre, presupuesto, gastos, presupuesto-gastos as dinero_restante
from departamento
order by dinero_restante desc; 

-- Pregunta 13

select presupuesto, presupuesto + (presupuesto * 0.12) as 'Presupuesto aumentado', nombre from departamento;
set sql_safe_updates = 0;
update departamento set presupuesto = presupuesto + (presupuesto * 0.12);
set sql_safe_updates = 1;
select presupuesto, nombre from departamento;

-- Pregunta 14

create table copia_dep like departamento;
insert into copia_dep select * from departamento;

-- Pregunta 15

create table empleados_mujeres select * from empleado where sexo like 'M';
select * from empleados_mujeres;

create table empleados_hombres select * from empleado where sexo like 'H';
select * from empleados_hombres;