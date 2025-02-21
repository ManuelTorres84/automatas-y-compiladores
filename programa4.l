%option noyywrap
%{
#include <stdio.h>
%}

%%
if      { printf("Palabra reservada: %s\n", yytext); }
else    { printf("Palabra reservada: %s\n", yytext); }
for     { printf("Palabra reservada: %s\n", yytext); }
while   { printf("Palabra reservada: %s\n", yytext); }
return  { printf("Palabra reservada: %s\n", yytext); }
[a-zA-Z]+ { }  // Ignora otras palabras
.|\n       { }  // Ignora otros caracteres
%%

int main() {
    yylex();
    return 0;
}