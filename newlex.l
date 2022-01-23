%{
	#include<stdio.h>
%}
keyword "what"|"is"|"of"|"and"
op "gcd"|"lcm"|"reverce"|"sqrt"
digit [0-9]
integer {digit}+
eoq "?"

%%
{keyword} { printf("%10s : keyword\n",yytext);}
{op} { printf("%10s : oprator\n",yytext);}
{digit} { printf("%10s : digit\n",yytext);}
{integer} {  printf("%10s : integer\n",yytext);}
{eoq} { printf("%10s : enf of question\n",yytext);return 0;}
" " {}
. { printf("%10s : invalid\n",yytext);}

%%
int yywrap(){}
int main()
{
	yylex();
	return 0;
}