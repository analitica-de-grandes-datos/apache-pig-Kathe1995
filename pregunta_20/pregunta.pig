lines = LOAD 'data.csv' USING PigStorage(',');

a= FOREACH lines GENERATE $1, $4;
b= FILTER a BY NOT $1 MATCHES '.*^[bB].*';

STORE b INTO 'output' USING PigStorage(',');
