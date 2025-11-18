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
- linkar e falar sobre artigo separado


### Ownership

Agora que entendemos o básico de gerenciamento de memória em outras linguagens surge a dúvida: como podemos não ter que trocar segurança por performance?

E Rust vem com a resposta: **Ownership**.

Ownership se resume a 3 regras simples:
- Cada valor possui um **Dono** (**Owner**).
- Só pode existir um dono por vez pra cada valor.
- Quando um dono sai do escopo o valor vai ser liberado (**Dropped**).

# Marca Páginas
https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#ownership-rules
