/* ast.c
 * Adaptação de partes do código do livro de Compiladores
 * de Douglas Thain para a disciplina MATA61-UFBA
 * Christina von Flach (github: christinaflach)
 * 2020

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include "ast.h"

struct type * type_create(type_t kind,
                  struct type *subtype,
                  struct param_list *params)
{
    struct type *t = malloc(sizeof(*t));
    if (t) {
        t->kind = kind;
        t->subtype = subtype;
        t->params = params;
    }
    else
        printf("No memory\n");
    return t;
}

struct decl *insert_decl(struct decl *head,
                         struct decl *elem) {
    struct decl *p = head;
    struct decl *i = elem;
    while (p->next) {
        p = p->next;
    }
    p->next = i;
    return head;
}

struct stmt *insert_stmt(struct stmt *head,
                         struct stmt *elem) {
    struct stmt *p = head;
    struct stmt *i = elem;
    while (p->next) {
        p = p->next;
    }
    p->next = i;
    return head;
}

struct param_list *insert_param(
                    struct param_list *head,
                    struct param_list *elem) {
    struct param_list *p = head;
    struct param_list *i = elem;
    while (p->next) {
        p = p->next;
    }
    p->next = i;
    return head;
}

struct decl * decl_create(
       char *name, struct type *type,
       struct expr *expr,
       struct stmt *code,
       struct decl *next )
{
    struct decl *d = malloc(sizeof(*d));
    if (d) {
        d->name = name;
        d->type = type;
        d->expr = expr;
        d->code = code;
        d->next = next;
    }
    else
        printf("No memory\n");
    return d;
}

struct expr * create_integer(int i)
{
    struct expr *ei =
        expression_create(EXPR_INTEGER_LITERAL,0,0,0,i);
    return ei;
}

struct decl * var_decl_create(char *name, struct type *type)
{
    struct decl *vd = decl_create(name, type, 0, 0, 0);
    return vd;
}

struct decl * array_decl_create(char *name, struct type *type, int i)
{
    struct type *at = type_create(TYPE_ARRAY,type,0);
    struct expr *array_size = create_integer(i);
    struct decl *ad = decl_create(name,at,array_size,0,0);
    return ad;
}

struct decl * func_decl_create(char *name, struct type *type, struct param_list *plist, struct stmt *body)
{
    struct type *ft = type_create(TYPE_FUNCTION,type,plist);
    struct decl *fd = decl_create(name,ft,0,body,0);
    return fd;
}

//Olhar 1:36:43
// era enum_decl_create
// Tipo Enum com uma lista
struct decl * enum_type_create(char *name, struct param_list *idlist)
{
    struct type *et = type_create(TYPE_ENUM,0, idlist);
    // int enum_size = 0;
    struct decl *ed = decl_create(name,et,0,0,0);
    return ed;
}

// tipo | ENUM ID ID ';'
struct decl * enum_var_decl_create(char *varname, char *typename)
{
    struct type *et = type_create(TYPE_ENUM,0, 0);
    struct expr *e = expr_create_name(typename);
    struct decl *ed = decl_create(varname,et,e,0,0);
    return ed;
}

struct param_list * param_create(char *name, struct type *type)
{
    struct param_list *pl = malloc(sizeof(*pl));
    if (pl) {
        pl->name = name;
        pl->type = type;
        pl->next = 0;
    }
    else
        printf("No memory\n");
    return pl;
}

struct param_list * enum_param_create(char *name)
{
    struct param_list *pl = malloc(sizeof(*pl));
    if (pl) {
        pl->name = name;
        pl->next = 0;
    }
    else
        printf("No memory\n");
    return pl;
}

struct param_list * param_array_create(char *name, struct type *type)
{
    struct type *at = type_create(TYPE_ARRAY,type,0);
    struct param_list *pl =
        param_create(name,at);
    return pl;
}

struct stmt * stmt_create( stmt_t kind,
    struct decl *decl, struct expr *init_expr,
    struct expr *expr, struct expr *next_expr,
    struct stmt *body, struct stmt *else_body,
    struct stmt *next )
{
    struct stmt *s = malloc(sizeof(*s));
    if (s) {
        s->kind = kind;
        s->decl = decl;
        s->init_expr = init_expr;
        s->expr = expr;
        s->next_expr = next_expr;
        s->body = body;
        s->else_body = else_body;
        s->next = next;
    }
    else
        printf("No memory\n");
    return s;
}

struct stmt * compound_stmt_create(
                stmt_t kind,
                struct decl *localdecl,
                struct stmt *body)
{
    struct stmt *cs =
        stmt_create(kind,localdecl,0,0,0,body,0,0);
    return cs;
}

struct stmt * if_create(struct expr *expr,
                        struct stmt *body)
{
    struct stmt *ifs =
        stmt_create(STMT_IF_ELSE,0,0,expr,0,body,0,0);
    return ifs;
}

struct stmt * if_else_create(struct expr *expr,
                             struct stmt *body,
                             struct stmt *else_body)
{
    struct stmt *ifs =
        stmt_create(STMT_IF_ELSE,0,0,expr,0,body,else_body,0);
    return ifs;
}

struct stmt * while_create(struct expr *expr,
                           struct stmt *body)
{
    struct stmt *ws =
        stmt_create(STMT_WHILE,0,0,expr,0,body,0,0);
    return ws;
}


struct expr * expression_create(expr_t kind, struct expr *left, struct expr *right, char *name, int value)
{
    struct expr *e = malloc(sizeof(*e));
    if (e) {
        e->kind = kind;
        e->left = left;
        e->right = right;
        e->name = name;
        e->integer_value = value;
    }
    else
        printf("No memory\n");
    return e;
}

struct expr * expr_create(expr_t kind,struct expr *left,struct expr *right)
{
    struct expr *e2 =
expression_create(kind,left,right,0,0);
    return e2;
}

struct expr * expr_create_name(char *name)
{
    struct expr *en = expression_create(EXPR_NAME,0,0,name,0);
    return en;
}

struct expr * expr_create_var(char *n)
{
    struct expr *name= expr_create_name(n);
    struct expr *en = expr_create(EXPR_VAR,name,0);
    return en;
}

struct expr * expr_create_uni(char *n, struct expr *indexexpr)
{
    struct expr *name = expr_create_name(n);
    struct expr *ae = expr_create(EXPR_ARRAY,name,0);
    return ae;
}


struct expr * expr_create_array(char *n, struct expr *indexexpr)
{
    struct expr *name= expr_create_name(n);
    struct expr *ae = expr_create(EXPR_ARRAY,name,indexexpr);
    return ae;
}

struct expr * expr_create_integer(int i)
{
    struct expr *ei =
        expression_create(EXPR_INTEGER_LITERAL,0,0,0,i);
    return ei;
}

struct expr * expr_create_call(char *name, struct expr *expr)
{
    struct expr *n =
        expr_create_name(name);
    struct expr *ec =
        expr_create(EXPR_CALL, n, expr);

    return ec;
}

struct expr * expr_create_arg(struct expr *expr, struct expr *next)
{
    struct expr *arg =
        expr_create(EXPR_ARG,expr,next);
    return arg;
}

