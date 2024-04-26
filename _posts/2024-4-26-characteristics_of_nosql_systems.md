---
layout: post
title: "Características de sistemas NoSQL"
categories: [Banco de Dados, Banco de dados NoSQL]
tags: [Banco de Dados, NoSQL]
---

As característica dos Sistemas NoSQL que estão relacionadas a banco de dados distribuídos e sistemas distribuídos são: **Escalabilidade horizontal**,
**Replicação e eventual consistência**, **particionamento horizontal**, **Alta performance em leitura ou acesso a dados**.

1. **Escalabilidade horizontal** é capacidade de um sistema aumentar a sua capacidade de lidar com grandes volumes de dados podendo aumentar o número de nós ou computadores
   para resolver o problema. Um sistema NoSQL é desenhado para cada nó que é adicionado ao sistema ele aumentará o poder de armazenamento e processamento, sem necessidade de
   interromper o sistema.

2. **Replicação e eventual consistência** é uma característica que permite alta disponibilidade em troca de perder um pouco de consistência. Aplicações que utilizam NoSQL priorizam
   disponibilidade e tolerância a falhas do que consistência, tolerância requer redundância. O mesmo dado está replicado em dois ou mais nós de modo que se um falhar, o dado estará
   disponível através dos outros nós.
   - **Modelos de replicação**: Sistemas NoSQL normalmente utilizam um dos dois modelos de replicação: **primário-secundário**, **primário-secundário replicado**.
     No **primário-secundário** um nó será eleito como primário, de modo que todas as escritas deveram ser realizadas apenas no primário. Os restantes dos nós serão classificados como
     secundário, os nós secundários deveram copiar os dados do primário, usando o algoritmo: eventual consistência. O algoritmo garante que em um dado momento todos os nós ficaram
     consistentes, ou seja, com seus dados atualizados. Já o **primário-secundário replicado** permite que todos os nós realizarem leitura e escrita, mas não há garantia de
     consistência, além de ser necessário algum método de resolução de conflito de diferentes versões do mesmo dado.
     Perceba que no modelo primário-secundário pode-se utilizar os nós secundários para realização de leituras aumentando a disponibilidade, sacrificando consistência. Podemos
     sacrificar mais consistência utilizando **primário-secundário replicado** e reduzir o tempo de escrita.
3. **particionamento horizontal**: Aplicações que utilizam de NoSQL podem ter na prática milhões de escrita em um único arquivo, arquivo esse que pode também ser
   solicitado para realizar centenas de leituras. Através dessa demanda sistemas NoSQL implementação como solução o **particionamento horizontal**. Na prática o sistema divide os
   dados do arquivo em diferentes nós. O particionamento horizontal além de balancear a carga em diferentes nós, aumenta a disponibilidade dos dados.

4. **Alta performance em leitura ou acesso a dados**: Sistemas NoSQL sacrificaram um sistema de busca complexo com SQL com o objetivo de aumentar a performance na leitura. Os sistemas
   foram pensados para realizar buscas por um objeto em meio a milhares dentro de um único arquivo. Sabendo que existe um **particionamento horizontal** e que cada objeto possui um
   identificador único, então é utilizado a logica de sistema de [tabelas de espalhamento distribuídas][DHT] para localizar o objeto.

As característica dos sistemas SQL relacionadas ao modelo de dados e sua linguagem de busca são: **não obrigatoriedade de um schema**,
**linguagem de consulta menos complexa**, **versionamento**

1. **não obrigatoriedade de um schema**: Muitos sistemas NoSQL não requerem um schema do banco de dados permitindo o armazenamento de dados semiestruturados como JSON ou XML.
   Em alguns sistemas é possível que o usuário defina parcialmente o schema, o que permite um armazenamento mais eficiente.

2. **linguagem de consulta menos complexa**: Sistemas SQL possuem uma linguagem de consulta bastante poderosa e complexa. Já sistemas NoSQL usualmente limitam a busca pelo
   identificador único dos objetos, tornando a consulta menos complexa e poderosa, porém bastante performática. Em muitos casos os sistemas NoSQL se limitam a operações **CRUD**
   (_create,read,update,delete_). No entanto existem sistemas também com linguagens de consulta mais complexas, no entanto não é mais poderoso que o SQL.

3. **versionamento**: Alguns sistemas NoSQL possuem suporte a múltiplas versões dos mesmos objetos, cada versão com a sua marca temporal (_timestamps_)

[DHT]: https://lasarojc.github.io/ds_notes/arch/p2p/#tabelas-de-espalhamento-distribuidas-dht
