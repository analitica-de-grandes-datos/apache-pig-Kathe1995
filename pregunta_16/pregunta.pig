A = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
B = FILTER A BY (name matches 'K.*') or (color matches 'blue');
C = FOREACH B GENERATE name, color;
STORE C INTO 'output/' using PigStorage(',');
