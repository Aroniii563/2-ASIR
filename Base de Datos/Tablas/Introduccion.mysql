/* Para crear una base de datos */
CREATE DATABASE ejemplo

/* Siempre poner que va a usar */
USE ejemplo;

/* Para crear una tabla */
CREATE TABLE empleados(
    /* nombre_tabla, definicion_create, definicion_columna */
    CodigoEmpleado INT PRIMARY KEY NOT NULL, /* Int: para insertar números enteros */
    Nombre VARCHAR(50) NOT NULL, /* Varchar: para insertar letras */
    Apellido1 VARCHAR, /* Si no se pone "NOT NULL" se indica que es opcional */
    /* Para insertar una "FOREIGN KEY" de otra tabla hay dos maneras: desde la tabla o con un alter */
    CodigoPedido INT NOT NULL,
    FOREIGN KEY (CodigoPedido) REFERENCES pedidos (CodigoPedido)
    ON DELETE SET NULL /* Se borra la indicacion de borrar la clave foranea */
);

CREATE TABLE pedidos(
    CodigoPedido INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    /* Decimal: para insertar números decimales */
    /* CHECK: realiza restrincciones sobre la columna */
    Precio DECIMAL(10,2) NOT NULL CHECK(precio > 0) /* En este caso el pecio debe ser mayor que 0 */
    ON UPDATE CASCADE /* Actualiza la tabla en cascada, si se modifica algo afecta a su tabla hija */
    ON UPDATE NO ACTION /* Actualiza la tabla para impedir el borrado o actualizacion */
);

/* Otra manera de crear una "PRIMARY KEY" es (permite crear claves primarias compuestas): */
CREATE TABLE pedidos(
    CodigoPedido INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK(precio > 0),
    PRIMARY KEY (CodigoPedido) /* De esta manera indicas que la columna "CodigoPedido" es la clave primaria */ 
);


/* --MODIFICACION DE TABLAS-- */


/* Para añadir una nueva columna */
ALTER TABLE pedidos ADD FechaPedido DATE NOT NULL;

/* Renombrar una columna */
ALTER TABLE empleados RENAME Apellido1 Apellidos;

/* Modficiar una columna */
ALTER TABLE pedidos MODIFY Nombre VARCHAR(50);

/* Eliminar una columna */
ALTER TABLE pedidos DROP COLUMN FechaPedido;

/* Eliminar una clave primaria o foranea */
ALTER TABLE empleados DROP CONSTRAINT ID PRIMARY KEY;
ALTER TABLE empleados DROP CONSTRAINT ID FOREIGN KEY CodigoPedido;

/* Añadir una clave primaria o foranea */
ALTER TABLE empleados ADD CONSTRAINT ID PRIMARY KEY CodigoEmpleado INT;
ALTER TABLE empleados ADD FOREIGN KEY (CodigoPedido) REFERENCES pedidos (CodigoPedido);
