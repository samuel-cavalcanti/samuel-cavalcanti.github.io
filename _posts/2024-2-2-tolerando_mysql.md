---
layout: post
title: "Tolerando MySQL 5.6"

categories: [Banco de Dados, Banco de dados relacional]
tags: [Banco de Dados, MySQL, Tolerância a Fahas]
image:
 path: /assets/img/logo-mysql.png
 alt: Tolerando MySQL
---

# Tolerando MySQL 5.6

- [Tolerando MySQL 5.6](#tolerando-mysql-56)
  - [Logs binários](#logs-binários)
  - [Banco replicado](#banco-replicado)
    - [Adicionando os ids](#adicionando-os-ids)
    - [Adicionando um novo usuário no banco principal](#adicionando-um-novo-usuário-no-banco-principal)
    - [Obtendo informações sobre logs no servidor principal](#obtendo-informações-sobre-logs-no-servidor-principal)
    - [Configurando o banco secundário como replica](#configurando-o-banco-secundário-como-replica)
  - [Referencias](#referencias)

Um banco como MySQL 5.6 oferece tolerância a falhas através da habilitação dos logs binários, criar uma replica ou fazer o _dumping_ do banco em intervalos de tempo.
Para fazer o _dump_ do banco basta executar comando `mysqldump` e criar um arquivo `.sql`. Idealmente o arquivo `.sql` seria armazenado em outro lugar.

Lembrando que tolerância a falhas, implica em redundância e **nada** garante que não se pode perder tanto os dados do banco, quanto o arquivo `.sql`, mas é o melhor que podemos fazer.

## Logs binários

Em um banco MySQL é possível recuperar dados perdidos através dos logs binários [point-in-time-recovery-binlog][point-in-time-recovery-binlog].
Portanto com apenas os logs do banco de dados, é possível recuperar dados perdidos. É também através dos logs que os bancos de dados secundário
replicará as operações no banco de dados principal. Logo tanto para recuperar dados quanto para habilitar o segundo banco é necessário habilitar o log banco.

Para habilitar o logs binários configure o arquivo `my.cnf`

```cnf
[mysqld]
# to configure replication
log-bin=mysql-bin
```

> Lembrando que toda modificação no arquivo `my.cnf` necessita de reinicialização do processo mysqld.
{: .prompt-warning}

## Banco replicado

O MySQL permite configurar múltiplos bancos como replica, de modo que o banco primário realiza as operações onde o secundário as copia.
Esse sistema também é conhecido com Master-slave, mas por ser pejorativo, esse nome está em desuso.
Para configurar um outro banco como replica é necessário fazer os seguintes passos:

- Habilitar o log binário no banco primário
- Adicionar um `server_id` único para cada banco, inclusive o banco primário
- Adicionar um novo usuário no banco principal com permissão de realizar a replica
- Obter as informações do banco principal para configurar o banco de replica
- configurar os banco de replica com os dados do banco principal

### Adicionando os ids

Primeiro precisamos criar um `server_id` único para todos os bancos envolvidos, no caso o banco **db** e **db_backup**.
O id pode ser configurado adicionando a propriedade `server-id` no arquivo de configuração `my.cnf`.
No caso do banco **db**, foi adicionado o `server-id=1`.

```cnf
[mysqld]
# to configure replication
log-bin=mysql-bin
server-id=1
```

No caso do banco de backup (**db_backup**), o `server-id=2`.

```cnf
[mysqld]
server-id=2
```

> Lembrando que toda modificação no arquivo `my.cnf` necessita de reinicialização do processo mysqld.
{: .prompt-warning}

### Adicionando um novo usuário no banco principal

Apesar de não ser obrigatório adicionar um novo usuário ao banco principal para o banco secundário se conectar.
Como os metadados da conexão do banco são salvos em arquivos **não criptografados**, então iremos criar um um novo usuário que
possui apenas permissão de replica

```sql
CREATE USER 'backup_db'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'backup_db'@'%';
```

### Obtendo informações sobre logs no servidor principal

Os bancos de replicação operam lendo os logs do banco principal, onde cada banco de replicação é responsável por ler o log e executar os mesmos comandos executados do banco principal.
Para Obter o status atual do log do banco principal, é preciso inciar uma seção no banco, impedir que novas escritas sejam adicionadas de modo que o log permaneça o mesmo e
executar o comando `SHOW MASTER STATUS`, portanto uma vez logado no banco digite os comandos:

```sql
--impedir novas escritas no banco até a sessão acabar
FLUSH TABLES WITH READ LOCK;
-- observar os estados do log
SHOW MASTER STATUS;
```

Como no nosso cenário o banco de dados já está populado, então devemos também fazer um dumping do banco que será utilizado para popular o banco secundário.
Podemos fazer o processo de copia de duas maneiras, a primeira é a copia direta dos arquivos binários localizados em `/var/lib/mysql` a segunda maneira é através do comando `mysqldump`.

```bash
mysqldump --all-databases  -u <user> -p<password> > backup.sql
```

> **Lembrando** que esse comando deve ser executado com a sessão que bloqueia escritas ativa,
  de modo que você garanta consistência dos dados pois assim o
  banco não irá sofrer mutações durante o processo de backup.
{: .prompt-info}

### Configurando o banco secundário como replica

Primeiro precisamos popular o banco **db_backup** com o dumping feito anteriormente.

```bash
mysql -u <user> -p<password> < backup.sql
```

Um vez populado o banco, é necessário configurar o banco **db_backup** como replica através do comando `CHANGE MASTER TO`

```sql
CHANGE MASTER TO
MASTER_HOST='db',-- no caso de exemplo é db, mas pode ser o ip da máquina do outro banco
MASTER_PORT=3306,-- 3306 é a porta padrão, pode ser alterada caso haja necessidade
-- usuário criado para permissão de replica
MASTER_USER='backup_db',
MASTER_PASSWORD='password',
-- valores obtidos com o comando SHOW MASTER STATUS; no banco principal
MASTER_LOG_FILE='mysql-bin.000005',
MASTER_LOG_POS=644;
```

Após configurar a conexão com banco **db**. Execute o comando:

```sql
START SLAVE;
```

## Referencias

[MySQL 5.6 Reference Manual](https://downloads.mysql.com/docs/refman-5.6-en.pdf)

[Replicação Lásaro Camargos](https://lasarojc.github.io/ds_notes/fault/replication/)

[point-in-time-recovery-binlog]: https://dev.mysql.com/doc/refman/5.7/en/point-in-time-recovery-binlog.html
