# O que você precisa fazer

Esse exercício cobre três sistemas ao mesmo tempo, todos EOL, mas em estágios bem diferentes de abandono — e termina com uma decisão de negócio de verdade, com orçamento limitado.

## Passo 1 — A Pesquisa de EOL vai dar resultados bem diferentes pros três sistemas, e isso já é uma resposta

Windows XP está fora de suporte há mais de uma década — pesquise no NVD e você provavelmente vai achar poucos ou nenhum CVE **novo** especificamente atribuído a ele nos últimos 2 anos. Não interprete isso como "então ele é seguro" — pense no motivo oposto: ninguém mais está nem procurando. Já o Windows Server 2012 R2 (fim de suporte mais recente, ainda dentro da janela de ESU paga) e o Ubuntu 18.04 (cujos pacotes específicos, tipo o Apache, continuam recebendo CVEs novos toda hora) vão te dar resultados reais e recentes — pesquise pela versão exata do pacote (ex: "Apache 2.4.29" ou o intervalo de versões que inclui ela) pra achar os CVEs que realmente afetam essa máquina específica, não qualquer CVE do produto em geral.

## Passo 2 — "Exposição Permanente" pede uma explicação de mecanismo, não uma definição

Não escreva só "EOL significa que não recebe mais patches." Explique por que isso é estruturalmente diferente de "vulnerabilidade não corrigida ainda": um patch não aplicado pode ser aplicado amanhã; um patch que nunca vai existir é um risco que só cresce, nunca fecha, nenhuma quantidade de esforço de patching resolve isso.

## Passo 3 — "Achados do Scan" pede uma distinção específica: qual sintoma é causado pelo EOL, e qual não é

Nem todo achado num host EOL existe *por causa* do EOL. No servidor de faturamento, por exemplo, tem achados de configuração (senha SSH, bind de rede) que existiriam mesmo que o sistema fosse totalmente suportado — e tem achados que só existem porque nenhum patch nunca mais vai chegar. Separe os dois tipos explicitamente.

## Passo 4 — Controles Compensatórios: volte no arquivo original do 1x00 Task 6, não invente

Pro Sistema 1 (ressonância), o 1x00 já tem um documento inteiro (`6-compensating_controls.md`) com três controles propostos especificamente pra esse dispositivo. Leia esse arquivo e responda com precisão: cada um desses controles foi realmente implementado? O próprio scan atual te dá a resposta, se você souber o que procurar (será que as portas que o Controle 1 deveria ter fechado ainda aparecem abertas no scan de agora?). Pros outros dois sistemas, não existe um documento equivalente no 1x00 — isso também é uma informação relevante pra sua resposta.

## Passo 5 — A Decisão de Negócio é o ponto alto do exercício — não escolha só pelo "mais crítico"

Antes de responder, separe duas perguntas que parecem a mesma mas não são: "qual desses três ativos é o mais crítico?" (isso você responde com a Matriz de Criticidade do 1x00) e "qual desses três é realista migrar pra fora do EOL em UM trimestre, com orçamento limitado?" (isso exige pensar em viabilidade prática — trocar o sistema operacional de um servidor é muito diferente de recertificar um equipamento médico inteiro). A resposta certa pode não ser o ativo "mais crítico" no papel, se migrá-lo simplesmente não é uma coisa que dá pra fazer em três meses.

## Onde entregar

O arquivo final vai como `12-legacy_systems.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As 5 seções completas para cada um dos 3 sistemas, mais a Decisão de Negócio final.
