create table t3 (
cantidad int,
precio int
);

insert into t3 values (1,2);
insert into t3 values(3,4);

create view vista1 as select cantidad, precio, (cantidad*precio) total from t3;

select * from vista1;

-- vista 2, cambiando nombre de los campos

create or replace view vista2 (cantidad_almacen, precio_venta, subtotal) as select cantidad, precio, (cantidad * precio) total from t3;

select * from vista2;

-- basandome en la vista2 creo una vista con el total de los subtotales

create or replace view vista3 as select sum(subtotal) total from vista2;

select * from vista3;

-- ojo con esto

create or replace view vista4 (cantidad_almacen, precio_venta, subtotal) as select cantidad, precio, (cantidad * precio) from t3;

select * from vista2;