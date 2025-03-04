%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>
%}

%option noyywrap

%%

[A-Z] { putchar(tolower(yytext[0])); }
.     { putchar(yytext[0]); }

%%

int main() {
    printf("Ingresa un texto:\n");
    yylex();
    return 0;
}
