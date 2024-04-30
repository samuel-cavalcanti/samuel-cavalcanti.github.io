---
layout: post
title: "Definições OLAP"
categories: [Banco de Dados, Processamento Analítico Online (OLAP)]
tags: [Banco de Dados, OLAP]
---


## Operações em matrizes multidimensionais 

Muitas vezes a representação dos dados em uma planilha (2D) não é o suficiente para
realizar analises, então se é utilizado mais dimensões criando cubos e hiper cubos de dados.
Toda operação relacionada ao cubo de dados possui uma interpretação geométrica.

- **Slice**: redução dos dados em parte menores para que se possa visualizar os dados em diferentes ângulos 
    - interpretação geométrica: fatiar o cubo em uma única direção

- **Dice**: Assim como slice, dice busca reduzir o "corpo" do cubo, mas a redução acontece em mais de uma direção
    - interpretação geométrica: fatiar o cubo em em diferentes direções direção

- **Pivot**: mudança de uma dimensão hierárquica para outra
    - interpretação geométrica: rotação

- **Roll-Up**: aumenta a hierarquia, agrupando valores em grandes unidades Ex: subir a hierarquia de meses para anos
    - interpretação geométrica: se distanciar de uma face do cubo

- **Drill-Down**: inverso do Roll-up, reduzir a hierarquia, aumentando a granularidade EX: descer a hierarquia de anos para meses 
    - interpretação geométrica: se aproximar de uma face do cubo

- **Drill-Through**:  análogo a Drill-Down, visa reduzir a hierarquia, porem acessando a dados fora do servidor OLAP 
    -interpretação geométrica: se aproximar de uma face do cubo

- **Drill-Across**: Uma operação de busca que consulta mais de uma tabela fato. A operação exige que os cubos tenham pelo menos  um dimensão em comum
    - interpretação geométrica: alinhar dois ou mais cubos sobre a mesma face


