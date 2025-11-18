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
### Ownership
Ownership é um modelo de gerenciamento de memória automático (não existe que o desenvolvedor aloque e desaloque memória manualmente) mas que requer que o desenvolvedor entenda suas regras.

Ownership se resume a 3 regras simples:
- Cada valor possui um **Dono** (**Owner**).
- Só pode existir um dono por vez pra cada valor.
- Quando um dono sai do escopo o valor vai ser liberado (**Dropped**).

# Marca Páginas
https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html#ownership-rules
