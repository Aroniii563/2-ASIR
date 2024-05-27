* Escribe un procedimiento que reciba el nombre de un país como
 parámetro de entrada y realice una consulta sobre la tabla
 cliente para obtener todos los clientes que existen en la tabla de ese país. */
 
delimiter //
create procedure pais_cliente (in pais varchar(50))
begin
    select * from Clientes where Clientes.pais = pais;
end //
delimiter ;    

/* Escribe un procedimiento que reciba como parámetro de
 entrada una forma de pago, que será una cadena de caracteres
 (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida
 el pago de máximo valor realizado para esa forma de pago.
 Deberá hacer uso de la tabla pago de la base de datos jardineria. */
 
delimiter //
create procedure forma_de_pago (in pago varchar(50), out maximo decimal(15, 2))
begin
	set maximo =
    (select max(cantidad) from Pagos where Pagos.formapago = pago);
end //
delimiter ;

/* Escriba un procedimiento llamado listar_productos que reciba como entrada
 el nombre de la gama y muestre un listado de todos los productos que existen
 dentro de esa gama. Este procedimiento no devuelve ningún parámetro de 
 salida, lo que hace es mostrar el listado de los productos. */


delimiter //
create procedure listar_productos (in gama varchar(50))
begin
	select * from Productos where Productos.gama = gama;
end //
delimiter ;

/* Escribe un procedimiento que se llame calcular_max_min_media, que
 reciba como parámetro de entrada el nombre de la gama de un producto 
 y devuelva como salida tres parámetros. El precio máximo, el precio mínimo 
 y la media de los productos que existen en esa gama. Resuelva el ejercicio
 de dos formas distintas, utilizando SET y SELECT ... INTO. */
 
 delimiter //
 create procedure calcular_max_min_media (in gama varchar(50), out max decimal(15, 2), out min decimal(15, 2), out media decimal(15, 2))
 begin
	set max =
	(select max(precioventa) from Productos where Productos.gama = gama);
    
    set min =
    (select min(precioventa) from Productos where Productos.gama = gama);
    
    set media =
    (select avg(precioventa) from Productos where Productos.gama = gama);
    
   /* Otra manera:
    select
    max(precioventa), min(precioventa), avg(precioventa)
    from Productos where Producto.gama = gama into max, min, media;
	*/
    
end //
delimiter ;

/* Escriba una función llamada contar_productos que reciba como
 entrada el nombre de la gama y devuelva el número de productos
 que existen dentro de esa gama. */
 
 delimiter //
 create function contar_productos (gama varchar(50))
	returns int unsigned
    reads sql data
begin
	declare total int unsigned;
    set total =
    (select count(*) from Productos where Productos.gama = gama);
    return total;
end //
delimiter ;
