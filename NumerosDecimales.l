%option noyywrap
%{
#include <stdio.h>
%}

DIGITO    [0-9]
DECIMAL   {DIGITO}+"."{DIGITO}+

%%

{DECIMAL} { printf("Numero decimal reconocido: %s\n", yytext); }

[ \t\n]   ;  // Ignorar espacios, tabulaciones y saltos de l�nea
.         ;  // Ignorar cualquier otro car�cter

%%

int main(int argc, char **argv) {
    printf("Ingrese el numero: \n");
    yylex();
    return 0;
}