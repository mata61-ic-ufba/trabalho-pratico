# Trabalho Prático
Implementação de um compilador.

__Objetivo__: Construir um compilador completo que aceita um programa em linguagem de alto nível como entrada e produz um programa equivalente em linguagem de máquina como saída.

* Linguagem Fonte

Liguagem de alto nível __ICxL__

* Linguagem Objeto

Linguagem de máquina __ICxO__

## Analisador léxico

Construir um analisador léxico para ICxL que lê um arquivo fonte e produz uma lista de tokens, um a um, anotados com seu tipo (identificador, inteiro, cadeia, etc) e sua posição no arquivo fonte (número da linha). Se uma entrada inválida for descoberta, gerar uma mensagem de erro, fazer a recuperação do erro e continuar. Definir um conjunto de testes para descobrir casos de erros léxicos típicos, envolvendo cadeias, comentários, etc.

## Analisador sintático

Construir um analisador sintático para ICxL, usando Bison, que lê um arquivo fonte com a especificação para linguagem ICxL, determina se a gramática é válida, e indica sucesso ou falha. 

## Prettyprinter

Com base na especificação válida para ICxL em Bison, construir a AST para um programa ICLxL válido e depois mostrá-la no formato "labelled bracket".

## Verificador de tipos

Com base na especificação válida para ICxL em Bison, construir um verificador de tipos que percorre a AST e realizar análise semântica para determinar a correção do programa em ICxL.

## Gerador de código

Construir um gerador de código que percorre a AST construída para o programa fonte em ICxL e gera o programa objeto em ICxO.
