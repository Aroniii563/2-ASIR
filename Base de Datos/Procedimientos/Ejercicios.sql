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

/* Una funcion para saber si es mayor de edad */

delimiter //
create function mayor_edad (edad int)

returns int deterministic 

begin

	declare mayor int;
    
	if edad >= 18
		
	then 
        
		set mayor = 1;
        
	else 
    
		set mayor = 0;
    
    end if;
    
    return mayor;
    
end //

delimiter ;

/* Procedimiento que actualice la tabla categorías recibiendo como parámetros los 
3 datos de los 3 campos, el código de la categoría para filtrar en la actualización, y los 
otros dos campos para modificar(nombrecategoria y estado). Controlar si el código de
la categoría no existe. ( Con uso de if exists (select...) then  update .. else  select ".." end). 
Se usarán 3 parámetros IN. Poner start transaction antes del update del procedimiento. */

delimiter //
create procedure ejercicio2 (in cod int, in nom varchar(50), in est char(1))

begin
	
    if not exists (select * from categorias where codcategoria = cod)
    
		then select "No eixste el producto";
		
        else
			start transaction;
			update categorias set nom_categoria = nom, estado = est where codcategoria = cod;
			
	end if;
    
end //

delimiter 

/* Realizar una función que enviando, como parámetro IN, el código del producto 
nos retorne el precio. Si el producto no existe retornará un 0.  (El precio a retornar 
depende de si está ese producto en oferta o no.) Hay que seguir usando los if y retorna el precio. */

delimiter //
create function ejercicio3 (cod int)
returns double deterministic

begin

	declare precio double;		
	if exists (select * from productos where codproducto = cod)    
		then         
			if ((select oferta from productos where codproducto = cod) = 'SI')
				then				
					select precio_oferta into precio from productos where codproducto = cod;
				else
					select precio_normal into precio from productos where codproducto = cod;
			end if;  	
	else
		set precio = 0;
    end if;    
    return precio;
    
end //

delimiter ;

/* Crea un procedimiento, de nombre Mejores, que muestre los nombres y las notas de los 2 mejores
alumnos, de la asignatura (como código) que se pase por parámetro al procedimiento. Controlar si 
el código que se pasa existe o no. */

delimiter //
create procedure Mejores (in c int)
begin
	if exists (select * from notas where cod = c)
    then
		select apenom, nota from notas inner join alumnos on
		notas.dni = alumnos.dni where cod = c order by nota desc limit 2;
	else 
		select 'El código introducido no existe';
	end if;
end //
delimiter
