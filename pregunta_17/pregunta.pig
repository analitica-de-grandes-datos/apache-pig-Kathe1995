lines = LOAD 'data.csv' USING PigStorage(',');

a= FOREACH lines GENERATE $1, $4;
b= FILTER a BY $0 == 'blue' OR $0 == 'black';

STORE b INTO 'output' USING PigStorage(',');
