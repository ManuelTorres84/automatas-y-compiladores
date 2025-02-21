%option noyywrap
%{
#include <stdio.h>
%}

%%
00[01]*|([01]*00) { printf("Cadena válida: %s\n", yytext); }
[01]+             { }  // Ignora otras cadenas binarias
.|\n              { }  // Ignora otros caracteres
%%

int main() {
    yylex();
    return 0;
}