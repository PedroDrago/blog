---
title: "Newsletter #00"
date: 2025-11-15
banner_image: media/newsletter_cover.png
author: Drago
series: newsletter
description: "AI, Paradigmas e Colaboração"
tags: ptbr, newsletter, AI
---

Essa newsletter vai agregar conteúdos que mais gostei de consumir desde a ultima newsletter.

---

### Recomendações
Newsletters que consumo atualmente:
- [TLDR](https://tldr.tech/): Diversas newsletters diárias separadas por temas (dev, devops, infosec, data, AI, etc.) que juntam links recentes interessantes de artigos, noticias e repositórios.
- [Quastor](https://www.quastor.org/): Artigos mais profundos sobre algum tema específico, costumam chegar de forma mais espaçada (1 vez a cada duas semanas acredito eu).
- [Lobsters](https://lobste.rs/): Não é uma newsletter, é um feed de conteúdos tech selecionados parecido com o HackerNews mas pra mim tem uma seleção mais interessante que o TOP do Hacker News.

---

### Leituras

##### [Programming Paradigms by Lucas Scharenbroch](https://scharenbroch.dev/blog/programming-paradigms/)
> Expanding your toolbelt of paradigms will therefore improve the quality of the code you write, improving the development experience of you and everybody who interacts with your code.

Foca em demonstrar como dominar multiplos paradigmas expande a capacidade do engenheiro de escrever código melhor, e proximo ao fim fornece uma lista interessante de linguagens para dorminar paradigmas focando nas OG de cada paradigma. Me senti atraído pelo artigo pelo fato de que aprender novas linguagens é um dos meus hobbies favoritos, e penso que me aventurei pouco em paradigmas distintos então lendo Programming Paradigms me animei pra montar algum roadmap de paradigmas.

---

##### [Pure and Impure Software Engineering by Sean Goedecke](https://www.seangoedecke.com/pure-and-impure-engineering/)
> In pure software engineering, what you’re doing is close to art or research, the engineer is driven by an aesthetic sense and it’s open-ended. Impure software engineering is more like plumbing or construction, the engineer’s aesthetic sense is subordinated to someone else’s needs.

Descreve uma separação entre diferentes tipos de engenharia que eu nunca havia considerado. Acho que, inconscientemente, eu pensava na distinção entre trabalho acadêmico e trabalho corporativo, mas os termos engenharia pura e engenharia impura descrevem isso muito bem.

---

##### [The real problem with AI Coding by Paul Sangle-Ferriere](https://www.cubic.dev/blog/the-real-problem-with-ai-coding)
> As code generation gets cheaper and accessible to everyone, the bottleneck in software engineering shifts. It's no longer "Can we write the code?". The new constraint is: "Can we understand the code we're writing fast enough to keep moving?".

Traz a reflexão sobre o principal problema de desenvolver usando Coding LLMs: o “Comprehension Debit”, em que o débito não está mais em uma solução técnica problemática, e sim na falta de compreensão da solução por parte dos engenheiros. O post até dá exemplos reais de casos em que tempo foi perdido devido a esse débito de compreensão.

Meu uso de LLMs para código é bem diferente dependendo se estou trabalhando ou desenvolvendo projetos pessoais. No trabalho, estou sempre usando by defualt, e ultimamente tenho experimentado mais o modo agente do Cursor/Vscode, mas tento nunca usar para desenvolver algo que eu tecnicamente seria incapaz de fazer. Nesses casos, prefiro usar como um copiloto respondendo minhas perguntas e dúvidas enquanto eu mesmo desenvolvo utilizando o autocomplete ou tabcomplete.

Em projetos pessoais, desligo completamente o auxílio de IA dentro do editor para poder aproveitar o desenvolvimento. Quando uso IA nesse contexto é apenas como chat de ensino para tirar dúvidas. No fim das contas, se eu gosto de programar, por que eu delegaria essa tarefa para outra pessoa?

---

##### [Vertical Integration is the Only Thing That Matters by Rebecca Turner](https://becca.ooo/blog/vertical-integration/)
> Glue code is very challenging to sell. Vertical integration is the only thing that matters.

Fiquei fascinado com os exemplos dados no início, são integrações inimagináveis nos ambientes onde trabalho. Achei a sessão sobre como o open source lida com Vertical Integration espinhosa demais e, particularmente, concordo com a perspectiva dos projetos open source em manter o desacoplamento em detrimento da DevEx. Mas o conceito de vertical integration apenas deu nome para um campo em que eu amo atuar tanto como cliente quanto como fornecedor: devtools (ou, nesse caso, devintegrations?). Eu adoraria trabalhar em um time focado em Vertical Integration.

---

##### [Collaboration Sucks by Charles Cook](https://newsletter.posthog.com/p/collaboration-sucks)
> If you aren’t actively attempting to collaborate less, you are probably collaborating too much by default and hurting your ability to go far, fast.

Excelente perspectiva, mas acredito que só funciona em times com indivíduos muito capazes e com forte independência, às vezes até egoístas. É preciso ter um time formado por engenheiros confiantes, e não acho que isso seja possível em times com estagiários ou Juniors mais inexperientes. Ainda assim, o texto me deixou reflexivo sobre tentar ser mais independente no trabalho e desenvolver essa confiança. Adorei o humor do post, btw.

### Techs

##### [Perkeep - permanently keep your stuff, for life. ](https://perkeep.org/code)
> It's a way to store, sync, share, import, model, and back up content. Keep your stuff for life.

Muito interessante para privacidade e controle sobre seus dados de forma aparentemente confiável e 100% self hosted. Salvando pois em breve devo começar a montar meus próprios servidores e estarei experimentando tudo que tem disponível por aí de self hosting.

---

##### [Google Agent Development Kit for Go](https://github.com/google/adk-go)
> An open-source, code-first Go toolkit for building, evaluating, and deploying sophisticated AI agents with flexibility and control.

Incluindo porque gosto de Go e estou pensando em fazer um projeto de um Coding Agent de terminal para entender melhor o funcionamento por trás. Talvez esse ADK seja uma boa ferramenta para começar, e espero que ele não abstraia demais o problema a ponto de simplesmente fazer `agent.new().serve()` e já ter um agente funcional.
