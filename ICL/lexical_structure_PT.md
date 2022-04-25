# Estrutura Léxica

As unidades léxicas são:
- números inteiros
- identificadores de tipo
- identificadores de objeto
- notação especial
- strings
- palavras-chave e 
- espaços em branco.

## Inteiros, identificadores e notação especial

- Inteiros são cadeias não vazias de dígitos de 0 a 9.
- Identificadores são cadeias (exceto palavras-chave) que consistem em letras, dígitos e o caractere sublinhado ```_```.
- Identificadores _de tipos_ começam com uma letra maiúscula.
- Identificadores _de objetos_ começam com uma letra minúscula.

Há dois outros identificadores, ```self``` e ```SELF TYPE``` que são considerados como especiais pela linguagem, mas que não são tratados como palavras-chave. 

Os símbolos sintáticos especiais (por exemplo, parênteses, operador de atribuição, etc.) são fornecidos na Figura 1.

## Strings

Strings são colocadas entre aspas duplas ```"..."```.
Dentro de uma string, uma sequência ‘\c’ denota o caractere ‘c’, com as seguintes exceções:```
\b backspace 
\t tab
\n newline 
\f formfeed

Um caractere \n sem escape ```\``` não pode aparecer em uma string:
```
"Esse exemplo\
está bom"
```
```
"Esse não está
OK"
```

Uma string não pode conter EOF.
Uma string não pode conter _null_ (caractere \0).
Qualquer outro caractere pode ser incluído em uma string. 
Strings não podem cruzar os limites do arquivo.

###  Comentários

Existem duas formas de comentários em ICL. 
Quaisquer caracteres entre dois traços “--” e o próximo \n  
(ou EOF, se não houver \n) são tratados como comentários. 

### Palavras-chave

As palavras-chave de ICL são: 
class, else, false, fi, if, in, inherits, isvoid, let, loop, 
pool, then, while, case, esac, new, of, not, true. 

Exceto pelas constantes *true* e *false*, 
as palavras-chave não diferenciam maiúsculas de minúsculas. 
Para estar em conformidade com as regras para outros objetos, 
a primeira letra de true e false deve ser minúscula; 
as letras finais podem ser maiúsculas ou minúsculas.

### Espaço em branco

Caracteres de espacejamento (espaço em branco) 
consistem em qualquer sequência de caracteres: 
```
espaço em branco (ascii 32), 
\n (nova linha, ascii 10), 
\f (form feed, ascii 12), 
\r (retorno de carro, ascii 13), 
\t (tab, ascii 9), 
\v (vertical tab, ascii 11).
```

### Símbolos

Operadores binários e unários.

```
.
@
~ 
isvoid 
* / 
+ -
<= < = 
not
<-
=>
```

Separadores e pontuação
```
; , . ( ) { } 
``` 

