%{
	#include<stdio.h>
	int count = 0;
%}
keyword "take"|"as"|"valueof"|"if"|"else"|"integer"|"gcd"|"lcm"|"reverce"|"sqrt"|"what"|"is"|"of"|"and"
op "+"|"-"|"*"|"/"|"%"|"="
digit [0-9]
identifiers [a-zA-Z][a-zA-Z0-9]*
notIdentifier [0-9][a-zA-Z0-9]*
integer {digit}+
ob "("
cb ")"
eol ";"
eoq "?"
eop "."

%%
{keyword} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : keyword\n",yytext);}
{op} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : oprator\n",yytext);}
{digit} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : digit\n",yytext);}
{integer} { if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : integer\n",yytext);}
{identifiers} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : identifier\n",yytext);}
{eol} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : enf of line\n",yytext);}
{eop} {if(count == 1) printf("%10s : in comment\n",yytext); else {printf("%10s : end of Program\n",yytext);return 0;}}
{ob} {printf("%10s : starting of comment\n",yytext);count = 1;}
{cb} {printf("%10s : ending of comment\n",yytext);count = 0;}
{eoq} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : enf of question\n",yytext);}
" " {}
{notIdentifier} {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : invalid\n",yytext);}
. {if(count == 1) printf("%10s : in comment\n",yytext); else printf("%10s : invalid\n",yytext);}

%%
int yywrap(){}
int main()
{
	yylex();
	return 0;
}