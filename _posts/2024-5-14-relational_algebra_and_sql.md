---
layout: post
title: "Algebra relacional e SQL"
categories: [Banco de Dados, Banco de dados relacional]
tags: [Banco de Dados, SQL, Relational Algebra]
math: true
---

## SELECT (algebra relacional)

Em algebra relacional `SELECT` apenas **filtra** uma relação. Diferente do do SQL,
onde além de filtrar com a clausula `WHERE` é possível selecionar quais campos da
Relação deseja Obter.

Em SQL, um exemplo de `SELECT` seria:

```sql
SELECT *
FROM employee
WHERE salary>25000;
```

Em notação de algebra relacional, o símbolo do `SELECT` é a letra $\sigma$ (sigma).
Escrevendo o comando SQL em algebra relacional ficaria:

$$
\sigma_{\text{Salary}>25000}(\text{EMPLOYEE})
$$

Perceba que $\sigma$ **é uma função** que recebe uma relação e retorna outra relação.
Uma função que aplicada a apenas uma relação, portanto o `SELECT` é uma **operação unária**.

## Project

Em algebra relacional `PROJECT` seleciona certas colunas, descarta outras, mas sempre **remove as repetidas**. Um comando
SQL equivalente a essa operação seria:

```sql
SELECT DISTINCT Fname, Lname, Address
FROM employee
```

Assim como `SELECT`, `PROJECT` é uma operação unária.

Escrevendo o comando SQL`PROJECT` em algebra relacional ficaria:

$$
\pi_{\text{Fname},\text{Lname},\text{Address}}(\text{EMPLOYEE})
$$

## Rename

A operação relacional `RENAME` também é uma função unária, ou seja, recebe como argumento de entrada uma única relação.
Ela realiza a mudança de nome de um ou mais atributos e é representada pela letra grega $\rho$ ("rho"). Também podemos
renomear relações através da operação de atribuição: $\leftarrow$.
Um exemplo de comando SQL que realiza a operação `RENAME` seria:

```sql
SELECT DISTINCT E.Fname AS First_name, E.Lname AS Last_name, E.Salary AS Salary
FROM EMPLOYEE AS E
WHERE E.Dno=5;
```
Perceba que em algebra relacional, nós temos um `SELECT`, `PROJECT` e `RENAME` podemos expressar essas operações 
em algebra relacional da seguinte forma:

$$
E \leftarrow \text{EMPLOYEE}
$$

$$
\text{Dep5_E}  \leftarrow  \sigma_{\text{Dno}=5}(E)
$$

$$
 \text{ProD5_E}  \leftarrow \pi_{\text{Fname},\text{Lname},\text{Salary}}(\text{Dep5_E})
$$

$$
 \rho_{(\text{First_name},\text{Last_name},\text{Salary})}(\text{ProD5_E})
$$

## Operações binárias: Union, Intersection e Set Difference

As trés operações foram trazidas da teoria de conjuntos com adaptações para banco de dados relacionais.
A adaptação feita para bancos relacionais tem nome, chama-se **compatibilidade de tipos**, duas relações
$A$ e $B$ só podem realizar união, interseção e diferença  se **ambas as relações** tiverem:
1. o mesmo número $n$ de atributos (o mesmo grau)
2. os mesmos tipos de atributo ($dom(A_i) = dom(B_i)$

Os símbolos de das operações são os mesmos da teoria de conjuntos:

- `UNION`: $A \cup B$. Em SQL usa-se o comando `UNION`
- `INTERSECTION`: $A \cap B$. Em SQL usa-se o comando `INTERSECT`
- `SET DIFFERENCE`: $A - B$. Em SQL usa-se o comando `EXCEPT`

É importante salientar que o resultado dessas operações em algebra relacional **não possuem tuplas repetidas**.
Caso queria realizar essas operações em SQL admitindo tuplas repetidas, então deve-se utilizar os comandos:
`UNION ALL`,`INTERSECT ALL`, `EXCEPT ALL`


## Tabelas

| Fname    | Minit | Lname   | <u>ssn</u> | Bdate      | Address                  | Sex | Salary | Super_ssn  | Dino |
| -------- | ----- | ------- | ---------- | ---------- | ------------------------ | --- | ------ | ---------- | ---- |
| John     | B     | Smith   | 123456789  | 1965-01-09 | 731 Fondren, Houston, TX | M   | 30000  | 333445555  | 5    |
| Franklin | T     | Wong    | 333445555  | 1955-12-08 | 638 Voss, Houston, TX    | M   | 40000  | 888665555  | 5    |
| Alicia   | J     | Zelaya  | 999887777  | 1968-01-19 | 3321 Castle, Spring, TX  | F   | 25000  | 9876543214 | 4    |
| Jennifer | S     | Wallace | 987654321  | 1941-06-20 | 291 Berry, Bellaire, TX  | F   | 43000  | 888665555  | 4    |
| Ramesh   | K     | Narayan | 666884444  | 1962-09-15 | 975 Fire Oak, Humble, TX | M   | 38000  | 333445555  | 5    |
| Joyce    | A     | English | 453453453  | 1972-07-31 | 5631 Rice, Houston, TX   | F   | 25000  | 333445555  | 5    |
| Ahmad    | V     | Jabbar  | 987987987  | 1969-03-29 | 980 Dallas, Houston, TX  | M   | 25000  | 987654321  | 4    |
| James    | E     | Borg    | 888665555  | 1937-11-10 | 450 Stone, Houston, TX   | M   | 55000  | NULL       | 1    |

**Tabela 1: Employee**
