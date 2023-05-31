drop procedure if exists numero_par;
delimiter //
create procedure numero_par(in cifra int, out espar varchar (20))
begin 
	if mod (cifra,2) = 0 then
		set espar = 'Es par';
    else
		set espar = 'Es impar';
	end if;
end //
delimiter ; 

call numero_par(2,@resul);
select @resul;

drop procedure if exists pares_impares;
delimiter //
create procedure pares_impares (in n int)
	begin
		declare contador int;
        set contador = 1;
        create table pares(
			par int unsigned
        );
        
        create table impares(
			impar int unsigned
        );
        
        while contador <= N do
			if mod(contador, 2) = 0 then
				insert into pares values (contador);
            else 
				insert into impares values (contador);
            end if;
            set contador = contador + 1;
        end while;
	end //
delimiter ;

call pares_impares(100);
select * from pares;
select * from impares;
        
drop procedure if exists borrar_registrosParImpar;
delimiter //
create procedure borrar_registrosParImpar()
begin
set sql_safe_updates=0;
delete from pares;
delete from impares;
set sql_safe_updates=1;
end //
delimiter ;

call borrar_registrosParImpar;

drop procedure if exists tablasMultiplicar;
delimiter //
create procedure tablasMultiplicar (in num1 int, in num2 int)
begin
	declare contador int;
    set contador = 1;
    drop table if exists tabla;
	create table if not exists tabla (numero int, multiplicador int, resultado int);
    while contador <= num2 do
		insert into tabla values (num1, contador, (num1*contador));
        set contador = contador + 1;
        end while;
	end //
delimiter ;

call tablasMultiplicar(20,18);
select * from tabla;

drop database if exists videoclub;
create database videoclub;
use videoclub;

drop table if exists actor;
create table actor (
	id int not null auto_increment,
    nombre varchar(64) not null,
    apellidos varchar(64) not null,
    fechaNac date,
    primary key(id)
) engine = innodb;

drop procedure if exists insertaActores;
delimiter //
create procedure insertaActores(in nombre varchar(64), in apellidos varchar (64), fechaNac date)
begin
	insert into actor (nombre, apellidos, fechaNac) values (nombre, apellidos, fechaNac);
end //
delimiter ;

call insertaActores('Periquillo', 'De Los Palotes' , '1983-12-12');
call insertaActores('Juanito', 'Me la pela' , '1946-11-24');
call insertaActores('Sergio', 'Me la suda' , '1967-10-14');
call insertaActores('Antonio', 'No me ralles' , '1924-01-04');
call insertaActores('Juanete', 'De Los Palotes' , '1983-12-12');
select * from actor;

-- procedimiento que cuenta los actores en la base de datos

drop procedure if exists cuentaActores;
delimiter //
create procedure cuentaActores(out numeroActores varchar(50))
begin
    select count(id) from actor into numeroActores;
end //
delimiter ;

call cuentaActores(@numeroActores);
select @numeroActores;

-- procedimiento que recibe una edad y lista dentro los actores con esa edad

drop procedure if exists actoresConEdad;
delimiter //
create procedure actoresConEdad(in edad int)
begin
    -- declare edadActual int;
    -- set edadActual = timestampdiff(YEAR, fechaNac, curdate());
    select *, timestampdiff(YEAR, fechaNac, curdate()) as edadActor from actor where timestampdiff(YEAR, fechaNac, curdate()) = edad;
end //
delimiter ;

select * from actor;
call actoresConEdad(39);








    
        
        
        