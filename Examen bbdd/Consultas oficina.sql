
-- CONSULTAS.
-- 1. Calcula cuanto ganan en total todos los empleados
Select sum(salEmp) AS totalSueldos
From empleados;

-- 2. Calcula cuanto ganan en total cada uno de los grupos de empleados clasificados por cargo
Select cargoE, sum(salEmp) AS totalSueldos
From empleados Group by cargoE;

-- 3. Calcula el máximo sueldo para cada uno de los grupos de empleados clasificados por cargoE
Select cargoE, max(salEmp) AS maxSueldo
From empleados
Group by cargoE;

-- 4. Calcula el sueldo medio de los empleados de cada departamento 

Select departamentos.codDepto, nombreDpto, ciudad, round(avg(salEmp), 2) as sueldo_medio
From departamentos, empleados
where departamentos.codDepto=empleados.codDepto
Group by departamentos.codDepto;

-- 5 muestra a qué departamento pertenece cada empleado
Select nDIEmp,nomEmp,departamentos.codDepto, nombreDpto, ciudad
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto;

-- 6. muestra cuantos empleados hay en cada departamento.

Select departamentos.codDepto, nombreDpto, ciudad, count(*) as NumEmpPorDepartamento
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto
GROUP BY codDepto;

-- 7. A partir de la tabla empleados, visualizar cuántos apellidos de los empleados empiezan por la letra A.
select nDIEmp, nomEmp from empleados where nomEmp like '% A%';

-- 8. muestra el nombre de los que trabajan en gerencia.
Select nDIEmp,nomEmp,cargoE, departamentos.codDepto, nombreDpto
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto and nombreDpto like 'GERENCIA';

-- pero los gerentes son:
Select nDIEmp,nomEmp,cargoE, departamentos.codDepto, nombreDpto
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto and nombreDpto like 'GERENCIA' and cargoE like 'Gerente';

-- 9. visualiza los empleados hombres y mujeres poniendo: SEXO: HOMBRE O MUJER (usa if)
Select nDIEmp,nomEmp,if (sexEmp like 'M', 'HOMBRE', 'MUJER') AS SEXO
From empleados;

-- 10. muestra EL NÚMERO DE HOMBRES Y MUJERES
Select if (sexEmp like 'M', 'HOMBRES', 'MUJERES') AS SEXO, COUNT(sexEmp) as EmpPorSexo
From empleados GROUP BY sexEmp;

select count(sexEmp) From empleados  where sexEmp like 'F' GROUP BY sexEmp ; 

-- 11. muestra el sueldo bruto de cada empleado
Select nDIEmp,nomEmp, (salEmp + comisionE) as 'sueldo bruto'
From empleados;

-- 12. muestra los nombre de los empleados y quienes son sus jefes.

SELECT empl.nDIEmp, empl.nomEmp AS EMPLEADO, empl.jefeID, jefe.nomEmp AS JEFE FROM empleados AS empl, empleados AS jefe
WHERE jefe.nDIEmp=empl.jefeID ;

SELECT empleados.nDIEmp, empleados.nomEmp AS EMPLEADO, empleados.jefeID, empleadoJEFE.nomEmp AS JEFE
FROM empleados
INNER JOIN empleados AS empleadoJEFE
ON empleados.jefeID =empleadoJEFE.nDIEmp ; -- ESTA ES IGUAL QUE LA ANTERIOR, PERO CON JOIN
											-- con inner join saco 25, me dejo al jefe supremo

SELECT empleados.nDIEmp, empleados.nomEmp AS EMPLEADO, empleados.jefeID, empleadoJEFE.nomEmp AS JEFE
FROM empleados
LEFT JOIN empleados AS empleadoJEFE
ON empleados.jefeID =empleadoJEFE.nDIEmp ;   -- CON left join, saco 26, el gerente también

-- 13. cuenta los empleados de cada ciudad
Select ciudad, count(empleados.codDepto) as empleadosEnCiudades
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto group by ciudad;

-- 14. Muestra los diferentes cargos de los distintos departamentos
Select cargoE Cargo_Empleado, nombreDpto Nombre_departamento
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto group by cargoE, nombreDpto;

-- 15. Muestra los salarios máximos de cada departamento
Select departamentos.codDepto,nombreDpto, ciudad, max(salEmp) salarioMaxDepar
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto
Group by empleados.codDepto; -- 12 registros

-- si añado que el salario supere 10500
Select departamentos.codDepto,nombreDpto, ciudad, max(salEmp) salarioMaxDepar
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto
Group by codDepto
having salarioMaxDepar > 10500; -- 9 registros
-- también sale si contamos salEmp en el where, ya que es un max, y se puede depreciar la cantidad

-- si agrupo por nombre de departamento
Select nombreDpto,  max(salEmp) salarioMaxDepar
From empleados,departamentos 
where empleados.codDepto=departamentos.codDepto
Group by nombreDpto; -- 6 registros

-- 16) Muestra quién es el jefe de cada departamento.

select departamentos.codDepto Codigo_Departamento, nombreDpto Nombre_Departamento, ciudad, codDirector, nomEmp
from departamentos, empleados
where codDirector= nDIEmp;  -- OK- SI CASO EL CÓDIGO DEL DIRECTOR CON EL CÓDIGO DEL EMPLEADO PUESO SACAR EL NOMBRE DEL JEFE

-- OTRA FORMA ----------------
select  distinct departamentos.codDepto Codigo_Departamento, nombreDpto Nombre_Departamento, ciudad, codDirector, jefeID dni_Jefe
from departamentos, empleados
where codDirector=jefeID;  -- HASTA AQUÍ CORRECTO, PERO QUIERO SACAR EL NOMBRE DEL JEFE, CASANDO ASÍ NO PUEDO, TENGO QUE CASAR OTROS CAMPOS

select distinct departamentos.codDepto Codigo_Departamento, CIUDAD, nombreDpto Nombre_Departamento, codDirector,  jefeID dni_Jefe , 
(SELECT Emp2.nomEmp  FROM EMPLEADOS Emp2 WHERE Emp2.nDIEmp = empleados.jefeID) Nombres_Jefes
from departamentos, empleados
where codDirector=jefeID;  -- CON UNA SUBCONSULTA EN LOS CAMPOS DE LA TABLA SALE PERFECTAMENTE LA PRIMERA FORMA DE CASAR

select distinct coddirector from departamentos; -- 6 

-- 17) Muestra el dni y nombre de los empleados del departamento de ventas de Madrid, y el nombre de su JEFE.

SELECT empleados.nDIEmp,empleados.nomEmp, empleados.codDepto, departamentos.nombreDpto, departamentos.ciudad, empleJefe.nomEmp JEFE
FROM EMPLEADOS, DEPARTAMENTOS, empleados empleJefe
where EMPLEADOS.codDepto=DEPARTAMENTOS.codDepto and DEPARTAMENTOS.nombreDpto like 'VENTAS' and ciudad like 'MADRID'
AND  EMPLEADOS.jefeID=empleJefe.nDIEmp ;

-- 18) Muestra los datos de los empleados y de los jefes del departamento de VENTAS (da igual la ciudad) y ordena por nombre del JEFE.

SELECT empleados.nDIEmp,empleados.nomEmp, empleados.codDepto, departamentos.nombreDpto, departamentos.ciudad, empleJefe.nomEmp JEFE
FROM EMPLEADOS, DEPARTAMENTOS, empleados empleJefe
where EMPLEADOS.codDepto=DEPARTAMENTOS.codDepto and DEPARTAMENTOS.nombreDpto like 'VENTAS' 
AND  EMPLEADOS.jefeID=empleJefe.nDIEmp  order by jefe;

-- 19) Muestra los datos de los empleados y los del jefe del departamento de INVESTIGACIÓN (da igual la ciudad)
SELECT empleados.nDIEmp,empleados.nomEmp, empleados.codDepto, departamentos.nombreDpto, empleJefe.nomEmp JEFE
FROM EMPLEADOS, DEPARTAMENTOS, empleados empleJefe
where EMPLEADOS.codDepto=DEPARTAMENTOS.codDepto and DEPARTAMENTOS.nombreDpto like 'INVESTIGACIÓN' 
AND  EMPLEADOS.jefeID=empleJefe.nDIEmp ;

-- 20) MUESTRA LOS DATOS DEL GERENTE EN LA CONSULTA MÁS FÁCIL QUE SE TE OCURRA

select * from empleados where jefeId is null;