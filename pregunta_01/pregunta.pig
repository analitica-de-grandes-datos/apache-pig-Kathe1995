/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, numero:int);
renglon = FOREACH data GENERATE letra as word;
grouped = GROUP renglon BY word;
contador = FOREACH grouped GENERATE group, COUNT(renglon);
STORE contador INTO 'output' using PigStorage(',');
