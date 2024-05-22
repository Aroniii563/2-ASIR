/*  Borra todos los datos en NOTAS para la alumna Elena Alcaide García y en la asignatura Análisis. */

delete from notas where notas.dni = 
(select alumnos.dni from alumnos where APENOM = 'Alcalde García, Elena')
and cod = (select cod from asignaturas where nombre = 'Análisis');
