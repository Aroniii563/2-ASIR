# Prueba 1 de Tablas:

Realizar una base de datos de Fogasa con tres tablas.

## Tablas:

Las tablas se llamarán:

- Empresario.
- Tramite.
- Empleado.

## Empresario:

La tabla "Empresario" estará compuesta por:

	1. Un DNI, el cual será la clave primaria, con un tamaño de nueve caracteres y, olbigatoriamente, se deberá rellenar el campo.
	2. Un Nombre con un tamaño de 50 caracteres y obligatorio.
	3. Dos campos apellido: Apellido1 y Apellido2, en los cuales los dos tienen un tamaño de 20 caracteres. Además, el primer apellido sera obligatorio.
	4. Por último, un campo Telefono también obligatorio.

 ## Tramite:

 La tabla "Tramite" estará compuesta por:

 	1. Un campo Deuda de valor numerico y obligatorio.
	2. Un campo Plazo, el cual deberá ser checkeado siendo este menor a 365.
	3. Añadir una clave foranea haciendo referencia al DNI del empresario.
	4. Y que al actualizar una tabla se actualicen las demas.

 ## Empleado:

 La tabla "Empleado" estará compuesta por:

	1. Un DNI, el cual será la clave primaria, con un tamaño de nueve caracteres y, olbigatoriamente, se deberá rellenar el campo. Pero añadir al final de la tabla (  segunda manera de insertar una clave primaria).
	2. Un Nombre con un tamaño de 100 caracteres y obligatorio.
	3. Dos campos apellido: Apellido1 y Apellido2, en los cuales los dos tienen un tamaño de 20 caracteres. Además, el primer apellido sera obligatorio.
	4. Por último, un campo Telefono también obligatorio.

 ## Alteraciones en las tablas:

 Antes de acabar hay que corregir y modificar algunas cosas en las tablas, las cuales son:

 	1. Añadir una clave foranea en "Trramite" haciendo referencia al DNI del empresario.
	2. Añadir una clave primaria a la tabla "Tramite" llamada: CodigoTramite, y obligatoria.
	3. Añadir a "Tramite" una nueva columna llamada: FechaTramite, y obligatoria.
	4. Modificar en la tabla "Empleado" el Nombre para que el máximo de caracteres sea "50".

 ## Como subir la prueba:

 Una vez acabes la prueba, subir el archivo "SQL" con tu nombre.

 - Cualquier duda preguntar.

Buena suerte 🥵.
