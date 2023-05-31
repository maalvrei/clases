-- 10. Indica quiénes son los usuarios activos e inactivos en nuestra web, indicándolo con un texto identificador, muestra además los campos que nos servirían para ponernos en contacto con ellos.

select concat('El usuario ' , nombre, ' está ' , if(activo = 1, 'activo. ', 'inactivo. ') , 'Puedes contactarle en el telefono ' , telefono , ' o en el correo electrónico ' , email) as ESTADO from usuarios;

-- 11. Muestra los datos de los usuarios con saldo cero e indica si están activos o inactivos.

select * , if(activo = 1 , 'Activo' , 'No activo') as 'Estado de actividad' from usuarios where saldo = 0;

-- EJERCICIOS ADICIONALES
-- 1. Mostrar los usuarios cuyo código de usuario contenga la letra "A" en la tercera posición, junto con la longitud de su nombre.

select *, length(nombre) as longitud_nombre from usuarios where substring(usuario, 3, 1) = 'a';

-- 2. Mostrar los usuarios cuyo código de usuario comience con la letra "A".

select nombre from usuarios where (left(usuario,1) like 'A');

-- 3. Mostrar el promedio del saldo de los usuarios activos.

select round(avg(saldo),3) as promedio_saldo from usuarios where activo = 1;

-- 4. Mostrar el nombre y el nivel de los usuarios cuyo correo electrónico termina en "@gmail.com".

SELECT nombre, nivel, email FROM usuarios WHERE email LIKE '%@gmail.com';

select nombre,email from usuarios where substring( email, (INSTR(email, '@'))) like '@gmail.com';

-- 5. Mostrar el número total de usuarios activos, junto con el porcentaje de usuarios activos que tienen un número de teléfono que contiene el dígito "5".

select concat(nombre, ' (', usuario, ') tiene un saldo de ', saldo, ' euros') as datos_usuario  from usuarios  where nivel = 1 and saldo > 5;