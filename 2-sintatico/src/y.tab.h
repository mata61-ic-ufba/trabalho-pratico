/* A Bison parser, made by GNU Bison 3.7.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ID = 258,                      /* ID  */
    STRING = 259,                  /* STRING  */
    NUM = 260,                     /* NUM  */
    TYPE = 261,                    /* TYPE  */
    EQ = 262,                      /* EQ  */
    LT = 263,                      /* LT  */
    LTE = 264,                     /* LTE  */
    T_atrib = 265,                 /* T_atrib  */
    T_impl = 266,                  /* T_impl  */
    T_true = 267,                  /* T_true  */
    T_false = 268,                 /* T_false  */
    T_class = 269,                 /* T_class  */
    T_else = 270,                  /* T_else  */
    T_while = 271,                 /* T_while  */
    T_if = 272,                    /* T_if  */
    T_fi = 273,                    /* T_fi  */
    T_then = 274,                  /* T_then  */
    T_inherits = 275,              /* T_inherits  */
    T_isvoid = 276,                /* T_isvoid  */
    T_new = 277,                   /* T_new  */
    T_not = 278,                   /* T_not  */
    T_pool = 279,                  /* T_pool  */
    T_loop = 280,                  /* T_loop  */
    T_let = 281,                   /* T_let  */
    T_case = 282,                  /* T_case  */
    T_esac = 283,                  /* T_esac  */
    T_of = 284,                    /* T_of  */
    T_in = 285,                    /* T_in  */
    ERROR = 286                    /* ERROR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ID 258
#define STRING 259
#define NUM 260
#define TYPE 261
#define EQ 262
#define LT 263
#define LTE 264
#define T_atrib 265
#define T_impl 266
#define T_true 267
#define T_false 268
#define T_class 269
#define T_else 270
#define T_while 271
#define T_if 272
#define T_fi 273
#define T_then 274
#define T_inherits 275
#define T_isvoid 276
#define T_new 277
#define T_not 278
#define T_pool 279
#define T_loop 280
#define T_let 281
#define T_case 282
#define T_esac 283
#define T_of 284
#define T_in 285
#define ERROR 286

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
