%option noyywrap
%{
#include <stdio.h>
#include "y.tab.h"  
extern int yylval;
int yywrap() { return 1; }
%}

%%

[0-9]+        { yylval = atoi(yytext); return NUMBER; }   
[+\-*/]        { return yytext[0]; }                      
[ \t\n]         { }                                         
.               { return yytext[0]; }                      

%%

int main() {
    printf("Ingrese una expresión: ");
    yylex();  
    return 0;
}
