select * from cliente;
select * from pedido;
select * from vendedor;

-- 1) mostramos los clientes y los pedidos que han realizado

select cliente.*, pedido.* from cliente join pedido on cliente.id_cliente = pedido.id_cliente;

-- podemos usar using, sólo cuando la clave foránea tiene el mismo nombre en ambas tablas

select cliente.*, pedido.* from cliente join pedido using (id_cliente);

-- podemos unir tablas también usando where:

select cliente.*, pedido.* from cliente, pedido where cliente.id_cliente = pedido.id_cliente;

-- con left join mostramos a todos los clientes y todos los pedidos realizados

select cliente.*, pedido.* from cliente left join pedido on cliente.id_cliente = pedido.id_cliente;

-- podemos darle la vuelta a la consulta anterior usando right y nos dará lo mismo

select cliente.*, pedido.* from pedido right join cliente on pedido.id_cliente = cliente.id_cliente;

-- JOIN ANIDADOS

select cliente.*, pedido.*, vendedor.*
from cliente
join pedido on cliente.id_cliente = pedido.id_cliente
join vendedor on pedido.id_vendedor = vendedor.id;