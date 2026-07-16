# O que você precisa fazer

Esse exercício é o oposto do Task 16 em espírito: lá você tinha um documento longo e completo; aqui você tem **300 palavras, ponto final**. A habilidade sendo testada não é análise — é edição implacável. Você já fez todo o trabalho difícil; agora precisa cortar 95% dele sem perder o essencial.

## Passo 1 — Comece cortando, não escrevendo

Não tente escrever 300 palavras do zero. Pegue o Sumário Executivo que você já escreveu no Task 16 e pergunte, frase por frase: **"se eu tirar isso, o Conselho ainda consegue tomar a decisão de financiar?"** Se a resposta for sim, corte.

## Passo 2 — Traduzindo jargão técnico pra linguagem de Conselho

O enunciado proíbe siglas que o Conselho não conheceria. Isso significa reescrever, não só explicar entre parênteses. Alguns exemplos de como isso deveria soar:

| Jargão técnico | Linguagem de Conselho |
|---|---|
| "Rede sem segmentação (flat network)" | "Não existe separação entre nossos sistemas — se um for invadido, todos ficam vulneráveis" |
| "Sem MFA" | "O acesso aos nossos sistemas depende só de senha, sem uma segunda camada de verificação" |
| "SIEM" | "uma ferramenta que nos avisa quando algo suspeito acontece" |
| "Controle Detectivo/Corretivo" | Nem mencione a taxonomia — fale só do efeito prático: "não temos como perceber um ataque em andamento" |

## Passo 3 — Escolhendo O achado crítico único (não uma lista)

Você tem 19 lacunas documentadas. Aqui só cabe **uma**. Use o mesmo raciocínio do Task 16: qual lacuna aparece como causa raiz repetida em mais lugares do projeto inteiro? A ausência de detecção (GAP-002) é a candidata mais forte — ela é citada como fator em quase todo incidente da MedDefense e nas 3 violações reais do Task 13. Mas a decisão é sua: outra opção defensável é o MFA (GAP-014), já que ele foi elevado a Crítico exatamente por causar uma violação real e completa no Task 13.

## Passo 4 — As 3 Ações Prioritárias já estão prontas — só resuma

Não invente novas ações. Puxe direto das primeiras 3 linhas do seu Resumo de Orçamento do Task 14 (as de menor custo/maior impacto tendem a ser as melhores pra abrir aqui, como o conserto do armário de rede a quase custo zero). Para cada uma: o quê, custo, prazo — nada além disso.

## Passo 5 — Contando as palavras de verdade

300 palavras é pouco — cerca de 1 minuto e meio de fala em ritmo normal (o James vai ler isso em voz alta em 5 minutos, com pausas). Depois de escrever, conte de verdade (a maioria dos editores de texto mostra contagem de palavras). Se passar, corte adjetivos e frases de transição antes de cortar conteúdo — "é importante notar que" nunca precisa estar num briefing de 300 palavras.

## Passo 6 — O teste final do próprio enunciado

Releia com a pergunta que o enunciado dá: **"um executivo não técnico conseguiria ler isso e tomar uma decisão de financiamento?"** Se sobrar qualquer trecho que só faz sentido pra quem leu os Tasks 0-16, ainda não está pronto.

## Onde entregar

O arquivo final vai como `17-ciso_briefing.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`. Esse é o único arquivo do projeto inteiro com limite de palavras rígido — respeite os 300.
