%{
#include "y.tab.h"
%}

%option noyywrap

IF      if
THEN    then
ID      [a-zA-Z_][a-zA-Z0-9_]*
NUM     [0-9]+
OP      [<>=!]=?
WS      [ \t\n]

%%

{IF}    { return IF; }
{THEN}  { return THEN; }
{ID}    { return ID; }
{NUM}   { return NUM; }
{OP}    { return OP; }
{WS}    { /* ignorar espacios en blanco */ }
.       { printf("Error léxico: %s\n", yytext); return 0; }

%%
