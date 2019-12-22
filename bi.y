%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char *s);


%}
%union{

int vale;
float valf;
}
%token<vale> NBI
%token<valf> NBF
%token QUIT NL
%token ADD 
%left ADD
%type<vale> expression
%type<valf> expressionf
%start calcul
%%
calcul :
       |exp NL;
exp : NL
    |expression NL {printf("Result =  %i \n ",$1);}
    |expressionf NL {printf("Result =  %f \n ",$1);}
    |QUIT
    ;

expression : NBI {$$ =$1;}
           | expression ADD expression	{$$=$1+$3;}
           ;

expressionf : NBF {$$=$1;}
           | expressionf ADD expressionf {$$=$1+$3;}
           | expressionf ADD expression {$$=$1+$3;}
           | expression ADD expressionf {$$=$1+$3;}
           ;



%%






