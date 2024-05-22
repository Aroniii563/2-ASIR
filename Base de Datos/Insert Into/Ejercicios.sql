/*  Borra todos los datos en NOTAS para la alumna Elena Alcaide García y en la asignatura Análisis. */

delete from notas where notas.dni = 
(select alumnos.dni from alumnos where APENOM = 'Alcalde García, Elena')
and cod = (select cod from asignaturas where nombre = 'Análisis');

/* Insertar un nuevo alumno, de nombre Juan Sin Miedo y con DNI:45566778, y 
el resto de los datos, con lo  que quieras. */

insert into alumnos values
('45566778', 'Sin Miedo, Juan', 'C/León', 'Fuenteovejuna', '922584687');

 /* Actualiza la nota de la asignatura RET, con un incremento del 15%, para la alumna María Díaz Fernandez. */

update notas set nota=nota * 1.15 where
dni=(select DNI from alumnos where APENOM='Díaz,Fernández,María')
and cod=(select cod from asignaturas where cod=5);

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
