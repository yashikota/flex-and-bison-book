%{
# include "fb1-5.tab.h"
int yylval;
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP; }
")" { return CP; }
"&" { return AND; }
0x[a-f0-9]+ { yylval = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return EOL; }
"//".* { } /* ignore comments */
[ \t] { } /* ignore whitespace */
. { printf("Mystery character %c\n", *yytext); }
%%
