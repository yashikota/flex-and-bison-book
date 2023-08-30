%%
"perfect" { printf("完璧"); }
"good" { printf("上等"); }
"ok" { printf("良い"); }
"bad" { printf("駄目"); }
"ng" { printf("不可"); }
. { printf("%s", yytext); }
%%
