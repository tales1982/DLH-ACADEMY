# O que você precisa fazer

Esse é o exercício de síntese do bloco inteiro: ao invés de pesquisar coisa nova, você vai juntar tudo que já produziu nas Tarefas 0 a 9 (mais o 1x00 e o 1x01) em cima de 5 achados só. É deliberadamente o mais trabalhoso, porque é o que mais se parece com o relatório real que um SOC manager receberia.

## Passo 1 — Escolher os 5 não é "pegar os 5 CVSS mais altos"

O enunciado avisa isso explicitamente. Vários achados desse relatório empatam em CVSS 9.8. O que separa um dos outros é o contexto que você já construiu: qual ativo é isso (Top 5 Crítico do 1x00 T8, ou não?), esse achado aparece nomeado numa kill chain de verdade (1x01 T10), já foi explorado de verdade antes contra a MedDefense? Um achado com CVSS mais baixo mas presente numa kill chain documentada pode merecer um lugar nos seus 5 antes de um CVSS mais alto mas isolado.

## Passo 2 — Cada campo técnico tem uma fonte exata — não invente, vá buscar

- CVSS Base Score: da Tarefa 1 (ou do NVD direto, se você não pesquisou esse CVE específico antes)
- Disponibilidade de Exploit: da Tarefa 4 — se o CVE que você escolheu não estava entre os 5 que você já pesquisou lá, seja honesto que não foi verificado neste projeto, em vez de inventar uma nota
- CWE: da Tarefa 3 — mesma lógica
- Status no CISA KEV: da Tarefa 4

Se um desses dados não foi levantado em tarefas anteriores, está tudo bem dizer isso claramente ("não verificado neste projeto") — isso é mais honesto e mais profissional do que forçar um número.

## Passo 3 — "Posição na Cadeia de Ataque" pede pra você abrir o arquivo de kill chains e procurar de verdade

Não assuma que um achado "provavelmente" está em alguma kill chain — abra o arquivo `10-kill_chains.md` do 1x01 e procure pelo nome do host ou pelo Gap ID. Às vezes você vai achar uma correspondência exata (o achado é literalmente citado num passo). Às vezes você não vai achar nada — e essa ausência também é uma observação válida (pode ser uma lacuna na documentação das kill chains, não necessariamente prova de que o achado é menos importante).

## Passo 4 — "Ator de Ameaça" usa a Matriz do 1x01 T6, não seu palpite

Volte no arquivo `6-threat_actor_matrix.md` e veja qual tipo de ator já foi associado ao ativo ou ao vetor em questão. Às vezes mais de um tipo de ator se encaixa — tudo bem listar os dois, desde que você explique por quê.

## Passo 5 — A Justificativa final precisa amarrar TODAS as evidências, não só repetir a severidade

Não escreva "é crítico porque o CVSS é alto". Sua justificativa devia conseguir responder: por que ESSE achado, especificamente, merece estar entre os 5 mais importantes de todo o ambiente, considerando tudo — ativo, exploit, cadeia de ataque, ator e achados relacionados — junto.

## Onde entregar

O arquivo final vai como `10-critical_cves.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Os 5 pacotes de análise completos, cada um com todos os campos pedidos.
