/*
* GRUPO 4:
   - LUCAS MOREIRA PIRES
   - VINICIUS TEIXEIRA MACEDO
   - RAFAEL SOUZA COIMBRA
*/

%{
/* includes, C defs */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "ast.h"

struct decl *parser_result;

extern int yylineno;
int yylex();
void yyerror(const char *s);

%}

%union{
    struct decl *decl;
    struct stmt *stmt;
    struct expr *expr;
    struct type *type;
    struct param_list *plist;
    char *name;
    int d;
}

%define parse.error verbose
%expect 1

/* declare tokens */
%token <d> NUM
%token <name> ID
%token ELSE
%token IF
%token INT
%token RETURN
%token VOID
%token WHILE
%token CONST
%token ENUM
%token EQ
%token NEQ
%token LT
%token GT
%token LTEQ
%token GTEQ
%token INC
%token DEC
%token AND
%token OR
%token NOT
%token ERROR

%nonassoc EQ
%nonassoc NEQ
%nonassoc LT
%nonassoc GT
%nonassoc LTEQ
%nonassoc GTEQ
%nonassoc INC
%nonassoc DEC
%nonassoc AND
%nonassoc OR
%nonassoc NOT


%type <decl>  program
%type <decl>  declaration-list declaration
%type <decl>  var-declaration fun-declaration const-declaration enum_declaration //
%type <plist> enumerator_list enume
%type <decl>  local-declarations
%type <type>  type-specifier
%type <plist> params param-list param
%type <stmt>  compound-stmt
%type <stmt>  statement-list statement
%type <stmt>  selection-stmt iteration-stmt return-stmt
%type <stmt>  expression-stmt
%type <expr>  expression simple-expression
%type <expr>  conditional-expression-and conditional-expression-or
%type <expr>  additive-expression factor term call var
%type <expr>  args args-list

%start program

%%

program: declaration-list { parser_result = $1; $$ = $1; }
;

declaration-list:
  declaration-list declaration { $$ = insert_decl($1,$2); }
| declaration { $$ = $1; }
;

declaration:
  var-declaration
| fun-declaration
| enum_declaration
;

var-declaration:
  type-specifier ID ';'             { $$ = var_decl_create($2,$1); }
| type-specifier ID '[' NUM ']' ';' { $$ = array_decl_create($2,$1,$4); }
;

fun-declaration:
  type-specifier ID '(' params ')' compound-stmt
  { $$ = func_decl_create($2,$1,$4,$6); }
;

enum_declaration:
  ENUM ID '{' enumerator_list '}' ';' { $$ = enum_type_create($2, $4); }
| ENUM ID ID ';' { $$ = enum_var_decl_create($2,$3); }
;

enumerator_list:
  enumerator_list ',' enume { $$ = insert_param($1,$3); }
| enume { $$ = $1; }
;

enume:
  ID { $$ = enum_param_create($1); }
;


type-specifier:
  INT  { $$ = type_create(TYPE_INTEGER,0,0); }
| VOID { $$ = type_create(TYPE_VOID,0,0); }
;


params:
  param-list
| VOID { $$ = (struct param_list *) 0; }
;

param-list:
  param-list ',' param  { $$ = insert_param($1,$3); }
| param { $$ = $1; }
;

param:
  type-specifier ID { $$ = param_create($2,$1); }
| type-specifier ID '[' ']' { $$ = param_array_create($2,$1); }
;


compound-stmt:
  '{' local-declarations statement-list '}'
        { $$ = compound_stmt_create(STMT_BLOCK,$2,$3); }
| '{' local-declarations '}'
        { $$ = compound_stmt_create(STMT_BLOCK,$2,0); }
| '{' statement-list '}'
        { $$ = compound_stmt_create(STMT_BLOCK,0,$2); }
| '{' '}'
        { $$ = compound_stmt_create(STMT_BLOCK,0,0); }
;

local-declarations:
  var-declaration { $$ = $1; }
| local-declarations var-declaration { $$ = insert_decl($1,$2); }
;


statement-list:
  statement { $$ = $1;}
| statement-list statement { $$ = insert_stmt($1,$2); }
;

statement:
  expression-stmt
| compound-stmt
| selection-stmt
| iteration-stmt
| return-stmt
;

expression-stmt:
  expression ';' { $$ = stmt_create(STMT_EXPR,0,0,$1,0,0,0,0); }
| ';'            { $$ = stmt_create(STMT_EXPR,0,0,0,0,0,0,0); }
;

selection-stmt:
  IF '(' expression ')' statement { $$ = if_create($3,$5); }
| IF '(' expression ')' statement ELSE statement
  { $$ = if_else_create($3,$5,$7); }
;

iteration-stmt:
  WHILE '(' expression ')' statement { $$ = while_create($3,$5); }
;

return-stmt: RETURN ';' { $$ = stmt_create(STMT_RETURN,0,0,0,0,0,0,0); }
| RETURN expression ';' { $$ = stmt_create(STMT_RETURN,0,0,$2,0,0,0,0); }
;

expression:
  var '=' expression { $$ = expr_create(EXPR_ASSIGN,$1,$3); }
| conditional-expression-or { $$ = $1; }
;

var:
  ID { $$ = expr_create_var($1); }
| ID '[' expression ']' { $$ = expr_create_array($1,$3); }
;

conditional-expression-or:
  conditional-expression-and
| conditional-expression-or OR conditional-expression-and { $$ = expr_create(EXPR_OR,$1,$3); }
;

conditional-expression-and:
  simple-expression
| conditional-expression-and AND simple-expression { $$ = expr_create(EXPR_AND,$1,$3); }
;

simple-expression:
  additive-expression
| additive-expression LT additive-expression
    { $$ = expr_create(EXPR_LT,$1,$3); }
| additive-expression GT additive-expression
    { $$ = expr_create(EXPR_GT,$1,$3); }
| additive-expression GTEQ additive-expression
    { $$ = expr_create(EXPR_GTEQ,$1,$3); }
| additive-expression LTEQ additive-expression
    { $$ = expr_create(EXPR_LTEQ,$1,$3); }
| additive-expression EQ additive-expression
    { $$ = expr_create(EXPR_EQ,$1,$3); }
| additive-expression NEQ additive-expression
    { $$ = expr_create(EXPR_NEQ,$1,$3); }
;

additive-expression:
  term
| additive-expression '+' term { $$ = expr_create(EXPR_ADD, $1, $3); }
| additive-expression '-' term { $$ = expr_create(EXPR_SUB, $1, $3); }
;

term:
  factor
| term '*' factor { $$ = expr_create(EXPR_MUL, $1, $3); }
| term '/' factor { $$ = expr_create(EXPR_DIV, $1, $3); }
;

factor:
  NUM { $$ = expr_create_integer($1); }
| '(' expression ')' { $$ = $2; }
| var
| call
| INC factor { $$ = expr_create(EXPR_INC,0,$2); }
| DEC factor { $$ = expr_create(EXPR_DEC,0,$2); }
| NOT factor { $$ = expr_create(EXPR_NOT,0,$2); }
;

call:
  ID '(' args ')' { $$ = expr_create_call($1,$3); }

;


args:
{ $$ = (struct expr *) 0; }
| args-list

;


args-list:
  args-list ',' expression { $$ = expr_create_arg($3,$1); }
| expression { $$ = expr_create_arg($1,0); }
;


%%

void yyerror(const char *s){
	printf("%s\n", s);
}

