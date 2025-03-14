%{
#include <stdio.h>
#include <stdlib.h>
extern int yylval;
int yylex(void);
%}

%token NUMBER

%%

expr:    expr '+' term       { printf("%d\n", $1 + $3); }
        | expr '-' term       { printf("%d\n", $1 - $3); }
        | term                { $$ = $1; }
        ;

term:    term '*' factor     { $$ = $1 * $3; }
        | term '/' factor     { $$ = $1 / $3; }
        | factor              { $$ = $1; }
        ;

factor:  NUMBER              { $$ = yylval; }
        ;

%%

int main() {
    printf("Ingrese una expresión: ");
    yyparse(); 
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
