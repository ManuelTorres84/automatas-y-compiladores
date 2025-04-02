%option noyywrap
%{
#include "y.tab.h"
%}

%%

"INSERT"          { return INSERT; }
"INTO"            { return INTO; }
"VALUES"          { return VALUES; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+            { yylval.str = strdup(yytext); return NUMBER; }
"'"[^']*"'"       { yylval.str = strdup(yytext); return STRING; }
"("               { return LPAREN; }
")"               { return RPAREN; }
","               { return COMMA; }
";"               { return SEMICOLON; }
[ \t\n]           { /* Ignorar espacios en blanco */ }
.                 { printf("Error: Caracter no reconocido '%c'\n", yytext[0]); }

%%

int yywrap() { return 1; }
