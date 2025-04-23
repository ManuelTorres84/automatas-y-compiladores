%{
#include <stdio.h>
#include <math.h>
void yyerror(const char *s);
int yylex();
%}

union { double num; }

token <num> NUM
token MAS MENOS POR DIV POT PAR_IZQ PAR_DER
token SIN COS TAN

type <num> expresion factor termino potencia trigonometria

left MAS MENOS
left POR DIV
right POT
left SIN COS TAN

%%
