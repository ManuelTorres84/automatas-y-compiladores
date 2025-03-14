%option noyywrap
%{
#include <stdio.h>
%}

LETRA     [a-zA-Z]
DIGITO    [0-9]
IDENT     {LETRA}({LETRA}|{DIGITO}|"_")*

%%

{IDENT}   { printf("Identificador reconocido: %s\n", yytext); }

[ \t\n]   ;  // Ignorar espacios, tabulaciones y saltos de l�nea
.         ;  // Ignorar cualquier otro car�cter

%%

int main(int argc, char **argv) {
    printf("Ingrese texto: \n");
    yylex();
    return 0;
}