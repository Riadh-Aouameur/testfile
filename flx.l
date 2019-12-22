%option noyywrap
%{
#include "bi.tab.h"
int yyerror(char *ss);
%}
%%
[0-9]+ {
yylval.vale=atoi(yytext);
return NBI;
  
}
[0-9]+\.[0-9]+ {
  yylval.valf=atof(yytext);
return NBF;
  
}
"\n" {return NL;}
"+" {
return ADD;
}
[ \t] ;
"Stop" {
return QUIT;
}


%%
main(){
yyparse();
}
int yyerror(char *ss){
printf("%S \n",ss);
exit(1);
}