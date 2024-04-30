---
layout: post
title: "Tipos de sistemas NoSQL"
categories: [Banco de Dados, Banco de dados NoSQL]
tags: [Banco de Dados, NoSQL]
---

# tipos de sistemas NoSQL

Sistemas NoSQL podem ser divididos em quatro principais categorias: **sistema orientado a Documento** ,**sistema orientado a chave-valor**, **sistema orientado a coluna**,
**sistema orientado a grafo**. 

## Sistemas orientados a documentos

Sistemas orientados a documentos são conhecidos por armazenar dados na forma de documentos como por exemplo: JavaScript Object Notation (JSON).
Cada documento possui um identificador único (id), que é utilizado para acessar rapidamente os dados. Um exemplo de sistema orientado a documentos
é o [MongoDB](https://www.mongodb.com/)

## Sistemas orientados a chave-valor

Sistemas orientados a chave-valor possuí um foco em velocidade de acesso a dados através de uma chave. Como eles são livres de schema, pode-se armazenar desde objetos, documentos
até estruturas mais complexas. Um dos banco de dados mais conhecidos nessa categoria é o [redis](https://redis.io/)

## Sistemas orientados a coluna

Sistemas orientados a coluna entendem uma tabela como uma familia de colunas, onde cada coluna possui o seu próprio arquivo de armazenamento. Estes sistemas também possuem
versionamento dos dados. Banco de dados dessa categoria muito conhecido é o [Bigtable](https://cloud.google.com/bigtable)

## Sistemas orientados a grafo

Sistemas orientados a grafo são banco de dados cujo seus dados são representados em grafo, onde nós podem ser encontrados seguindo as arestas através de _path expressions_.
[neo4j](https://neo4j.com/) é um dos banco de dados mais conhecidos desse segmento.

