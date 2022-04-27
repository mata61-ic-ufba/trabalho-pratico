/* 
 * Template para programa flex.
 * Autora: Christina von Flach
 */

%option noyywrap nodefault yylineno

%{
#include "iclc.tab.h"
%}

%%




%%

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
         case SYM:
            fprintf(stdout,"(%d,SYM,\"%s\")\n", yylineno, yytext);
            break;
        }
    }
}
