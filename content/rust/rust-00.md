---
title: "Aprendendo Rust #00"
date: 2025-11-16
author: Drago
stream: draft
series: rust
description: "Imutabilidade, Expressions e Statements"
tags: ptbr, rust, learn in public
---

Essa série vai registrar minha jornada aprendendo [Rust](https://github.com/rust-lang/rust) e vai culminar em um primeiro projeto (talvez um servidor HTTP ou algum tipo de CLI). Vou sempre listar as fontes dos conteúdos que tenho usado pra estudar mas o principal vai ser o livro [The Rust Programming Language](https://doc.rust-lang.org/book).

> [!NOTE] Disclaimer
> Vou focar nas partes que mais me chamarem atenção na linguagem então coisas simples como declaração de variável ou qualquer sintaxe básica vou deixar de fora.

---

Uma das ferramentas que mais me ajudam a estudar uma linguagem nova são os [LSPs](https://microsoft.github.io/language-server-protocol/), no caso de rust, o [rust_analyzer](https://github.com/rust-lang/rust-analyzer). Ter a documentação no hover e no autocomplete ajuda a manter o foco dentro do editor.
![print](media/nvim_rust_lsp_print.png "inspecionando o que a lib std:io faz com o rust_analyzer")

Além disso como o compilador de rust é muito descritivo os diagnósticos do `rust_analyzer` são muito úteis pra identificar rapidamente erros de sintaxe e tipos:
```rust
error[E0308]: `if` and `else` have incompatible types
 --> src/main.rs:4:44
  |
4 |     let number = if condition { 5 } else { "six" };
  |                                 -          ^^^^^ expected integer, found `&str`
  |                                 |
  |                                 expected because of this

For more information about this error, try `rustc --explain E0308`.
error: could not compile `branches` (bin "branches") due to 1 previous error
```
Imagino que, quando começarmos a adentrar os pântanos mais complexos como [Macros](https://doc.rust-lang.org/reference/procedural-macros.html) ou [Lifetimes](https://doc.rust-lang.org/book/ch10-03-lifetime-syntax.html) as mensagens vão ficando cada vez mais complexas (espero nunca ver stack traces parecidos com erros de compilação de templates em C++98), mas por enquanto fiquei impressionado.

### Imutabilidade
Uma feature que a qualidade pode passar despercebida por muitos é a imutabilidade by default, que, além de manter o código seguro, impedindo alteração acidental de valores, também o deixa mais legível sempre tendo `mut` denotando para leitores o que é mutável e o que não é. A respeito desse assunto recentemente vi [esse post](https://x.com/id_aa_carmack/status/1983593511703474196) do lendário [John Carmack](https://pt.wikipedia.org/wiki/John_Carmack) e traz uma perspectiva diferente sobre o assunto de imutabilidade.

### Statements VS Expressions
Rust tem esses dois conceitos bem definidos, e entender isso tem importância na interpretação do código. `statements` são instruções que performam uma ação e **não retornam um valor**, `expressions` *evaluate*[^1] para um valor resultante:
```rust
let y = 6; // let é um statement que binda um valor na variável y
let x = 5 + 6; // 5 + 6 é uma expression que gera 11, fazendo parte de um statement
let z = {
    let a = 3;
    a + 1 // sem ponto e virgula indica o "retorno" do bloco dessa expression
}
let s = sum(10, 25) // chamar funções são expressions
let i = if true { 10 } else { 25 }; // ifs são expressions
```

Não gostei da questão de `;` ter o valor semântico implicito de terminar apenas statements, da mesma forma que detesto a sintaxe de [exportação em Go](https://go.dev/tour/basics/3), preferiria que usassem uma keyword `pub`/`public`. Também não sou fã dessa idéia de implicit return, a ultima expressão num escopo ser retornada, preferiria que houvesse a obrigatoriedade de `return` explícito. Gosto de expressividade, especialmente nesses casos onde não adiciona verbosidade.

### Fontes
- [Statements and Expressions](https://doc.rust-lang.org/book/ch03-03-how-functions-work.html#statements-and-expressions)
- [Variables and Mutability](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html#variables-and-mutability)

[^1]: [*evaluate*](https://en.wikipedia.org/wiki/Evaluation) é uma palavra muito dificil de se traduzir, vou escolher manter palavras assim em ingles.
