/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
lines = LOAD 'data.csv' USING PigStorage(',');

a= FOREACH lines GENERATE $1, $4;
b= FILTER a BY NOT $1 IN ('blue','black');

STORE b INTO 'output' USING PigStorage(',');
