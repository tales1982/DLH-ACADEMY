# O que você precisa fazer

Este exercício é diferente dos dois anteriores: aqui você não está organizando informação, está **investigando um artefato técnico real** (uma saída de `top` + `netstat`) e precisa chegar a uma conclusão de segurança sozinho, sem que o texto te entregue a resposta. É o exercício mais próximo de um caso real de resposta a incidente até agora.

## Passo 1 — Leia a saída técnica como um investigador, não como um leitor

Você tem duas fontes de evidência no arquivo `billing-srv-01_diagnostics.txt`:

- **`top`**: mostra processos rodando e o quanto de CPU/memória cada um consome.
- **`netstat`**: mostra conexões de rede ativas — de onde para onde, e em que estado.

A primeira pergunta do enunciado ("O que o `kworker` está fazendo?") é a chave de tudo. Repare em três detalhes que, juntos, são um alerta enorme:

1. O processo se chama `kworker` — esse é o nome de um processo *legítimo* do kernel do Linux (kernel worker threads). Mas um `kworker` de verdade não roda como `./kworker` (um executável em um diretório, não um processo do kernel) e não recebe argumentos de linha de comando como `-o stratum+tcp://...`. Isso é uma técnica clássica de **disfarce**: dar a um processo malicioso o nome de algo que parece inofensivo para passar despercebido em uma lista de processos.
2. `stratum+tcp://` é o protocolo usado por **mineradores de criptomoeda** para se conectar a um *pool* de mineração. Pesquise "stratum protocol mining" se não conhece — é um padrão bem documentado.
3. `pool.monero.org` — Monero é uma criptomoeda historicamente associada a mineração maliciosa (cryptojacking), porque seu algoritmo de mineração funciona bem em CPUs comuns (diferente do Bitcoin, que exige hardware especializado) — ou seja, é fácil de minerar "escondido" em qualquer servidor comprometido.

Junte os três pontos e você tem a resposta da primeira pergunta: não é uma questão de hardware subdimensionado, é **um processo de cryptojacking disfarçado**, consumindo CPU para minerar criptomoeda em nome de um atacante.

## Passo 2 — Não pare na CPU. Pergunte "como esse processo chegou até aqui?"

Esse é o cerne do nome do exercício — "a armadilha do sintoma." O administrador de sistemas viu o sintoma (CPU alta) e parou por aí. Seu trabalho é ir um passo atrás: **para um processo malicioso estar rodando e se conectando à internet, alguém teve que colocá-lo ali.**

Pergunta 2 do enunciado pede os **dois pilares CIA violados antes da Disponibilidade**. Pense na ordem cronológica dos eventos, não na ordem em que você percebeu os sintomas:

- Antes de qualquer coisa rodar no servidor, alguém precisou **obter acesso não autorizado** a ele. Isso já viola um pilar.
- Depois de ter acesso, o atacante **instalou e executou um binário que não deveria estar ali** — isso é uma alteração do estado do sistema sem autorização. Isso viola outro pilar.
- Só como consequência de tudo isso é que a CPU satura e o serviço de faturamento fica lento — isso é o efeito em Disponibilidade, que é o que o time de TI percebeu por último na cadeia, mas é listado primeiro na percepção deles.

Dica: releia as definições da Tríade CIA do Task 1 (`1-incident_classification`) se precisar — a lógica "causa vs. efeito" que você praticou lá se aplica exatamente aqui.

Repare também no `netstat`: há **duas** conexões `ESTABLISHED` para IPs externos diferentes, não uma só. Pergunte-se se as duas têm necessariamente a mesma função (uma é claramente o pool de mineração — mas o que seria a outra?).

## Passo 3 — Por que "comprar hardware melhor" não resolve nada

Pense assim: se você aumentar a capacidade de CPU do servidor, o que acontece com um processo que já está programado para consumir o máximo de CPU disponível? E, mais importante — o hardware não tem nenhuma relação com **como o atacante entrou**. Um upgrade de hardware não fecha a porta de entrada nem remove o acesso que o atacante já conquistou.

## Passo 4 — A pergunta mais importante do exercício

O enunciado pede para você conectar este achado ao ransomware de janeiro (Incidente A, que você já classificou no Task 1). Dois comprometimentos diferentes, no mesmo servidor, em meses diferentes. Isso não é coincidência estatística — é um padrão. A pergunta que você deve fazer não é "o que aconteceu" (você já sabe: ransomware, depois cryptojacking) — é:

> **"O que permitiu que os dois acontecessem? O servidor foi reconstruído depois do ransomware — mas o que exatamente foi corrigido na reconstrução, além de reinstalar o sistema?"**

Se ninguém corrigiu a vulnerabilidade ou o vetor de acesso original (lembra dos achados do Task 0: `ehr-db-01` acessível por toda a rede /16, SSH com senha habilitado, rede plana sem segmentação?), reconstruir o servidor do zero só reseta o sintoma — a porta pela qual o primeiro atacante entrou provavelmente continua aberta para o próximo.

## Passo 5 — Onde entregar

O arquivo final vai como `2-root_cause_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch` — mesmo padrão das tasks anteriores. Estruture sua resposta seguindo as 4 perguntas do enunciado, cada uma bem justificada com base na evidência do `top`/`netstat`, sem inventar detalhes que os logs não mostram.

---

Quer que eu te ajude a interpretar a segunda conexão do `netstat` (a que não é o pool de mineração) como próximo passo, ou prefere pesquisar sozinho primeiro?
