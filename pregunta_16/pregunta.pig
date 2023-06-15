lines = LOAD 'data.csv' USING PigStorage(',');

a= FOREACH lines GENERATE $1,$4;
b= FILTER a BY $0 MATCHES '.*^[kK].*' OR $1 == 'blue';

STORE b INTO 'output' USING PigStorage(',');
