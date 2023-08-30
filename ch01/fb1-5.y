%{
#include <stdio.h>
#include <stdlib.h>
#include "fb1-5.tab.h"
%}

%token NUMBER
%token ADD SUB MUL DIV ABS AND NOT
%token OP CP
%token EOL

%%

calclist:
    | calclist exp EOL { printf("= %d\n", $2); }
    | calclist EOL { } // empty line
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    | exp ABS factor { $$ = $1 | $3; }
    | exp AND factor { $$ = $1 & $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term: NUMBER
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    | OP exp CP { $$ = $2; }
    ;

%%

main() {
    yyparse();
}

yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
