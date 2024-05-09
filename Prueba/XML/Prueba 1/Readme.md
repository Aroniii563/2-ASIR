# Prueba 1 de XML:

Crear un archivo DTD y XSD de un instituto.

<br>

## Instituto:

El instituto deberá tener como mínimo 3 alumnos con código propio, y 2 profesores con código propio también.

- La estructura debe ser:

```xml
<Instituto>
	<Alumno></Alumno>
	<Profesor></Profesor>
 </Instituto>
```

<br>

## Alumno:

Cada alumno deberá tener:

- Nombre (con identificador opcional llamado: DNI)
- Apellidos
- Telefono
- Sexo (se deberá indicar con M o H)
- Tutor (hace referencia a un profesor existente en el archivo)
- Modalidad (atributo con tres opciones de bachillerato)

## Profesor:

Cada profesor deberá tener:

- Nombre (con identificador opcional llamado: DNI)
- Apellidos
- Telefono
- Sexo (se deberá indicar con M o H)
- Año en el que comenzó la enseñanza (no más de 4 digitos)

<br>

## Resultado:

Deberá quedar el archivo XML más o menos de la siguiente manera:

```xml
<Instituto>
	<Alumno codigo="">
		<Nombre dni=""></Nombre>
		<Apellidos></Apellidos>
		<Telefono></Telefono>
		<sexo>H</sexo>
		<Tutor id=""/>
		<Modalidad bachillerato="">2ºBach</Modalidad>
	</Alumno>
	<Profesor codigo="">
		<Nombre dni=""></Nombre>
		<Apellidos></Apellidos>
		<Telefono></Telefono>
		<sexo>M</sexo>
		<Enseñanza>2003</Enseñanza>
	</Profesor>
 </Instituto>
```
<br>

## Como subir la prueba:

Si solo tienes que recuperar uno de los temas subes el archivo con tu nombre, pero si tienes que recuperar los dos subes una carpeta con los archivos; y que la carpeta tenga tu nombre.

- Si tienes alguna duda pregunta.

Buena suerte 🦾.
