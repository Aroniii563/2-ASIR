-- 18# Mostrar los nombres y apellidos de los empleados y el numero de empleados de los que es jefe.
select empleados.nombre, empleados.apellidos, count(emp.idempleado) from empleados left join empleados emp on empleados.idempleado=emp.jefe group by empleados.idempleado;

-- 19# Mostrar los nombres y apellidos de los empleados y el numero de empleados de los que es jefe mostrando sólo los que tienen empleados a su cargo.
select empleados.nombre, empleados.apellidos from empleados left join empleados emp on empleados.idempleado=emp.jefe where emp.jefe is not null;

-- 20# Mostrar los nombres y apellidos de los empleados que no tienen empleados a su cargo. No son jefes.
{
select nombre, apellidos from empleados where idempleado not in (select distinct jefe from empleados where jefe is not null);
-- con subconsulta.
select empleados.nombre, empleados.apellidos from empleados left join empleados emp on empleados.idempleado=emp.jefe where emp.jefe is null;
-- con consulta externa.

-- Crear una vista de la consulta para finalidades de seguridad:
create view nojefes as select empleados.nombre, empleados.apellidos from empleados left join empleados emp on empleados.idempleado=emp.jefe where emp.jefe is null;
select * from neptuno.nojefes;
}

-- 21# Mostrar los nombres y apellidos de los empleados y el número de pedidos que ha atendido.
select nombre, apellidos, count(idpedido) from empleados inner join pedidos on empleados.idempleado=pedidos.idempleado group by empleados.idempleado;

-- 22# Mostrar los nombres y apellidos de los empleados y el número de pedidos que ha atendido, de los empleados que han atendido más de 100 pedidos.
select nombre, apellidos, count(idpedido) from empleados inner join pedidos on empleados.idempleado=pedidos.idempleado group by empleados.idempleado having count(*)>100;

-- 23# Mostrar los nombres y apellidos de los empleados y el importe total de los pedidos que ha atendido.
select empleados.idempleado, concat(empleados.apellidos, ", ", empleados.nombre) as Empleado, round(sum(Cantidad*PrecioUnidad),2) as importe_total from empleados
inner join pedidos on empleados.idempleado=pedidos.idempleado inner join Detalles_de_pedidos on pedidos.idpedido=Detalles_de_pedidos.idpedido group by idempleado;

-- 24# Mostrar los nombres y apellidos de los empleados y el importe total de los pedidos que ha atendido de la categoría 1.
select empleados.idempleado, concat(empleados.apellidos, ", ", empleados.nombre) as Empleado, round(sum(Cantidad*Detalles_de_pedidos.PrecioUnidad),2) as importe_total from 
empleados inner join pedidos on empleados.idempleado=pedidos.idempleado inner join Detalles_de_pedidos on pedidos.idpedido=Detalles_de_pedidos.idpedido inner join productos 
on Detalles_de_pedidos.idproducto=productos.idproducto where idcategoria=1 group by idempleado;

-- 25# Mostrar los nombres y apellidos de los empleados y el año de nacimiento de los empleados nacidos antes de 1960.
select empleados.nombre, empleados.apellidos, year(empleados.fechanacimiento) as añito from empleados where year(empleados.fechanacimiento)<1960;
-- apellido = Buchanan:
select nombre, apellidos, fechanacimiento from empleados where fechanacimiento > (select fechanacimiento from empleados where apellidos='Buchanan');

-- BASE DE DATOS ACADEMIA:

--  1.- Visualizar el nombre de los alumnos que no tienen matricula libre en ningún curso. (El dni del alumno no puede estar en ninguna matricula libre, en otras si)
-- Recomendación: usar subconsulta para sacar el dni de las matriculas libres). Aclaración: hay un campo de nombre "tipo" en la tabla matrículas que puede tomar uno de los dos valores Libre y Oficial.
select nombre from alumnos where dni not in
(select distinct dnialumno from Acadameia.matriculas where tipo="Libre");

--  2.-Visualizar los cursos que no tienen alumnos matriculados. Recomendación: usar subconsulta para sacar los códigos de cursos que aparecen en matriculas
select nombrecurso from cursos left join matriculas on cursos.codigocurso=matriculas.codcurso where dnialumno is null;

-- 3.- Visualizar los nombres de los alumnos que estén matriculados en más de 2 cursos (hay que usar having)
select nombre from alumnos inner join matriculas on alumnos.dni=matriculas.dnialumno group by nombre having count(codcurso)>2;
