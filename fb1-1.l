%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. { chars++; }
%%

main() {
    yylex();
    printf("lines = %8d, words = %8d, chars = %8d\n", lines, words, chars);
}
