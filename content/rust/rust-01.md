---
title: "Aprendendo Rust #01"
date: 2025-11-17
banner_image: media/rust_cover.png
author: Drago
stream: draft
# series: rust
description: "Ownership"
tags: ptbr, rust, learn in public
---

# RevisÃo
- [ ] Ler artigos linkados (error prone e os de memory bugs)
- [ ] Erros de português

Eu ia incluir os estudos de ownership na //obsidian link para rust#00// mas por ser um assunto muito único e relativamente grande achei que caberia uma um capítulo separado.

---

### Gerenciamento de Memória

> [!NOTE] Dica
> A página introdutória de ownership tem uma sessão que explica de forma bem sucinta sobre a [diferença entre stack e heap](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#the-stack-and-the-heap), vale a leitura caso ainda tenha dúvidas sobre isso.

Ownsership é um set de regras bem definido que rege todo o sistema de gerenciamento de memória em Rust, então antes vamos exemplificar dois tipos de gerenciamento de memória clássicos que se diferenciam do de Rust. 

Algumas linguagéns gerenciam memória via garbage collector, um software que vigia a execução do programa para identificar recursos não utilizados e então os libera da memória:
```python
# python
def allocate_and_free():
    x = [0] * 5_000_000

allocante_and_free()
```
No exemplo acima em python criamos uma lista alocada no heap, quando a função `allocate_and_free` chega no final o escopo dela fecha e mais nenhuma referência à lista existe, portanto o garbage collector sabe que pode liberar essa memória de forma segura. O nome dessa técnica é [Reference Counting](https://en.wikipedia.org/wiki/Reference_counting). 

Garbage collection é o método de gerenciamento de memória mais utilizado hoje em dia, práticamente todas as linguagens que você conhece ou conhecerá usam um GC [^1] mas isso vem com um tradeoff: **performance**. Garbage Collection exige que alguma parte do runtime (geralmente sendo outra thread) vigie e libere a memória, assim consumindo recursos.

---
Outras linguagens exigem que você aloque e desaloque manualmente sua própria memória no heap:
```c
//c
#include <stdlib.h>
void memory_leak(){
    char *ptr = malloc(50);
}

void no_memory_leak(){
    char *ptr = malloc(50);
    free(ptr);
}

int main(int argc, char **argv){
    no_memory_leak();
    memory_leak();
    return 0;
}
```
No exemplo acima podemos ver que na função `memory_leak` não usamos o `free`, isso faz com que quando o escopo acabe nenhuma referência à memória de `*ptr` exista mais, mas difernte de python onde tem um garbage collector vigiando isso para liberar a memória, em C isso significa que essa memória *leakou*, nunca mais será possível libera-la (durante a execução do programa, obviamente), você pode verificar isso usando um software chamado [Valgrind](https://valgrind.org/):
```
==10225== Memcheck, a memory error detector
==10225== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==10225== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==10225== Command: ./a.out
==10225== 
==10225== 
==10225== HEAP SUMMARY:
==10225==     in use at exit: 50 bytes in 1 blocks
==10225==   total heap usage: 2 allocs, 1 frees, 100 bytes allocated
==10225== 
==10225== LEAK SUMMARY:
==10225==    definitely lost: 50 bytes in 1 blocks
==10225==    indirectly lost: 0 bytes in 0 blocks
==10225==      possibly lost: 0 bytes in 0 blocks
==10225==    still reachable: 0 bytes in 0 blocks
==10225==         suppressed: 0 bytes in 0 blocks
==10225== Rerun with --leak-check=full to see details of leaked memory
==10225== 
==10225== For lists of detected and suppressed errors, rerun with: -s
==10225== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

Hoje em dia poucas linguagens fazem uso de gerenciamento manual, uma outra notória é [Zig](https://ziglang.org/). Apesar do gerenciamento manual ser muito mais eficiente do que Garbage Collection o tradeoff aqui é claro: [**Error Prone**](https://errorprone.info/). É fácil e acontece mais do que se imagina de um desenvolvedor cometer um erro e deixar memória alocada desnecessáriamente ou pior, gerar um Bug de memória[^2]. 

### Ownership

Agora que entendemos o básico de gerenciamento de memória em outras linguagens surge a dúvida: como podemos não ter que trocar segurança por performance?

E Rust vem com a resposta: **Ownership**.

Ownership se resume a 3 regras simples:
- Cada valor possui um **Dono** (**Owner**).
- Só pode existir um dono por vez pra cada valor.
- Quando um dono sai do escopo o valor vai ser liberado (**Dropped**).

# Marca Páginas
https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#ownership-rules

[^1]: **G**arbage **C**collector.
[^2]: Diversos estudos mostram que mais de 60% das vulnerabilidades em software vem de erros de memória.
    - [Apple Memory Safety](https://langui.sh/2019/07/23/apple-memory-safety/)
    - [Microsoft - We need a safer systems programming language](https://www.microsoft.com/en-us/msrc/blog/2019/07/we-need-a-safer-systems-programming-language)
    - [Google - Queue the Hardening Enhancements](https://security.googleblog.com/2019/05/queue-hardening-enhancements.html)
