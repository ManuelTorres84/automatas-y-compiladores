%option noyywrap
%{
#include <stdio.h>

// Definir un contador para cada emoci�n
int alegria = 0;
int tristeza = 0;
int enojo = 0;
int miedo = 0;
int sorpresa = 0;
int amor = 0;
%}

// Definir expresiones regulares para las emociones
ALEGRIA     (feliz|contento|alegre|gozo|risa|sonrisa)
TRISTEZA    (triste|dolor|llanto|pena|deprimido)
ENOJO       (enojo|rabia|furia|molesto|irritado)
MIEDO       (miedo|temor|p�nico|aterrado|ansiedad)
SORPRESA    (sorpresa|asombro|impactado|desconcertado)
AMOR        (amor|cari�o|ternura|afecto|adoraci�n)

// Ignorar espacios, tabulaciones y saltos de l�nea
ESPACIO     [ \t\n]

%%

// Reglas para contar emociones
{ALEGRIA}    { alegria++; }
{TRISTEZA}   { tristeza++; }
{ENOJO}      { enojo++; }
{MIEDO}      { miedo++; }
{SORPRESA}   { sorpresa++; }
{AMOR}       { amor++; }
{ESPACIO}    { /* Ignorar espacios */ }
.            { /* Ignorar otros caracteres */ }

%%

// Funci�n principal
int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error al abrir el archivo");
            return 1;
        }
        yyin = file;  // Leer desde el archivo
    }

    yylex();  // Ejecutar el analizador l�xico

    // Mostrar resultados
    printf("Emociones encontradas:\n");
    printf("Alegria: %d\n", alegria);
    printf("Tristeza: %d\n", tristeza);
    printf("Enojo: %d\n", enojo);
    printf("Miedo: %d\n", miedo);
    printf("Sorpresa: %d\n", sorpresa);
    printf("Amor: %d\n", amor);

    if (argc > 1) {
        fclose(yyin);  // Cerrar el archivo
    }

    return 0;
}