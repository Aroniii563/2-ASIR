/* Los tipos de datos que se pueden usar para definir una columna son: */


/* --NUMEROS ENTEROS-- */

TINYINT: /* Un codigo con pocos numeros */
SMALLINT: /* Un codigo con mas numeros que "TINYINT" */
INT: /* Numeros enteros, permite muchos numeros */
BIGINT: /* Mayor cantidad de numeros que "INT" */
INTEGER: /* Es igual que "INT" */

/* --NUMEROS APROXIMADOS-- */

DOUBLE: /* Numeros con muchos decimales, y pueden ser numeros negativos */
FLOAT: /* Es igual que "DOUBLE", pero este permite numeros mayores */

/* --NUMEROS DECIMALES-- */

DECIMAL: /* Numeros decimales */
NUMERIC: /* Funcionalmente es igual que "DECIMAL" */

/* --HORAS Y FECHAS-- */

DATE: /* Para insertar la fecha */
TIME: /* Para insertar la hora */
TIMESTAMP: /* Para insertar fecha y hora */
DATETIME: /* Igual que "TIMESTAMP" */

/* --TEXTO-- */

VARCHAR: /* Longitud de caracteres que puede variar */
CHAR: /* Longitud fija de caracteres */
