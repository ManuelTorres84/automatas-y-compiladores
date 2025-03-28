%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
void yyerror(const char *s);
%}

%union {
    int num;
    char *id;
}

%token IF THEN ELSE LBRACE RBRACE LPAREN RPAREN SEMICOLON
%token <num> NUMBER
%token <id> IDENTIFIER

%%

program:
    | program statement
    ;

statement:
    if_statement
    ;

if_statement:
    IF LPAREN condition RPAREN THEN LBRACE statements RBRACE
    | IF LPAREN condition RPAREN THEN LBRACE statements RBRACE ELSE LBRACE statements RBRACE
    ;

condition:
    expression
    | expression '>' expression
    | expression '<' expression
    | expression "==" expression
    | expression "!=" expression
    ;

expression:
    NUMBER
    | IDENTIFIER
    ;

statements:
    | statements statement
    | statements expression SEMICOLON
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error de sintaxis: %s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("No se pudo abrir el archivo %s\n", argv[1]);
        return 1;
    }
    
    if (yyparse() == 0) {
        printf("La estructura if...then... es correcta!\n");
    }
    
    fclose(yyin);
    return 0;
}