---
layout: post
title: "Políticas Públicas: Ciclo de Política Públicas"
categories: [Políticas Públicas, Ciclo de Política Públicas]
tags: ["Políticas Públicas: Ciclo de Política Públicas", "Políticas Públicas"]

mermaid: true
---

# Ciclo de Política Públicas

O ciclo de políticas pública é um esquema de visualização e interpretação que organiza a vida de uma política pública em fases. As fases podem ser sequenciais, interdependentes,
se misturarem, ficarem sobrepostas ou serem diferentes.

## Fase: Construção, formação, definição da agenda

A agenda consiste numa lista de temas ou problemas que são alvo de atenção em dado momento. Nessa fase busca-se identificar os **problemas coletivos** que podem ser resolvidos com
políticas públicas. O processo envolve diversos grupos de interesse que buscam que suas demandas sejam incluídas na agenda, especialmente incluídas como um problema e não como
situação. **Situação** é algo que não ocupa lugar prioritário na agenda, já um **problema** é algo que muito provavelmente terá prioridade na agenda. Portanto a construção da
agenda é um processo **competitivo**.

> O autor [Secchi](#secchi) divide o momento em que busca-se identificar o problemas coletivos da construção da agenda.

### Condições para um problema entrar na agenda

Para um problema entrar na agenda ele deve ter:

- **Atenção**: Diferentes atores (cidadãos, grupos de interesse, mídia e etc) devem entender a **situação como merecedora de intervenção**
- **Resolutividade**: As possíveis ações para resolver o problema devem ser consideradas **necessárias e factíveis**
- **Competência**: O problema deve estar relacionado a uma **responsabilidade pública**

## Secchi

```mermaid
---
title: Ciclo de Política Pública Secchi
---
%%{init: {"flowchart": {"htmlLabels": false}} }%%
flowchart TB

id["Identificação do Problema"]
id1["Formação da agenda"]
id2["Formulação de alternativas"]
id3["Tomada de decisão"]
id4["Implementação"]
id5["Avaliação"]
id6["Extinção"]

id --> id1
id1 --> id2
id2 --> id3
id3 --> id4
id4 --> id5
id5 --> id6
id6 --> id
```

## Souza

```mermaid
---
title: Ciclo de Política Pública Souza
---
%%{init: {"flowchart": {"htmlLabels": false}} }%%
flowchart TB

id1["Definição de agenda"]
id2["Identificação de alternativas"]
id3["Avaliação de opções"]
id4["Seleção de Opções"]
id5["Implementação"]

id1 --> id2
id2 --> id3
id3 --> id4
id4 --> id5
id5 --> id1
```

## Saraiva

```mermaid
---
title: Ciclo de Política Pública Saraiva
---
%%{init: {"flowchart": {"htmlLabels": false}} }%%
flowchart TB

id["Formação da agenda"]
id1["Elaboração"]
id2["Formulação da tomada de decisão"]
id3["Implementação"]
id5["Avaliação"]

acomp["Acompanhamento"]
id4["Execução"]


id --> id1
id1 --> id2
id2 --> id3
id3 --> id4
id4 --> id5
id5 --> id
id4 -.- exe


subgraph exe["Durante a Execução"]
  acomp
end

```

## Howlett e Ramesh

```mermaid
---
title: Ciclo de Política Pública Howlett e Ramesh
---
%%{init: {"flowchart": {"htmlLabels": false}} }%%
flowchart TB

id1["Construção da agenda"]
id2["Formulação da política"]
id3["Tomada de decisão"]
id4["Implementação"]
id5["Avaliação"]

id1 --> id2
id2 --> id3
id3 --> id4
id4 --> id5
id5 --> id1
```
