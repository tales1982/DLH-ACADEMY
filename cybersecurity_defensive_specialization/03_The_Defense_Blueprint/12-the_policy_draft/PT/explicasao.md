# O que você precisa fazer

Essa é a tarefa de escrita mais diferente do bloco inteiro — você não está analisando nem calculando, está redigindo um documento de verdade que uma pessoa não-técnica vai ler e assinar.

## Passo 1 — Escreva pensando em quem vai realmente ler isso, não em quem vai auditar

Antes de escrever cada seção, imagine uma enfermeira no meio de um plantão lendo esse documento. Se uma frase exige que ela pare e releia duas vezes pra entender, reescreva mais simples. Isso não significa ser vago — significa ser direto.

## Passo 2 — "Atividades Proibidas" precisa nomear um risco real, não copiar uma lista genérica de internet

Toda política de uso aceitável do mundo proíbe "compartilhar senha" e "instalar software não autorizado" — isso é genérico e fácil de ignorar. Ao invés disso, conecte cada proibição com um incidente ou achado específico que você já documentou nos projetos anteriores (o Raspberry Pi do engenheiro biomédico, o laptop pessoal do estagiário, o funcionário que voltou a acessar após ser demitido). Uma regra que nasce de um incidente real da própria organização é levada muito mais a sério do que uma regra genérica.

## Passo 3 — Dispositivos Pessoais precisa equilibrar duas coisas que parecem contraditórias

De um lado, você já viu shadow IT causar problemas reais (1x00). Do outro lado, uma política longa demais e assustadora demais vai ser ignorada, especialmente por médicos que trazem seus próprios equipamentos e não gostam de ser questionados. Pense em como escrever uma regra clara e justificável, sem soar como uma ameaça vazia.

## Passo 4 — Requisitos de Senha/MFA precisam bater com o que você já decidiu nas Tarefas 6/7/8/11

Não invente requisitos novos aqui — puxe diretamente da decisão de MFA que você já tomou e já orçou em tarefas anteriores. Essa política é onde essa decisão técnica vira uma regra formal que todo mundo tem que seguir, incluindo médicos e executivos (releia por que isso é importante — o enunciado já avisa: "sem exceções").

## Passo 5 — Monitoramento e Aplicação precisa ser proporcional, não ameaçador

Não escreva que toda violação leva à demissão — isso é implausível e mina a credibilidade da política inteira. Pense em uma escala de resposta real: um erro honesto de primeira vez é diferente de uma violação deliberada e repetida, que é diferente de uma atividade claramente maliciosa. Trate as três de forma diferente na sua política.

## Passo 6 — Respeite o limite de 2-3 páginas — isso é um critério de qualidade, não uma sugestão

Um documento de política longo demais falha no propósito dele mesmo antes de ser lido. Se sua primeira versão passar muito de 3 páginas, corte, não acrescente mais seções.

## Onde entregar

O arquivo final vai como `12-acceptable_use_policy.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. As 8 seções completas, incluindo o bloco de assinatura.
