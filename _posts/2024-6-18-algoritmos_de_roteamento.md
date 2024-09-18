---
title: "Protocolos de roteamento"
math: true
categories: [Redes, Protocolos de roteamento]
tags: [Redes, Algoritmos de roteamento, RIP, OSPF, Protocolos de roteamento]
---

A função principal da camada de rede é realizar o **roteamento dos pacotes** permitindo que este chegue ao seu destino.
Para isso existem protocolos**mapeiam** a rede e **decidem para onde enviar os pacotes**.
Existem dois tipos de roteamento: **Estático** ou **Não adaptativo** e **Dinâmico** ou **Adaptativo**.
Roteamento estático possui esse nome pois não reage a mudanças na rede tanto na topologia quanto no perfil do tráfego.
Ele é pode ser encontrado em ambientes de baixa complexidade e de poucas mudanças, mas via de regra o roteamento mais utilizado
é o dinâmico.

## Algoritmos de roteamento estáticos

Os algoritmos mais utilizados no roteamento estático são o algoritmo de menor caminho de **Dijkstra** e **_Flooding_**.

### Flodding

_Flodding_ ou inundação envia o pacote recebido para todas as interfaces exceto a interface de recebimento, "inundando" a rede de pacotes
até que se esgote todas as possibilidades e o destino receba o pacote. Para evitar a sobrecarga na rede o algoritmo conta com um número de
fixo de $N_s$ "saltos".

<!-- prettier-ignore -->
> 1 salto é a distância entre dois nós.
{: .prompt-info }

### Dijkstra

## Routing information protocol (RIP)

- Baseado no algoritmo vetor de distância
- Parâmetro de contagem de saltos (hops) até 15 saltos para cada destino
- Não avalia questões relacionadas ao estado dos enlaces, como latência, banda ou distância, mas tão somente a Quantidade de nós
  entre possíveis destinos
- Tipo de protocolo de roteamento interno ou IGP

### Características de funcionamento do RIP

- Troca de informações por envio de toda a tabela de roteamento aos vizinhos (mensagens do tipo anúncio)
- Os roteadores recebem e verificam se há rotas menos do que as atualmente conhecidas. Caso positivo, atualiza-se a rota em sua tabela indicando o novo caminho
- As tabelas são enviadas de 30 a 30 segundos ao vizinhos. Recurso também conhecido com "keep alive". Limite de recebimento de até 180 segundos (inativação do vizinho)
- Caso haja rotas com a mesma quantidade de saltos, faz-se o balanceamento de carga em round robin

## Open Shortest Path First (OSPF)

<!-- TODO: Write about OSPF -->
