%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

typedef struct {
    char nombre[50];
} Variable;

Variable tabla[100];
int contador = 0;

int existe(char *nombre) {
    for (int i = 0; i < contador; i++) {
        if (strcmp(tabla[i].nombre, nombre) == 0)
            return 1;
    }
    return 0;
}

void insertar(char *nombre) {
    if (existe(nombre)) {
        printf("Error semántico: variable '%s' ya declarada\n", nombre);
    } else {
        strcpy(tabla[contador].nombre, nombre);
        contador++;
    }
}

void usar(char *nombre) {
    if (!existe(nombre)) {
        printf("Error semántico: variable '%s' no declarada\n", nombre);
    }
}
%}

%union {
    int num;
    char *str;
}

%token <str> ID
%token <num> NUM
%token INT
%token ASIGNAR MAS PYC

%type <str> declaracion
%type <str> asignacion
%type <str> expresion

%%

programa:
        lista_sentencias
        ;

lista_sentencias:
        lista_sentencias sentencia
        | sentencia
        ;

sentencia:
        declaracion PYC
        | asignacion PYC
        ;

declaracion:
        INT ID {
            insertar($2);
        }
        ;

asignacion:
        ID ASIGNAR expresion {
            usar($1);
        }
        ;

expresion:
        ID {
            usar($1);
        }
        | NUM
        | expresion MAS expresion
        ;

%%

void yyerror(const char *s) {
    printf("Error sintáctico: %s\n", s);
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        perror("No se pudo abrir el archivo");
        return 1;
    }

    yyin = archivo;
    yyparse();
    fclose(archivo);
    return 0;
}