# O que você precisa fazer

Esta é a tarefa que junta tudo que você construiu no projeto inteiro. É also a base pras próximas três tarefas (18, 19 e 20 vão reaproveitar os mesmos 8 achados) — então escolher bem aqui economiza retrabalho depois.

## Passo 1 — Escolha os 8 achados pensando nas tarefas seguintes, não só nesta

Releia rapidamente o enunciado das Tarefas 18 e 19 antes de escolher — ambas dizem "seus 8 achados priorizados da T17". Isso significa que o conjunto que você escolher aqui precisa ter variedade suficiente pra sustentar uma matriz de correlação de ameaças (T18) e um mapa de remediação (T19) interessantes. Prefira 8 achados que cubram hosts, tipos de ativo e padrões de ameaça diferentes, ao invés de 8 variações do mesmo servidor.

## Passo 2 — Antes de recalcular, confirme que o vetor CVSS que você está usando está certo

Um vetor CVSS e uma nota final precisam ser matematicamente consistentes — se você pegar um vetor de um achado e ele não bater com a nota que o relatório (ou até o NVD) afirma, vale a pena conferir a fonte original antes de seguir em frente. Isso já aconteceu neste projeto antes (lembra da discrepância de contagem no Task 0?) — não assuma que todo dado que você recebeu está livre de erro de transcrição.

## Passo 3 — Cada Fator te pede pra decidir uma direção (sobe ou desce), não só descrever

Não escreva só "o ativo é crítico" no Fator 1 — escreva se isso empurra a prioridade pra cima ou não muda nada, e por quê. O mesmo vale pros outros três fatores. Alguns achados vão ter os 4 fatores empurrando na mesma direção (fácil). Outros vão ter um fator puxando contra os outros três (por exemplo: um achado num ativo menos crítico, mas com histórico real de exploração) — esses são os casos mais interessantes de analisar.

## Passo 4 — O CVSS Ambiental na calculadora tem um limite que vale a pena entender

Ao usar a seção de Métricas Ambientais da calculadora do NIST (CR/IR/AR — Confidentiality/Integrity/Availability Requirement), você vai notar que, pra achados cujo vetor base já tem C:H/I:H/A:H, aumentar os requisitos ambientais às vezes NÃO muda o número final — a fórmula tem um teto interno pro subscore de impacto. Isso não é um erro seu nem da calculadora: é uma propriedade real do CVSS v3.1, e vale a pena mencionar quando acontecer, ao invés de forçar um número diferente que "parece" mais correto.

## Passo 5 — Procure especificamente por achados onde o recálculo ambiental MUDA a conversa

O valor real desta tarefa não está nos achados que já eram óbvios como Críticos antes e continuam Críticos depois — está nos achados onde a nota base (ou o rótulo do scanner) sugeria uma coisa, e o contexto ambiental revela outra. Se, entre os seus 8, nenhum mostrar uma mudança visível de prioridade, considere se você escolheu achados variados o suficiente no Passo 1.

## Passo 6 — Controles Compensatórios: volte no inventário de controles do 1x00, não assuma que "provavelmente tem algum controle"

Releia o arquivo `4-control_inventory.md` do 1x00 e confira, pra cada host dos seus 8 achados, se algum controle da lista (C-001 a C-013) realmente protege *esse serviço específico*, não só *esse host em geral*. Um host pode ter controles documentados que protegem uma superfície completamente diferente da vulnerabilidade que você está analisando — isso conta como "não mitiga", não como "mitiga parcialmente".

## Onde entregar

O arquivo final vai como `17-cvss_contextualizer.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Os 8 achados completos com os 4 fatores cada, mais a Tabela de Comparação de Prioridade.
