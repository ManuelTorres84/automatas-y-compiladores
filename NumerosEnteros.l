%option noyywrap
%{
#include <stdio.h>
%}

DIGITO    [0-9]
ENTERO    {DIGITO}+

%%

{ENTERO}  { printf("Numero entero reconocido: %s\n", yytext); }

[ \t\n]   ;  // Ignorar espacios, tabulaciones y saltos de l�nea
.         ;  // Ignorar cualquier otro car�cter

%%

int main(int argc, char **argv) {
    printf("Ingrese el n�mero: \n");
    yylex();
    return 0;
}