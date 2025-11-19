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
Para podermos falar sobre Ownership em Rust precisamos conhecer um pouco sobre os métodos mais clássicos de gerenciar memória. No post [Um pouco sobre Gerenciamento de Memória](gerenciamento-de-memoria.html) falo um pouco sobre o que sei do tema.
### Regras de Ownership
Ownership é um modelo de gerenciamento de memória automático (não existe que o desenvolvedor aloque e desaloque memória manualmente) mas que requer que o desenvolvedor entenda suas regras.

<!Como o nome diz Ownership envolve o conceito de cada valor na memória possuir um **dono**.>

Ownership se resume a 3 regras simples:
- Cada valor possui um **Dono** (**Owner**).
- Só pode existir um dono por vez pra cada valor.
- Quando um dono sai do escopo o valor vai ser liberado (**Dropped**).

```rust
fn main(){
	let s = String::from("Hello World") // Criamos um objeto no heap
	let x = s // bindamos uma nova variável pra esse valor
	println!("{x}") // usamos x
	println!("{s}") // usamos s
}
```
Ao compilar o código vamos receber o seguinte erro:
```rust
error[E0382]: borrow of moved value: `s`
 --> src/main.rs:5:16
  |
2 |     let s = String::from("teste");
  |         - move occurs because `s` has type `String`, which does not implement the `Copy` trait
3 |     let x = s;
  |             - value moved here
4 |     println!("{x}");
5 |     println!("{s}");
  |                ^ value borrowed here after move
  |
help: consider cloning the value if the performance cost is acceptable
  |
3 |     let x = s.clone();
  |              ++++++++

For more information about this error, try `rustc --explain E0382`.
```
Em outras linguagens quando fazemos `x = s` de forma implicita aconteceria 1 das duas opcoes:
- Uma [Shallow Copy](https://en.wikipedia.org/wiki/Object_copying#Shallow_copy), ou seja, ambas as variáveis apontariam para a mesma memória o que é potencialmente perigoso pois poderiamos liberar a memória por uma das variáveis e posteriormente tentar usa-la novamente pela outra.
- Uma [Deep Copy](https://en.wikipedia.org/wiki/Object_copying#Deep_copy), ou seja, um clone exato da nossa string na memória o que gastaria o dobro de memória e diversos ciclos para efetivamente escrever todo a string em outro endereco.
Em Rust, seguindo a primeira régra, o que acontece é uma operacao conhecida como `move`,  que significa que movemos a **Ownership** dessa memória da variável `s` para a variável `x`, portanto `s` passa a ser inválida. Se no nosso exemplo omitirmos a linha 5 conseguiríamos compilar corretamente já que não estaríamos mais usando a variável inválida. Podemos também seguir a sugestão do compilador de usar o método `.clone()` que faz justamente uma Deep Copy porém de forma totalmente explícita, deixando claro que alí estamos aceitando o custo de performance.

Esse comportamento é diferente do que se espera mas nada muito alienigena. Vamos ver um caso diferente de ownership que vai parecer mais estranho:
```rust
fn my_print(str: String) {
    println!("{str}");
}

fn main() {
    let s = String::from("hey");
    my_print(s);
    println!("{s}")
}
```
Nesse caso quando compilamos recebemos esse erro:
```rust
error[E0382]: borrow of moved value: `s`
 --> src/main.rs:8:16
  |
6 |     let s = String::from("hey");
  |         - move occurs because `s` has type `String`, which does not implement the `Copy` trait
7 |     my_print(s);
  |              - value moved here
8 |     println!("{s}")
  |                ^ value borrowed here after move
  |
note: consider changing this parameter type in function `my_print` to borrow instead if owning the value isn't necessary
 --> src/main.rs:1:18
  |
1 | fn my_print(str: String) {
  |    --------      ^^^^^^ this parameter takes ownership of the value
  |    |
  |    in this function
  = note: this error originates in the macro `$crate::format_args_nl` which comes from the expansion of the macro `println` (in Nightly builds, run with -Z macro-backtrace for more info)
help: consider cloning the value if the performance cost is acceptable
  |
7 |     my_print(s.clone());
  |               ++++++++

For more information about this error, try `rustc --explain E0382`.
error: could not compile `testing` (bin "testing") due to 1 previous error
```
Isso acontece pois quando passamos nossa string `s` como argumento da funcao `my_print` agora `s` não é mais **Dono** da string, e sim o parâmetro **str** passa a ser o dono, e quando o escopo de `my_print` termina a string é liberada da memória pois seu dono saiu do escopo.  A gambiarra que podemos fazer para devolver o ownership para `s` é a seguinte:
```rust
fn my_print(str: String) -> String {
    println!("{str}");
    return str;
}

fn main() {
    let mut s = String::from("hey");
    s = my_print(s);
    println!("{s}")
}
```
Retornamos `str`! Agora jogamos a ownership de volta para `s`. Mas o pattern de usar uma memória dentro de uma funcao sem perder o acesso é muito comum, e ter que sempre retornar todas as variáveis para fora rapidamente se tornaria incomodo. e é pra isso que temos references.

### References
References são a versão de Rust para [ponteiros](https://pt.wikipedia.org/wiki/Ponteiro_(programa%C3%A7%C3%A3o)) uma referencia àquele endereco de memória:
```rust
```hn


<!Nesse exemplo já entendemos a primeira e a segunda regra. A terceira é a mais simples, que é um [free]() automático baseado no escopo. Podemos pensar que em Rust o heap possui o mesmo comportamento da stack, onde quando uma funcao termina tudo que foi alocado alí dentro será desalocado.>



### Referencias e Borrowing
Rust possui uma estrutura parecida com [ponteiros](https://pt.wikipedia.org/wiki/Ponteiro_(programa%C3%A7%C3%A3o)) onde podemos compartilhar k

# Marca Páginas
https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#ownership-rules
