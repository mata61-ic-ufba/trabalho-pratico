#!/bin/bash
# compile.sh

bison -d iclc.y
flex iclc.l 
cc -o iclc lex.yy.c iclc.tab.c -ll 
