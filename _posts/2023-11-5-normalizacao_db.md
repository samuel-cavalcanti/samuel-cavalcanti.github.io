---
layout: post
title: "Normalização de dados: formas normais"
math: true

categories: [Banco de Dados, Banco de dados relacional]
tags: [Normalização de dados, Banco de Dados]
---

# Normalização de dados

<!--toc:start-->

- [Normalização de dados](#normalização-de-dados)
  - [Resumo](#resumo)
  - [Primeira forma normal](#primeira-forma-normal)
    - [Definição](#definição)
    - [Exemplo Primeira Forma normal](#exemplo-primeira-forma-normal)
  - [Segunda forma normal](#segunda-forma-normal)
    - [Dependência parcial](#dependência-parcial)
    - [Exemplo Segunda Forma normal](#exemplo-segunda-forma-normal)
  - [Terceira forma normal](#terceira-forma-normal)
    - [Dependência transitiva](#dependência-transitiva)
    - [Exemplo Terceira Forma normal](#exemplo-terceira-forma-normal)
  - [Forma normal Boyce-Codd](#forma-normal-boyce-codd)
    - [A exceção](#a-exceção)

<!--toc:end-->

Os Objetivos de uma normalização são:

- Reduzir redundâncias indesejadas
- Reduzir anomalias de inserção,remoção e atualização

## Resumo

- 1º forma normal: Eliminar atributos aninhados
- 2º forma normal: Eliminar dependência parcial
- 3º forma normal: Eliminar dependência transitiva
- 4º forma normal: Eliminar dependência multivalorada
- 5º forma normal: Encontrar dependência de junção
- Forma normal Boyce-Codd: Qualquer dependência funcional deve ser uma superchave

## Primeira forma normal

A primeira forma normal é a definição de relação no modelo relacional básico. Para Uma tabela Está na primeira forma normal, ela não pode conter tabelas aninhadas.

### Definição

Todos os atributos de uma relação devem ter valores sobre domínios atômicos,
ou seja, os campos de uma tabela não devem ser **compostos** ou **multivalorados**

### Exemplo Primeira Forma normal

| Nome do empregado | CPF        | Carro          | Empregado ID |
| ----------------- | ---------- | -------------- | ------------ |
| Carlos souza      | 123456789  | fiat, Mercedes | 1            |
| Jorge silva       | 123456781  | Celta          | 2            |
| Rodrigo Goes      | 1112222333 | Palio          | 3            |

**tabela 1: Empregados**

Perceba que na Coluna **Carro** do empregado **Carlos souza**, possui mais de um valor, ou seja, é **multivalorado** e que na coluna **Nome do empregado** o nome dele é **composto** pelo primeiro nome e sobrenome. Para tornar essa tabela na primeira forma normal temos que transforma nome do empregado em: **Primeiro Nome**, **último sobrenome**. Também temos que decompor a coluna **Carro**, para remover o atributo multivalorado.

| Primeiro Nome | Último sobrenome | CPF       | Empregado ID |
| ------------- | ---------------- | --------- | ------------ |
| Carlos        | souza            | 123456789 | 1            |
| Jorge         | silva            | 123456781 | 2            |
| Carlos        | souza            | 123456789 | 3            |

**tabela 2: Empregados na primeira forma normal**

| Empregado id | tipo Carro |
| ------------ | ---------- |
| 1            | Fiat       |
| 1            | Mercedes   |
| 2            | celta      |
| 3            | Palio      |

**tabela 3: Carros**

## Segunda forma normal

Uma tabela está na segunda forma normal quando, ela está na primeira forma
normal e seus atributos **não chaves** poderem ser obtidos a partir da **combinação de todos os atributos que formam a chave primária**. A segunda forma normal visa resolver o problema da **Dependência parcial**.

### Dependência parcial

Uma relação é tido como dependência composta quando, quando um dos atributos de uma relação composta
consegue isoladamente determinar um outro atributo da relação.

### Exemplo Segunda Forma normal

Perceba que na **tabela 2**, as chaves primaria é a tupa: (**CPF** ,**Empregado ID**) onde **CPF** sozinho consegue determinar o: **Primeiro Nome**, **Último Nome**, ou seja Primeiro Nome e Último nome depende parcialmente da chave primária.
$$ \text{CPF} \to \text{Primeiro Nome},\text{Último Nome}$$

Podemos colocar a tabela 2 na segunda forma formal, decompondo ela em mais uma tabela.

| **_CPF_** | **_Empregado ID_** |
| --------- | ------------------ |
| 123456789 | 1                  |
| 123456781 | 2                  |
| 123456789 | 3                  |

**tabela 4: Empregados na segunda forma normal**

| Primeiro Nome | Último sobrenome | **_CPF_** |
| ------------- | ---------------- | --------- |
| Carlos        | souza            | 123456789 |
| Jorge         | silva            | 123456781 |
| Carlos        | souza            | 123456789 |

**tabela 5: Empregados Nome**

| **_Empregado id_** | tipo Carro |
| ------------------ | ---------- |
| 1                  | Fiat       |
| 1                  | Mercedes   |
| 2                  | celta      |
| 3                  | Palio      |

**tabela 3: Carros**

Perceba que todos os atributos não chaves só podem ser obtidos a partir da chave primária.

## Terceira forma normal

Para uma tabela está na terceira forma normal, ela tem que estar na segunda forma normal e todos os atributos **não chaves** dependem **exclusivamente** da chave primária. Perceba que no [exemplo da segunda forma normal](#exemplo-segunda-forma-normal) também ficou na terceira. A terceira forma normal visa resolver o problema da **dependência transitiva**.

### Dependência transitiva

$$ PK \to \text{A} \to \text{B} $$

Quando um chave primária $PK$ é capaz de determinar um atributo $A$, onde $A$ **não é uma chave primária ou candidata**, mas $A$ é capaz de determinar $B$, logo temos uma **dependência transitiva**. Perceba que a partir de $PK$ pode-se recuperar $B$, mas não **exclusivamente**, pois pode-se recuperar $B$ a partir de $A$.

### Exemplo Terceira Forma normal

Imaginemos uma tabela pessoa:

| **_CPF_** | Data de Nascimento | Idade | Nome    |
| --------- | ------------------ | ----- | ------- |
| 123456789 | 27/4/2000          | 23    | Carlos  |
| 123456788 | 28/5/2002          | 21    | Jorge   |
| 111222781 | 28/5/2002          | 21    | Daniela |

**Tabela 6: Pessoa**

Perceba que a partir do atributo Data de Nascimento é possível determinar a Idade, ao mesmo tempo que a partir do CPF podemos determinar a Data de Nascimento, ou seja:

$$ \text{CPF} \to \text{Data de Nascimento} \to \text{Idade} $$

Para removermos essa **dependência transitiva**, podemos criar uma tabela **Idade**, ou simplesmente podemos remover essa coluna Idade e caso queiramos recuperar a idade, basta calcular a diferença de datas: `(Date.now() - date_of_birth).year()`. **Evite armazenar Idade no banco dados** ou alguma regra relacionada a restrição de idade, como se a pessoa pode beber ou não, pode assistir ao filme ou não, possui idade mínima para dirigir ou não.

## Forma normal Boyce-Codd

Semelhante a 3º forma normal, Boyce-Codd busca remover a dependência transitiva, porém **todo determinante de uma dependência funcional precisa ser uma chave candidata**. Portanto toda tabela que está na forma normal de Boyce-Cood também na terceira forma normal.

### A exceção

Para uma tabela está na terceira forma normal, todos os atributos **não chaves** dependem **exclusivamente** da chave primária. No entanto e se em uma relação com os atributos: $(A,B,C,D)$ onde a chave primária é formada pelos atributos $A,B$ e $B$ depende funcionalmente de $C$, ou seja:

$$ A,B \to C,D $$

$$C \to B$$

Partindo do pressuposto que:

- $A,B,C,D$ são atributos atômicos, portanto essa relação está na 1º forma normal
- Não existe **dependência parcial**, pois nem $A$ ou $B$ não é capaz de derivar $C$ ou $D$, portanto essa relação está 2º forma normal
- Como todos os atributos não chaves $(C,D)$ dependem **exclusivamente** da chave primária $(A,B)$. Portanto **essa relação está na 3º forma normal**.

Forma normal Boyce-Codd impõe justamente a restrição de que $C \to B$ não pode existir.Portanto: **todo determinante de uma dependência funcional precisa ser uma chave candidata**. A relação estaria na formal se:
$$ A,B \to C,D $$

fosse a única dependência funcional.
