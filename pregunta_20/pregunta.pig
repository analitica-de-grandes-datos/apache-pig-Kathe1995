data= LOAD 'data.csv' USING PigStorage(',') AS (c1:int, firstname:chararray, c3:chararray, c4:chararray, color:chararray, c6:int);
data_1= FOREACH data GENERATE firstname, color;
data_2= FILTER data_1 BY color == '^[^b]';
STORE data_2 INTO 'output' USING PigStorage(',');
