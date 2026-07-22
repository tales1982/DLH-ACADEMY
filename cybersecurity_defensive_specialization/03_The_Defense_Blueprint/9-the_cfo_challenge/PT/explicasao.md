# O que você precisa fazer

Essa é a tarefa de comunicação mais desafiadora do bloco: você não está mais escrevendo pra outro analista de segurança, está escrevendo pra alguém cujo trabalho é ser cético com números.

## Passo 1 — Nunca comece uma réplica discordando

Releia a estrutura pedida: "Reconhecimento" vem ANTES de "Contra-Evidência". Se sua primeira frase já contesta o CFO, você perdeu o tom certo. Comece genuinamente concordando com a parte da objeção que é razoável — isso não é fraqueza, é o que faz a contra-argumentação seguinte ser ouvida.

## Passo 2 — "Contra-Evidência" precisa ser um número específico da SUA análise, não uma afirmação genérica

Não escreva "isso é importante para a segurança dos pacientes." Escreva o número exato das Tarefas 6, 7 ou 8 que responde diretamente àquela objeção específica. Cada objeção do CFO tem um número ou suposição específica embutida nela — sua contra-evidência precisa mirar exatamente nesse ponto, não no assunto genérico da segurança.

## Passo 3 — Uma das objeções é sobre a PRECISÃO da sua matemática — responda sobre precisão, não sobre o assunto

Quando o CFO questiona se seus números podem estar errados por um fator de dois, a resposta certa não é defender que seus números estão certos. É mostrar que a decisão continua sendo a certa MESMO SE os números estiverem errados por essa margem — isso é chamado de teste de sensibilidade, e é um argumento bem mais forte do que insistir na precisão da estimativa original.

## Passo 4 — Quando o CFO tiver um ponto genuinamente válido, ceda de verdade — não finja ceder

Pelo menos uma das 5 objeções tem um argumento real por trás (seguro já existir, ou a ideia de começar menor e escalar depois). Nessas, não tente "vencer" a objeção — mostre como incorporar o que ela pede de forma que ainda proteja o programa. Uma concessão genuína, bem construída, é mais convincente que uma defesa que finge não ter ouvido o ponto.

## Passo 5 — A Declaração de Encerramento precisa comparar dois números específicos, lado a lado

Não termine com uma frase motivacional genérica sobre a importância da segurança. Termine com dois números concretos: o custo total estimado de não fazer nada (a soma dos ALEs dos seus riscos principais) versus o custo do programa que você está propondo — e deixe a proporção entre os dois falar por si só.

## Onde entregar

O arquivo final vai como `9-cfo_challenge.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. As 5 réplicas estruturadas, mais a Declaração de Encerramento.
