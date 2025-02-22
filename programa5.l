%option noyywrap
%{
#include <stdio.h>
%}

LETRA [a-zA-Z]

%%
[a-z]{LETRA}* { printf("Nombre propio: %s\n", yytext); }
{LETRA}+      { }  // Ignora otras palabras
.|\n          { }  // Ignora otros caracteres
%%

int main() {
    yylex();
    return 0;
}