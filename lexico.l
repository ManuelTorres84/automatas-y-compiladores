%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h"  /* ¡Incluir el archivo generado por Yacc! */
%}

%%

[ \t]   ; /* Ignorar espacios */
\n      return 0; /* Fin de entrada */
[0-9]+(\.[0-9]+)?  { yylval.num = atof(yytext); return NUM; }
"+"     return MAS;
"-"     return MENOS;
"*"     return POR;
"/"     return DIV;
"^"     return POT;
"("     return PAR_IZQ;
")"     return PAR_DER;
"sin"   return SIN;
"cos"   return COS;
"tan"   return TAN;
.       yyerror("Caracter no válido");

%%

int yywrap() { return 1; }