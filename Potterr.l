%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int potter_count = 0; 
int poter_count = 0;  
int token_count = 0;  
int yylex();
%}

%%
Potter { 
    potter_count++; 
    printf("%s", yytext);
}
Poter { 
    poter_count++; 
    printf("Potter"); 
}
[a-zA-Z]+ { 
    token_count++; 
    printf("%s", yytext);
}
. { 
    putchar(yytext[0]); 
}

%%

int main() {
    yylex(); // Iniciar análisis léxico
    printf("\nTotal de tokens identificados: %d\n", token_count);
    printf("La palabra 'Potter' aparecio %d veces.\n", potter_count);
    printf("La palabra 'Poter' (corregida) aparecio %d veces.\n", poter_count);
    return 0;
}