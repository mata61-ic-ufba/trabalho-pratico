%option noyywrap yylineno

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

/*
Comando em uso:
    win_flex.exe -d .\t2-elbervitor.l 
    win_bison.exe -dy .\t2-elbervitor.y   
    gcc -o t2-elbervitor .\lex.yy.c .\y.tab.c
    .\t2-elbervitor.exe
*/
%}
BLANK [ \b\f\n\r\t\v]

%%
"--".*                  ;/* ignore comments  */

"+"                     { return '+';}
"-"                     { return '-';}
"*"                     { return '*';}
"/"                     { return '/';}
":"                     { return ':';}
";"                     { return ';';}
"."                     { return '.';}
","                     { return ',';}
"@"                     { return '@';}
"="                     { return EQ;}
"<"                     { return LT;}
"<="                    { return LTE;}
"<-"                    { return T_atrib;} 
"=>"                    { return T_impl;} 

"t"(?i:rue)             { return T_true;}
"f"(?i:alse)            { return T_false;}
(?i:class)              { return T_class;}
(?i:else)               { return T_else; }
(?i:fi)                 { return T_fi; }
(?i:if)                 { return T_if; }
(?i:then)               { return T_then; }
(?i:inherits)           { return T_inherits; }
(?i:isvoid)             { return T_isvoid; }
(?i:while)              { return T_while; }
(?i:loop)               { return T_loop; }
(?i:let)                { return T_let; }
(?i:pool)               { return T_pool; }
(?i:new)                { return T_new; }
(?i:not)                { return T_not; }
(?i:in)                 { return T_in; }
(?i:esac)               { return T_esac; }
(?i:case)               { return T_case; }
(?i:of)                 { return T_of; }

"{"                     { return '{';} 
"}"                     { return '}';}
"("                     { return '(';}
")"                     { return ')';} 
[0-9]+                  { return NUM;}
[a-z_][a-zA-Z0-9_]*     { return ID;}
[A-Z][a-zA-Z0-9_]*      { return TYPE;}
{BLANK}+                /*ignore whitespace */ 
"\"".*"\""              { return STRING;}
.                       { return ERROR; }

%%
/*
int yywrap(void){       //vai encapsular o programa em lex
    return 1;
}*/
/*
int main(int argc, char **argv) {
    int token;

    while ((token = yylex())) {
        switch (token) {
         case ERROR:
            fprintf(stdout,"(%d,ERROR,\"%s\")\n", yylineno, yytext);
            break; 
         case ID:
            fprintf(stdout,"(%d,ID,\"%s\")\n", yylineno, yytext);
            break;
         case KEY:
            fprintf(stdout,"(%d,KEY,\"%s\")\n", yylineno, yytext);
            break;
         case NUM:
            fprintf(stdout,"(%d,NUM,\"%s\")\n", yylineno, yytext);
            break;
         case STRING:
            fprintf(stdout,"(%d,STRING,\"%s\")\n", yylineno, yytext);
            break; 
        }
    }
}*/