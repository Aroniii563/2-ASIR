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

/* Crea un procedimiento almacenado que tome dos parámetros de entrada: 
cliente_id y antiguedad_en_meses. Verifica si la antigüedad del cliente 
es mayor a 12 meses, y si lo es, establece un nuevo aumento del 20% en su 
limite de crédito; de lo contrario, se establece un estandar estándar del 
10%. Luego, actualiza el descuento del cliente en la tabla Clientes según 
el cliente_id proporcionado. */

DELIMITER //


CREATE PROCEDURE actualizarLimiteCredito(

    IN cliente_id INT,

    IN antiguedad_en_meses INT

)

BEGIN

    DECLARE nuevo_limite DECIMAL(15,2);
  
    -- Verificar si la antigüedad es mayor a 12 meses

    IF antiguedad_en_meses > 12 THEN

        SET nuevo_limite = 0.20; -- Nuevo aumento

    ELSE

        SET nuevo_limite = 0.10; -- Nuevo aumento

    END IF;

    -- Actualizar el descuento del cliente
    start transaction;
    UPDATE Clientes

    SET limitecredito = limitecredito+limitecredito*nuevo_limite

    WHERE codigocliente = cliente_id;

END //

DELIMITER ;
