%option noyywrap
%{
#include <stdio.h>
%}

DIGITO [0-9]

%%
{DIGITO}+                  { printf("Entero: %s\n", yytext); }
{DIGITO}+"."{DIGITO}+      { printf("Decimal: %s\n", yytext); }
.|\n                       { }  // Ignora otros caracteres
%%

int main() {
    yylex();
    return 0;
}