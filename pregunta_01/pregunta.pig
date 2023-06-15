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
data = LOAD 'data.tsv' AS (l:chararray, fecha:chararray, n:int);
registro = FOREACH data GENERATE l as palabra;
grouped = GROUP registro BY palabra;
contador = FOREACH grouped GENERATE group, COUNT(registro);
STORE contador INTO 'output' using PigStorage(',');
