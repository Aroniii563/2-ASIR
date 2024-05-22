/*  Borra todos los datos en NOTAS para la alumna Elena Alcaide García y en la asignatura Análisis. */

delete from notas where notas.dni = 
(select alumnos.dni from alumnos where APENOM = 'Alcalde García, Elena')
and cod = (select cod from asignaturas where nombre = 'Análisis');

/* Insertar un nuevo alumno, de nombre Juan Sin Miedo y con DNI:45566778, y el resto de los datos, con lo  que quieras. */

insert into alumnos values
('45566778', 'Sin Miedo, Juan', 'C/León', 'Fuenteovejuna', '922584687');
