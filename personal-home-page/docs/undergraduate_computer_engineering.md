# Resumo

Ao Final do primeiro ciclo da engenharia, escolhi engenharia da computação ao invés de mecatrônica.
Nessa enfase, surgiu a oportunidade de pagar matérias em outra instituição federal a Universidade Federal de Uberlândia (UFU). Nesse momento
da minha vida eu foquei em ser um engenheiro digno, aprendendo clean code, clean architecture, test-driven development
e design patters. Com bônus inesperado que foi conhecer sistemas distribuídos e o professor Lásaro, onde acabei estudando um pouco
sobre uma rede peer to peer chamada pastry e entendendo que tolerância a faltas implica em redundância. A minha ultima matéria optativa
foi Internet Of Things (Iot) onde com meu esp8266 fiz leds acederem através do meu App flutter. Iot eu cursei na própria UFRN.
Agora falta uma matéria obrigatória, estágio obrigatório
e algumas horas complementares terei um novo Bacharel, dessa vez em engenharia da computação.   



## Buscando Ser um Desenvolvedor Limpo
Aquele momento que você acha que está arrasando mas só está passando vergonha, foi a virada de chave que aconteceu quando
esse jovem adulto fedorento começar a primeiramente entender do que se trata os livros clean code e clean architecture.
Para esse jovem adulto, esses livros se tratam de ética, isso mesmo, **ÉTICA** Robert Cecil Martin na sua primeira lição: [Clean Code - Uncle Bob / Lesson 1](https://www.youtube.com/watch?v=7EmboKQH8lM&ab_channel=UnityCoin) deixa isso bem claro, simplesmente não temo como mais viver em um mundo sem software e eles
controlam tudo e quem escreve o software ? somos nós. Logo eu um cara certinho descobre que sou antiético, que se eu coloca-se os meus
códigos em produção estaria fazendo um desserviço para a sociedade. Para combater o meu mal cheiro li clean code, clean architecture e Test Drive development TDD, no caso do TDD acompanhei o autor reescrevendo o exemplo Money em Kotlin e obviamente reescrevendo o unit test em python os códigos ficaram
armazenados no github [exemplos_tdd](https://github.com/samuel-cavalcanti/exemplos_tdd) e no meu coração. **SOU LIMPO** ou pelo menos busco ser.
Nessa saga Conheci o professor Marcelo da UFU, No papel ele me ensinou Programação Orientado a objetos 2, na prática ele lhe ensina a lavar o seu código,
sua dignidade e design patterns. Eu não contrataria nenhum cientista da computação da UFU sem a val de Marcelo.



## Descrito um Processador de Uso Geral em FPGA
No primeiro trabalho de circuitos digitais descrevi um marca passo em VHDL, uma linguagem de descrição de hardware.
No segundo trabalho descrevi um controlador para um robô simples para desviar de obstáculos que possui 2 sonars e embarquei em uma FPGA:
[Orivaldo Robot](https://www.youtube.com/watch?v=G7RQ4foF_As&ab_channel=SamuelCavalcanti). No terceiro Trabalho descrevi um processador de uso geral com 7 instruções. Como eu consegui com sucesso totalmente os três trabalhos dessa disciplina ?
testes e mais testes, uma vez que o código em VHDL é embardo na FPGA não existe  _console.log()_, _print_, _system.out.println_. Todos os três
projetos quando passaram em testes unitários e de integração, funcionaram como esperado na FPGA. 



## Front-end de um Compilador: Os testes Não Provam Nada
Medo, Desespero, estado de negação era como eu estava na principal avaliação da disciplina construção de compiladores da Universidade Federal
de Uberlândia. Nessa disciplina eu criei um front-end de um compilador: [github.com/samuel-cavalcanti/ufu_language_ufu](https://github.com/samuel-cavalcanti/ufu_language_ufu). Nesse projeto todas as linhas de código passam pelos testes unitários e de integração, mas quando o professor mandou um teste dele
para executar não passou, devido ao estado de negação, rotei os testes cinco vezes e ele continuo falhando, obviamente. O codecov me traiu, acreditei que era pra valer devido
a 98% de convergência do codecov. De 0 até 5, minha confiança em testes era 15, afinal tive sucesso com um processador, um robô que desvia de obstáculos e um marca-passo graças aos testes. No entanto no momento explicar e mostrar o código para o professor e algo mágico aconteceu ele encontrou uma série de bugs e concertei em mais ou menos uma hora, executei o teste dele e passou. Notei algo que não tinha percebido, a velocidade das modificações, quando o tempo é curto
e é necessário fazer modificações rápidas testes salvam sua pele.



## Deve-se Esperar que A Internet Não Funcione
Quando você vê a pessoa fazendo e acha fácil, mas quando tenta é outra história. No final da disciplina do [Dr. Lásaro Jonas Camargos](https://lasarojc.github.io)
Foi apresentar um seminário sobre o que tinha entendido da rede peer to peer (P2P) chamada pastry não conhece ? veja o meu material [P2P Pastry](https://lasarojc.github.io/ds_notes/cases/pastry/). Quando Um cara é bom não se inventa, você o copia, foi o que tentei fazer nessa apresentação fiz um fork do seu projeto do github e busquei tentar ser tão didático quanto ele, falhei miseravelmente, fui iludido pela minha própria arrogância em achar conseguiria. Falha e falta são as palavras dá vez, a internet é um sistema distribuído fadado ao falhar e faltar o que podemos fazer é testes e sermos tolerantes, entenda, tolerância implica em redundância.

## IoT + Flutter
Casa de ferreiro, espeto de pau. Nunca um ditado popular tinha me machucado, o fato de eu ter passado uma graduação e provavelmente duas, sem usar
os meus conhecimentos de engenharia para melhorar meu ambiente, minha casa, incomoda. Ao contrário de Aplicativo comum de graduação aquele que  MVP, Produto Mínimo viável, cujo o objetivo é tirar 10 e depois ele não precisa mais existir. Esse aplicativo é razoavelmente testável a final o meu app flutter: [IOT app](https://github.com/samuel-cavalcanti/iot_app_ufrn) será modificado e mantido, pois ele será a base do meu Smart Home, controlando meu ventilador e teto e minha TV que os anunciantes dizem ser Smart. Já o esp8266 utilizei o platform.io com C++ a versão mais nova que tiver e sonhando com C++20 e seus modules. O platform.io pega C++, coloca um framework padrão de testes e com gerenciador de pacotes. Consigo manter um código dessa forma, apesar gostar de Rust, hardware é inseguro por padrão, mas nunca se sabe é bom ficar de olho.