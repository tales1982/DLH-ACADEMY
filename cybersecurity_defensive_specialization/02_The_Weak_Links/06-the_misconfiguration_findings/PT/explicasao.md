# O que você precisa fazer

Esse exercício é sobre defender um ponto de vista: vulnerabilidades sem CVE não são "menos importantes", elas só são invisíveis pras ferramentas que só sabem contar CVE. Você vai provar isso com 6 exemplos reais do próprio relatório.

## Passo 1 — Escolher os 6 achados: procure por "N/A" no campo CVE

Releia o relatório de scan procurando especificamente por achados onde o campo CVE diz "N/A (Configuração incorreta)" ou similar. Tente escolher achados variados — hosts diferentes, severidades diferentes (não pegue só os Críticos) — porque isso te dá mais material pra discutir na pergunta final.

## Passo 2 — "Por Que Não Tem CVE" não é sobre repetir "é configuração, não é CVE"

Essa pergunta quer que você explique o *mecanismo*: por que, tecnicamente, um scanner ou o próprio fornecedor do software nunca vai emitir um CVE pra isso. Pense: o software está fazendo exatamente o que foi configurado pra fazer? Se sim, não existe "bug" pra corrigir com patch — existe uma decisão administrativa pra corrigir com uma mudança de configuração.

## Passo 3 — Severidade é sua avaliação, não uma cópia do rótulo do relatório

O enunciado pede seu julgamento, justificado — não o rótulo que o scanner já deu. Antes de simplesmente concordar com o relatório, pergunte-se: esse achado toca um ativo Crítico segundo o Registro de Ativos (1x00 T7/T8)? Se sim, talvez sua nota deva ser mais alta que a do scanner, que não tem esse contexto de negócio. Não tenha medo de discordar do rótulo original, desde que justifique bem.

## Passo 4 — Cruzamento com o 1x00: procure a mesma coisa em três lugares diferentes

O 1x00 tem pelo menos três fontes onde uma exposição de rede como essa pode já ter aparecido: o walk-through físico (T3), a análise de lacunas de controle (T5, arquivo `5-control_gaps.md`) e o resumo do scan de rede original (T7, o arquivo `network-scan-summary.txt`). Vale a pena checar os três antes de decidir que "isso não apareceu antes" — muitas dessas exposições já estavam documentadas há dois projetos.

## Passo 5 — "Risco de CVE Comparável" pede uma comparação justa, não qualquer CVE aleatório

Escolha um CVE do mesmo relatório que tenha um nível de dano real parecido (mesmo tipo de dado exposto, mesmo tipo de ativo, ou mesma facilidade de abuso) e explique especificamente por que a comparação faz sentido — não basta dizer "os dois são graves", mostre o paralelo.

## Passo 6 — A pergunta final é sobre um argumento de gestão, não sobre técnica

A pergunta "por que essa afirmação é perigosa" está pedindo pra você defender, num parágrafo, um argumento que você pode ter que fazer de verdade um dia pra um executivo que só olha números de CVSS. Pense em quantos dos seus 6 achados ficariam completamente invisíveis num relatório que só lista CVEs — esse é o argumento.

## Onde entregar

O arquivo final vai como `6-misconfiguration_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Seis análises completas, mais o parágrafo final.
