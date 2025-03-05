%option noyywrap
%{
#include <stdio.h>
%}

DIGITO    [0-9]
ENTERO    {DIGITO}+

%%

{ENTERO}  { printf("Numero entero reconocido: %s\n", yytext); }

[ \t\n]   ;  // Ignorar espacios, tabulaciones y saltos de línea
.         ;  // Ignorar cualquier otro carácter

%%

int main(int argc, char **argv) {
    printf("Ingrese el número: \n");
    yylex();
    return 0;
}