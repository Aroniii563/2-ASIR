/* Declarar un cursor: */

DECLARE cursor_name CURSOR FOR SELECT column1, column2, ... FROM table_name WHERE conditions;
/* Abrir cursor: */

OPEN cursor_name; /* Esto ejecutará la consulta y preparará el cursor para su uso. */

/* Recuperar la Primera fila */

FETCH cursor_name INTO variable1, variable2, ...; /* las variables son donde se almacenarán los valores de la primera fila recuperada. Debes declarar estas variables previamente. */

/* Procesar las filas: */

WHILE (condition) DO

    -- procesamiento de la fila actual

    FETCH cursor_name INTO variable1, variable2, ...;

END WHILE;
