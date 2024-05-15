-- Base de Datos

create database empleados;
use empleados;

create table datos(
nombre varchar(50) primary key,
salario decimal(10,2),
servicio int

);

INSERT INTO datos (nombre, salario, servicio) VALUES
('Juan', 1500.00, 2),

('María', 2000.00, 3),

('Pedro', 1800.00, 1),

('Luisa', 2500.00, 5),

('Ana', 1700.00, 1),

('Mario', 2200.00, 4),

('Elena', 1900.00, 2),

('Carlos', 2800.00, 6);


-- Cursor:

DELIMITER //
CREATE PROCEDURE aumentar_salarios()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE nom VARCHAR(50);
  DECLARE sal DECIMAL(10,2);
  DECLARE anios INT;
  DECLARE cur CURSOR FOR SELECT nombre, salario, servicio FROM datos;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  
  OPEN cur;
  recorrer: LOOP
    FETCH cur INTO nom, sal, anios;
    IF done THEN
      LEAVE recorrer;
    END IF;
    SET sal = sal * (1 + (anios* 0.05));    
    UPDATE datos SET salario = sal WHERE  nombre=nom;
   END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- Función:

DELIMITER //
CREATE PROCEDURE actualizar_columna_edad_Aaron()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE cod int unsigned;
  declare fecha date;
  declare ed int;
  DECLARE cur CURSOR FOR SELECT id, fecha_nacimiento FROM alumnos_Aaron;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  
  open cur;
  Aaron_loop: LOOP
  fetch cur into cod, fecha;
  if done then
	leave Aaron_loop;
  end if;
  update alumnos_Aaron set edad = calcular_edad_Aaron(fecha)
  where id = cod;
  end LOOP;
  close cur;
  
end //
delimiter ;
