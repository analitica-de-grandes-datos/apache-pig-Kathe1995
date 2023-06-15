A = LOAD './data.csv' using PigStorage(',')
     AS (num:int, name:chararray, LASTNAME:chararray, time:chararray, color:chararray, otre:int);
B = FOREACH A GENERATE color;
C = FILTER B BY ($0 matches '.*b.*');

DUMP B;

STORE C INTO 'output/' using PigStorage(',');
