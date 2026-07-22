# O que você precisa fazer

Esse exercício é uma auditoria mecânica em escala — 18 controles, um por um — mas o valor real está em achar uma evidência específica pra cada um, não em preencher a tabela rápido.

## Passo 1 — Para cada controle, procure a evidência antes de decidir a nota

A ordem importa: não decida "isso provavelmente é Partial" e depois procure uma frase pra justificar. Faça o caminho inverso — releia o que você sabe dos três projetos anteriores sobre aquele controle específico, e deixe a evidência te dizer qual nota é honesta.

## Passo 2 — Alguns controles vão ter evidência abundante, outros vão ter pouca ou nenhuma — registre isso também

Nem todo controle teve um achado direto e óbvio nos projetos anteriores (por exemplo, Gestão de Provedores de Serviço ou Segurança de Software de Aplicação são menos óbvios que Gestão de Contas ou Defesas Contra Malware). Quando a evidência for indireta ou vier de um único incidente citado de forma tangencial, ainda assim cite exatamente essa fonte — não force uma evidência que não existe.

## Passo 3 — "Partial" é a nota mais fácil de usar errado — exija duas coisas dela, não uma

Pra marcar "Partial", você precisa conseguir dizer tanto o que EXISTE quanto o que FALTA no mesmo controle. Se você só consegue apontar o que existe (sem conseguir nomear a lacuna específica), a nota correta provavelmente é "Implemented". Se você só consegue apontar o que falta (sem nenhuma evidência de que algo já existe), a nota correta é "Not Implemented".

## Passo 4 — O Resumo do Scorecard é uma oportunidade de perceber um padrão, não só uma contagem

Depois de pontuar os 18, olhe pra distribuição total. Ela conta uma história parecida com alguma coisa que você já viu antes nesse projeto (pense na Tarefa 7 do bloco anterior, sobre a taxonomia de vulnerabilidades)? Vale a pena nomear esse padrão explicitamide no resumo, não só apresentar os números.

## Passo 5 — Os Top 5 Prioritários não são simplesmente "os 5 marcados como Not Implemented mais graves"

Pense em efeito cascata: qual controle, se implementado, tornaria outros controles mais fáceis ou mais eficazes? Um controle que sozinho quebra vários caminhos de ataque documentados no 1x01 merece prioridade mais alta que um controle isolado, mesmo que os dois estejam igualmente "Not Implemented".

## Onde entregar

O arquivo final vai como `2-cis_controls_audit.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os 18 controles pontuados, o Resumo do Scorecard, e os Top 5 Controles Prioritários.
