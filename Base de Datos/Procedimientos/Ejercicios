-- Procedimientos --


 /* Visualizar el total de clientes */

delimiter //

create procedure vis_total_clientes ()
begin
	select count(*) from Clientes;
end
//

delimiter ;

call vis_total_clientes();

/* Total de clientes, pero guardarlo en un caja y no vizualizarlo */

drop procedure if exists vis_total_clientes; /* Borra el procedimiento si existe */
delimiter //

create procedure vis_total_clientes (out total int)
begin
	select count(*) into total from Clientes;
end
//

delimiter ;

/* Vizualiar el cliente con codigo = 3 */

delimiter //

create procedure vis_nombre_cliente (in cod int)
begin
	select nombrecliente from Clientes where codigocliente=cod;
end
//

/* Vizualizar y guardar el cliente con codigo = 4 */
	
delimiter ;

call vis_nombre_cliente(3);

delimiter //

create procedure vis_nombre_cliente2 (in cod int, out nom varchar(50))
begin
	select nombrecliente into nom from Clientes where codigocliente=cod;
end
//

delimiter ;

call vis_nombre_cliente2(4, @micliente);
