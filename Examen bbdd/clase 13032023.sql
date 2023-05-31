-- tablas temporales

select * from tabla_origen;

create temporary table tabla_origen select * from tabla_origen;

show create table tabla_origen;

set sql_safe_updates = 0;
delete from tabla_origen where id > 1 ;
set sql_safe_updates = 1;

select * from tabla_origen;

drop temporary table tabla_origen;

-- crear una temporal con nombre específico

create temporary table tmp_tabla_origen select * from tabla_origen;
select * from tmp_tabla_origen;

-- puedo crear tablas reales de una temporal

create table copia_tmp_origen select * from tmp_tabla_origen;

select * from copia_tmp_origen;
show create table copia_tmp_origen;

-- union y union all

-- union - uno dos tablas que tienen q tener la misma estructura, no copia los registros dupiclados
-- union all - uno dos tablas q tienen q tener la misma estructura, copia los registros duplicados

select * from coches;

create table coches2 select * from coches where idprod in (1 , 2 , 3);

select * from coches2;
insert into coches2 values (9 , 'Mercedes Clase A' , 'Coche de lujo');

select * from coches
union 
select * from coches2;

select * from coches
union all 
select * from coches2;

-- puedo crear tablas haciendo union