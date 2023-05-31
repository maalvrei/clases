use world;

-- 1) Crea un procedimiento llamado saludo, que reciba como parámetro en nombre de una persona (por ejemplo PEPE) y muestre por pantalla "BIENVENIDO A CLASE PEPE".

drop procedure if exists saludo;
delimiter //
create procedure saludo(in nombre varchar(20))
begin
	select concat("BIENVENIDO A CLASE, " , nombre) as saludo;
end//
delimiter ;

call saludo("PEPE");

-- 2) Crea un procedimiento llamado datosPersona  que reciba tres parámetros de entrada con el nombre, apellidos
-- y edad de una persona y muestre por pantalla las tres variables concatenadas con un texto de tu invención.

drop procedure if exists datosPersona;
delimiter //
create procedure datosPersona(in nombre varchar(20), in apellidos varchar(30), in edad int)
begin
	select concat("USUARIO " , nombre , " ", apellidos, ". " , edad, " años de edad.") as datos;
end//
delimiter ;

call datosPersona("PEPE", "MARTINEZ MONTAÑES", 22);

-- 3) Crea un procedimiento llamado areaRectangulo que reciba dos parámetros de entrada (base y altura) y calcule el área de 
-- un rectángulo (base*altura)   y lo muestre por pantalla.

drop procedure if exists areaRectangulo;
delimiter //
create procedure areaRectangulo(in base int, in altura int)
begin
	select concat("Area del rectangulo:" , base*altura) as area;
end //
delimiter ;

call areaRectangulo(5,22);

-- Modificar el procedimiento, lo llamas areaRectangulo_2 que reciba 
-- dos parámetros de entrada (base y altura) y uno de salida llamado resultado. Calcule el área de un rectángulo (base*altura) y lo devuelva en la variable de salida resultado.

drop procedure if exists areaRectangulo2;
delimiter //
create procedure areaRectangulo2(in base int, in altura int, out area int)
begin
	select base*altura into area;
end //
delimiter ;

call areaRectangulo2(5,22,@area);
select @area;

-- 4) Escribe un procedimiento llamado positivoNegativo que reciba un número
-- real de entrada y muestre un mensaje indicando si el número es positivo o
-- negativo. Prueba con los tres valores requeridos. ( hay que usar IF / ELSE)

drop procedure if exists positivoNegativo;
delimiter //
create procedure positivoNegativo(in numero int, out resultado varchar(10))
begin
	if numero < 0 then
		select "Negativo" into resultado;
	elseif numero = 0 then
		select "Numero 0" into resultado;
	else
		select "Positivo" into resultado;
	end if;
end //
delimiter ;

call positivoNegativo(5,@resultado);
select @resultado;

-- 5) Utiliza la BD world. Crea un procedimiento llamado datosCiudad que reciba un parámetro de entrada con
-- el código de una ciudad y devuelva 3 parámetros de salida con los datos de la ciudad que tú prefieras.

DROP PROCEDURE IF EXISTS datosCiudad;
DELIMITER //
CREATE PROCEDURE datosCiudad(IN idCiudad INT, OUT nombre CHAR(35), OUT distrito CHAR(20), OUT poblacion INT)
BEGIN
	SELECT name, district, population INTO nombre, distrito, poblacion FROM city WHERE ID = idCiudad;
END //
DELIMITER ;

CALL datosCiudad(5, @nombre, @distrito, @population);
select @nombre,@distrito,@population;

-- 6) Utiliza la BD world. Crea un procedimiento llamado contarIdiomasPais que reciba un parámetro de entrada con el código de un país y devuelva 2parámetros de salida, uno con el nombre del pais y otro con el número de lenguas que se hablan en él.

DROP PROCEDURE IF EXISTS contarIdiomaPais;
DELIMITER //
CREATE PROCEDURE contarIdiomaPais(IN idPais char(3), OUT nombre CHAR(52), OUT numeroIdiomas int)
BEGIN
	SELECT count(country.code) from country join countrylanguage on country.Code = countrylanguage.CountryCode where country.code = idPais into numeroIdiomas;
    select name into nombre from country where country.code = idPais;
END //
DELIMITER ;

CALL contarIdiomaPais('ESP', @nombre, @numeroIdiomas);
select @nombre,@numeroIdiomas;

