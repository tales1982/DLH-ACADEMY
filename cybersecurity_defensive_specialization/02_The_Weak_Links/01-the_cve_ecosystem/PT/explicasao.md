# O que você precisa fazer

Este exercício é sobre criar o hábito de navegação no NVD — o tipo de reflexo que você vai usar toda semana como analista. Não é sobre decorar teoria de CVE, é sobre ir lá, achar a página, e saber ler o que ela te mostra.

## Passo 1 — Escolha os 3 CVEs com critério

Você precisa de um Crítico, um Alto e um Médio. Olhe o relatório de scan e note uma coisa: nem todo achado tem CVE (muitos são configuração incorreta, sem CVE nenhum). Além disso, repare que o próprio relatório rotula alguns achados com uma severidade que pode não bater com o que o NVD diz — isso não é erro seu, é um dado real que vale a pena registrar quando aparecer.

## Passo 2 — Navegue de verdade, não resuma o que já sabe

Vá em nvd.nist.gov, procure o CVE pelo ID exato, e leia a página inteira antes de escrever qualquer coisa. Preste atenção em duas seções que são fáceis de pular: os **CPEs** (produtos/versões afetados) e as **Referências** (que costumam ter links de tipos bem diferentes — um aviso do fornecedor não é a mesma coisa que um exploit público).

## Passo 3 — A descrição é sua, não um copiar-e-colar

A tarefa pede pra você reescrever a descrição com suas próprias palavras. Isso não é só uma regra de plágio — é um teste de se você entendeu o mecanismo da vulnerabilidade ou só decorou o texto.

## Passo 4 — As perguntas de ecossistema pedem mecanismo, não definição de dicionário

- Pra estrutura do ID: pense por que o "ano" no CVE não é necessariamente o ano em que a falha foi descoberta.
- Pra CNA: pense em por que faria sentido (ou não) a Microsoft ou a Apache poderem emitir seus próprios IDs de CVE, ao invés de tudo passar por uma única organização central.
- Pros estados de ciclo de vida: pense no que acontece com os dados de um CVE quando ele muda de "Published" pra "Rejected" — o que desaparece da página?

## Passo 5 — Achar um CVE "Rejected" é uma caça, não uma pergunta teórica

Não existe uma lista fácil de "CVEs rejeitados" pra navegar direto. Você vai precisar pesquisar. Uma boa estratégia: procure por vulnerabilidades que tiveram CVEs duplicados (a mesma falha relatada duas vezes, por engano) — esse é um dos motivos mais comuns de rejeição, e não é difícil de achar um exemplo real assim.

## Onde entregar

O arquivo final vai como `1-cve_ecosystem.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. São as 3 análises completas de CVE, mais as 4 perguntas de ecossistema.
