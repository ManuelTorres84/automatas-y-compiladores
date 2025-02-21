%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-z]*(ae|ai|ao|au)[a-z]*  { printf("Palabra con ae, ai, ao, au: %s\n", yytext); }
%%
%%
int main()
{

	return 0;
}