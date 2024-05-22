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
