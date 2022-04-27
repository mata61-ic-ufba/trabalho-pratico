# A Linguagem de Programação ICL

__Interesting Computing Language (ICL)__ 
é uma linguagem de programação criada para um curso de um semestre da disciplina Compiladores, 
fortemente inspirada na linguagem COOL (créditos em breve).

+ Expressões, classes, tipagem estática, gerenciamento de memória, etc.

## Implementação

ICL é uma linguagem compilada.
Seu compilador (_iclc_) traduz programas ICL para programas em MIPS (assembly language).

```
iclc i1.icl  // compilador ICL gera código MIPS
spim i1.s     // assembler

```

## Características

* linguagem baseada em expressões
* não há comando de "return" explícito

### classes e métodos
```
class Main {   // classe
   main():Int { 1; }; // método com tipo Int
};
```

### I/O

```
class Main {   // classe

   i : IO;     // atributo do tipo IO
   main():Int { i.out_string("Hello World!"; 1; };  // método com dois comandos
};
```

### blocos
```
class Main {   // classe

   i : IO;  // só declaração, sem alocação de memória
   main():Int { { i.out_string("Hello World!\n"; 1; } }; // método com bloco e dois comandos
};
```

### instanciação

```
class Main {   // classe

   i : IO <- new IO; // criação de objeto
   main():Int { { i.out_string("Hello World!\n"; 1; } }; 
};
```

### arrumando a casa
```
class Main {   // classe

   i : IO <- new IO;
   main(): Object { i.out_string("Hello World!\n" }; // apagar "1" e bloco
   
};
```

```
class Main {   // classe

   main(): Object { (new IO).out_string("Hello World!\n" }; // apagar atributo "i"
   
};
```

### herança

```
class Main inherits IO {   // classe, herança

   main(): Object { (new IO).out_string("Hello World!\n" }; // apagar atributo "i"
   
};
```

### self 

```
class Main inherits IO {   // classe, herança

   main(): Object { self.out_string("Hello World!\n" }; // usar self
   
};
```

## default: dispatch to self 


```
class Main inherits IO {   // classe, herança

   main(): Object { out_string("Hello World!\n" }; // self implicito
   
};
```

