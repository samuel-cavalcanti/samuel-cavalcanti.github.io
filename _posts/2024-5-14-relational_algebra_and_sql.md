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
**Ela realiza a mudança de nome de um ou mais atributos** ou **renomear o nome da relação** e é representada pela letra grega $\rho$ ("rho").
Também podemos renomear relações através da operação de atribuição: $\leftarrow$.
Um exemplo de comando SQL que realiza a operação `RENAME` seria:

```sql
SELECT DISTINCT E.Fname AS First_name, E.Lname AS Last_name, E.Salary AS Salary
FROM EMPLOYEE AS E
```

Em algebra relacional seria:

$$
 \rho_{\text{E}(\text{First_name},\text{Last_name},\text{Salary})}(\text{EMPLOYEE})
$$

### Exemplo de tradução de um comando Sql para algebra relacional que utiliza os comandos `SELECT`, `PROJECT` e `RENAME`

```sql
SELECT DISTINCT E.Fname AS First_name, E.Lname AS Last_name, E.Salary AS Salary
FROM EMPLOYEE AS E
WHERE E.Dno=5;
```

Como o comando utiliza as múltiplas operações: `SELECT`, `PROJECT` e `RENAME`, podemos expressar essas operações
dividindo em partes e criando relações intermediárias para facilitar o processo.

$$
E \leftarrow \text{EMPLOYEE}
$$

> Ao invés de renomear a tabela com o operação $\rho$ preferir utilizar a atribuição
{: .prompt-info }

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
$A$ e $B$ só podem realizar união, interseção e diferença se **ambas as relações** tiverem:

1. o mesmo número $n$ de atributos (o mesmo grau)
2. os mesmos tipos de atributo ($dom(A_i) = dom(B_i)$

Os símbolos de das operações são os mesmos da teoria de conjuntos:

- `UNION`: $A \cup B$. Em SQL usa-se o comando `UNION`
- `INTERSECTION`: $A \cap B$. Em SQL usa-se o comando `INTERSECT`
- `SET DIFFERENCE`: $A - B$. Em SQL usa-se o comando `EXCEPT`

É importante salientar que o resultado dessas operações em algebra relacional **não possuem tuplas repetidas**.
Caso queria realizar essas operações em SQL admitindo tuplas repetidas, então deve-se utilizar os comandos:
`UNION ALL`,`INTERSECT ALL`, `EXCEPT ALL`

## Produto Cartesiano

Produto cartesiano é uma **operação binária** que combina cada tupla de uma tabela $A$ com cada tupla de uma tabela $B$.
Resultando em uma nova tabela $C$ que possuirá todos os atributos das tabelas $A$ e $B$

$$
C(A_1,A_2,A_3,...,A_n,B_1,B_2,B_3,...,B_m)
$$

Sabendo que a tabela $A$ tem $n$ colunas e $B$ tem $m$ colunas, logo a tabela $Q$ terá $n+m$ colunas. Perceba que essa operação
não precisa respeitar a compatibilidade de tipos. O produto cartesiano é representando pelo símbolo $\times$.
**Exemplo 1**: seja $A$ uma tabela com os tuplas $a_1,a_2,a_3$ e $B$ com as tuplas $b_1,b_2,b_3$, logo,

$$
C \leftarrow A \times B
$$

$$
C = (a_1b_1,a_1b_2,a_1b_3,a_2b_1,a_2b_2,a_2b_3,a_3b_1,a_3b_2,a_3b_3)
$$

Onde $a_1b_1$ é uma tupla que possui todas as colunas de $a_1$ concatenadas com $b_1$.

**Exemplo 2**
Recupere através da tabelas 1 e 2 uma lista dos nomes (primeiro e último nome) de todas as dependentes das
empregadas e o nome completo da empregada.

$$
\text{Female_E} \leftarrow \sigma_{\text{Sex}='F'}(\text{EMPLOYEE})
$$

$$
\text{E_NAMES} \leftarrow \pi_{(\text{Fname,Lname,Ssn})}(\text{Female_E})
$$

$$
\text{CROSS_DEPENDENTS} \leftarrow \text{E_NAMES} \times \text{DEPENDENT}
$$

$$
\text{E_DEPENDENTS} \leftarrow  \sigma_{\text{Ssn}=\text{Essn}}(\text{CROSS_DEPENDENTS})
$$

$$
\text{RESULT} \leftarrow  \pi_{(\text{Fname,Lname,Dependent_name})}(\text{E_DEPENDENTS})
$$

As tabelas geradas pelas operações são:

| Fname    | Minit | Lname   | <u>ssn</u> | Bdate      | Address                 | Sex | Salary | Super_ssn  | Dino |
| -------- | ----- | ------- | ---------- | ---------- | ----------------------- | --- | ------ | ---------- | ---- |
| Alicia   | J     | Zelaya  | 999887777  | 1968-01-19 | 3321 Castle, Spring, TX | F   | 25000  | 9876543214 | 4    |
| Jennifer | S     | Wallace | 987654321  | 1941-06-20 | 291 Berry, Bellaire, TX | F   | 43000  | 888665555  | 4    |
| Joyce    | A     | English | 453453453  | 1972-07-31 | 5631 Rice, Houston, TX  | F   | 25000  | 333445555  | 5    |

**tabela: Female_E**

| Fname    | Minit | Lname   | <u>ssn</u> |
| -------- | ----- | ------- | ---------- |
| Alicia   | J     | Zelaya  | 999887777  |
| Jennifer | S     | Wallace | 987654321  |
| Joyce    | A     | English | 453453453  |

**tabela: E_NAMES**

| Fname    | Minit | Lname   | <u>ssn</u> | Essn      | Dependent_name | Sex | Bdate      | Relationship |
| -------- | ----- | ------- | ---------- | --------- | -------------- | --- | ---------- | ------------ |
| Alicia   | J     | Zelaya  | 999887777  | 333445555 | Alice          | F   | 1986-04-05 | Daughter     |
| Alicia   | J     | Zelaya  | 999887777  | 333445555 | Theodore       | M   | 1983-10-25 | Son          |
| Alicia   | J     | Zelaya  | 999887777  | 333445555 | Joy            | F   | 1958-05-03 | Spouse       |
| Alicia   | J     | Zelaya  | 999887777  | 987654321 | Abner          | M   | 1942-02-28 | Spouse       |
| Alicia   | J     | Zelaya  | 999887777  | 123456789 | Michael        | M   | 1988-01-04 | Son          |
| Alicia   | J     | Zelaya  | 999887777  | 123456789 | Alice          | F   | 1988-12-30 | Daughter     |
| Alicia   | J     | Zelaya  | 999887777  | 123456789 | Elizabeth      | F   | 1967-05-05 | Spouse       |
| Jennifer | S     | Wallace | 987654321  | 333445555 | Alice          | F   | 1986-04-05 | Daughter     |
| Jennifer | S     | Wallace | 987654321  | 333445555 | Theodore       | M   | 1983-10-25 | Son          |
| Jennifer | S     | Wallace | 987654321  | 333445555 | Joy            | F   | 1958-05-03 | Spouse       |
| Jennifer | S     | Wallace | 987654321  | 987654321 | Abner          | M   | 1942-02-28 | Spouse       |
| Jennifer | S     | Wallace | 987654321  | 123456789 | Michael        | M   | 1988-01-04 | Son          |
| Jennifer | S     | Wallace | 987654321  | 123456789 | Alice          | F   | 1988-12-30 | Daughter     |
| Jennifer | S     | Wallace | 987654321  | 123456789 | Elizabeth      | F   | 1967-05-05 | Spouse       |
| Joyce    | A     | English | 453453453  | 333445555 | Alice          | F   | 1986-04-05 | Daughter     |
| Joyce    | A     | English | 453453453  | 333445555 | Theodore       | M   | 1983-10-25 | Son          |
| Joyce    | A     | English | 453453453  | 333445555 | Joy            | F   | 1958-05-03 | Spouse       |
| Joyce    | A     | English | 453453453  | 987654321 | Abner          | M   | 1942-02-28 | Spouse       |
| Joyce    | A     | English | 453453453  | 123456789 | Michael        | M   | 1988-01-04 | Son          |
| Joyce    | A     | English | 453453453  | 123456789 | Alice          | F   | 1988-12-30 | Daughter     |
| Joyce    | A     | English | 453453453  | 123456789 | Elizabeth      | F   | 1967-05-05 | Spouse       |

**tabela: CROSS_DEPENDENTS**

| Fname    | Minit | Lname   | <u>ssn</u> | Essn      | Dependent_name | Sex | Bdate      | Relationship |
| -------- | ----- | ------- | ---------- | --------- | -------------- | --- | ---------- | ------------ |
| Jennifer | S     | Wallace | 987654321  | 987654321 | Abner          | M   | 1942-02-28 | Spouse       |

**tabela: E_DEPENDENTS**

| Fname    | Lname   | Dependent_name |
| -------- | ------- | -------------- |
| Jennifer | Wallace | Abner          |

**tabela: RESULT**

## Join

Uma das operações muito utilizadas em comando SQL é o `JOIN`. Essa operação pode ser entendia como um
[produto cartesiano](#produto-cartesiano) seguido de um [`SELECT`](#select-algebra-relacional). Portanto
`JOIN` é uma operação **binária** cuja a relação resultante é $n +m$ onde $n$ é o número de atributos da primeira
tabela e $m$ é o número de atributos da segunda tabela.
Perceba que diferente do produto cartesiano o `JOIN` possui uma **condição** para que se satisfaça a junção
das tabelas. Condição que especifica e limita as combinações entre as tuplas.

Essa operação é representada pelo símbolo $\Join$.

Utilizado o `JOIN`, podemos então substituir as equações:

$$
\text{CROSS_DEPENDENTS} \leftarrow \text{E_NAMES} \times \text{DEPENDENT}
$$

$$
\text{E_DEPENDENTS} \leftarrow  \sigma_{\text{Ssn}=\text{Essn}}(\text{CROSS_DEPENDENTS})
$$

Por apenas uma equação:

$$
\text{E_DEPENDENTS} \leftarrow  \text{E_NAMES} \Join_{\text{Ssn}=\text{Essn}} \text{DEPENDENT}
$$

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

| Essn      | Dependent_name | Sex | Bdate      | Relationship |
| --------- | -------------- | --- | ---------- | ------------ |
| 333445555 | Alice          | F   | 1986-04-05 | Daughter     |
| 333445555 | Theodore       | M   | 1983-10-25 | Son          |
| 333445555 | Joy            | F   | 1958-05-03 | Spouse       |
| 987654321 | Abner          | M   | 1942-02-28 | Spouse       |
| 123456789 | Michael        | M   | 1988-01-04 | Son          |
| 123456789 | Alice          | F   | 1988-12-30 | Daughter     |
| 123456789 | Elizabeth      | F   | 1967-05-05 | Spouse       |

**Tabela 2: Dependent**
