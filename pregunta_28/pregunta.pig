/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (N:int,
                                                name:chararray,
                                                lastname:chararray,
                                                date:chararray,
                                                color:chararray,
                                                number:int);
sub_data = FOREACH data GENERATE REGEX_EXTRACT(date, '^([0-9]*)-.*',1), REGEX_EXTRACT(date, '^[0-9][0-9]([0-9]*)-.*',1);
STORE sub_data INTO 'output' using PigStorage(',');

