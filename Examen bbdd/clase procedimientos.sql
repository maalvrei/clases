create database if not exists PRUEBAS_PROCEDIMIENTOS;

USE PRUEBAS_PROCEDIMIENTOS;

-- EJEMPLO 1

DROP PROCEDURE IF EXISTS nuevo_proc;nuevo_proc
DELIMITER //

CREATE PROCEDURE nuevo_proc()
BEGIN
SELECT "HOLA MUNDO";
END//

DELIMITER ;

call nuevo_proc();

show create procedure nuevo_proc;

CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);
INSERT INTO productos (nombre, estado, precio) VALUES 
('Producto A','disponible', 8), 
('Producto B', 'disponible', 1.5),
('Producto C', 'agotado', 80),
('Producto D', 'agotado', 25.8),
('Producto E', 'disponible', 5.5);

-- ejemplo 2
drop procedure if exists listarProductos;
delimiter //
create procedure listarProductos()
begin
	select id, nombre, estado from productos;
end//
delimiter ;

call listarProductos();

-- ejemplo 3 con un parametro de entrada

drop procedure if exists listarProductoPorEstado;

delimiter //
create  procedure listarProductoPorEstado(in nom_estado varchar(20))
begin
	select * from productos where estado = nom_estado;
end //

delimiter ;

call listarProductoPorEstado("disponible");
call listarProductoPorEstado("agotado");
set @estado = 'disponible';
call listarProductoPorEstado(@estado);

-- ejemplo 4 con dos parametros, uno de entraa y otro de salida, recibe el nombre
-- del estado y devuelve el numero de productos de ese estado

drop procedure if exists contarProductoEstado;
delimiter //
create procedure contarProductoEstado(in nom_estado varchar(20), out num int)
begin
	select count(id) into num from productos where estado = nom_estado;
end //
delimiter ;

set @estado = 'agotado';
call contarProductoEstado(@estado,@numero);

select @estado, @numero;

-- ejemplo 5 con 3 parametros
use world;

drop procedure if exists poblacionSuperficiePais;
delimiter //
create procedure poblacionSuperficiePais(out poblacion int, out superficie decimal(10,2), in codigoPais char(3))
begin
	select population, surfaceArea into poblacion, superficie from country where code = codigoPais;
end //
delimiter ;

set @pais='ESP';
call poblacionSuperficiePais(@poblacion,@superficie,@pais);
select @pais as pais, @poblacion as poblacion, @superficie as superficie;






