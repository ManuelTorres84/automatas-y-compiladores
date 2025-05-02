%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
int             { return INT; }
[a-zA-Z_][a-zA-Z0-9_]*    { yylval.str = strdup(yytext); return ID; }
[0-9]+          { yylval.num = atoi(yytext); return NUM; }
=               { return ASIGNAR; }
\+              { return MAS; }
;               { return PYC; }
[ \t\r\n]+      ; // ignorar espacios y saltos
.               { printf("Error léxico: carácter inválido '%s'\n", yytext); }
%%

int yywrap() { return 1; }