%{
#include <stdio.h>
//#include <stdlib.h>
//%nonassoc EQ
/*
expr statament mudei de : para ;

void impressao (){
    fprintf(stderr, "line: %d, lexema: %s\n", yylineno, yytext);    
}

//#define YYDEBUG 1

*/
#include "y.tab.h"

int yylex ();
int yylineno;
char *yytext;

void yyerror(const char* msg) {
    fprintf(stderr, "%s, line: %d, lexema: %s\n", msg, yylineno, yytext);
}

%}

%token ID
%token STRING
%token NUM
%token TYPE
%token EQ
%token LT
%token LTE
%token T_atrib
%token T_impl
%token T_true
%token T_false
%token T_class
%token T_else
%token T_while
%token T_if
%token T_fi
%token T_then
%token T_inherits
%token T_isvoid
%token T_new
%token T_not
%token T_pool
%token T_loop
%token T_let
%token T_case
%token T_esac
%token T_of
%token T_in
%token ERROR

%left T_isvoid
%right T_atrib
%left T_in
%left T_not
%left '+' '-'
%left '*' '/'
%left EQ
%left LTE
%left LT 
%left '@'
%left '.'


%% 

program 
:classes
;

classes
:class';'
|classes class';'
;

class
: T_class TYPE opt_inherits '{' features '}'
;

opt_inherits
: /* */
| T_inherits TYPE
;

features
: /* */
| features feature ';'
;

feature
: ID '(' ')' ':' TYPE '{' expr '}'
| ID '(' formal_list ')' ':' TYPE '{' expr '}'
| ID ':' TYPE
| ID ':' TYPE T_atrib expr
;

formal_list
: ID ':' TYPE
| formal_list ',' ID ':' TYPE
;

expr
: ID T_atrib expr
| expr '.' ID '(' ')'
| expr '@' TYPE '.' ID '(' ')'
| expr '.' ID '(' expr_list ')'
| expr '@' TYPE '.' ID '(' expr_list ')'
| ID '(' ')'
| ID '(' expr_list ')' 
| T_if expr T_then expr T_else expr T_fi
| T_while expr T_loop expr T_pool
| '{' expr_stmt '}'
| T_let ID ':' TYPE let_atrib let_stmt T_in expr
| T_case expr T_of case_stmt T_esac 
| T_new TYPE
| T_isvoid expr
| expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| expr EQ expr
| expr LT expr
| expr LTE expr
| T_not expr
| '(' expr ')'
| ID
| NUM
| STRING
| T_true
| T_false
| T_let
;

expr_list
: expr
| expr_list ',' expr 
;

expr_stmt
: expr ';'
| expr_stmt expr ';'
;

let_atrib
:/* */
| T_atrib expr
;

let_stmt
: /* */
| ',' ID ':' TYPE let_atrib let_stmt
;

case_stmt
: ID ':' TYPE T_impl expr ';'
| case_stmt ID ':' TYPE T_impl expr ';'
;

%%


int main(void){
    if(!yyparse()) {
        printf("\n----------------------------\n");
        printf("Parse Realizado com Sucesso");
        printf("\n----------------------------\n");
    }
    return 0;
}


