# O que você precisa fazer

Essa é a última tarefa do bloco, e ela fecha um ciclo que começou lá na Tarefa 0: se aquela tarefa te ensinou a desconfiar de um relatório de scan antes de agir sobre ele, esta tarefa te ensina a desconfiar de uma correção antes de assumir que ela funcionou.

## Passo 1 — Verificação Pós-Patch: o teste tem que ser específico do TIPO de correção, não genérico

"Reescanear" não é uma resposta específica o suficiente sozinha. Pra cada uma das 3 remediações imediatas, pense: existe um arquivo de configuração que eu poderia abrir e ler diretamente pra confirmar a mudança? Existe um comando que eu rodaria de um host diferente pra confirmar que o acesso foi bloqueado? Existe uma versão de software que eu conferiria explicitamente? Quanto mais específico o teste, mais forte é sua resposta.

## Passo 2 — Pense num "teste positivo" além do "teste negativo"

Confirmar que um atacante NÃO consegue mais fazer algo é só metade da validação. A outra metade é confirmar que quem PRECISA continuar tendo acesso legítimo ainda tem — uma correção que quebra o acesso legítimo junto com o malicioso não é uma correção bem-sucedida, é um novo incidente esperando pra acontecer. Inclua esse tipo de verificação nos Controles Compensatórios especialmente (pense na ressonância: o PACS ainda precisa conseguir falar com ela).

## Passo 3 — Cronograma de Rescan: não escolha uma frequência única pra tudo

Nem todo ativo no ambiente da MedDefense tem o mesmo histórico ou a mesma exposição. Pense se algum host específico, que já apareceu repetidas vezes ao longo deste projeto por ter sido comprometido de verdade no passado, mereceria uma cadência de verificação diferente (mais apertada) do que o resto do ambiente.

## Passo 4 — Inteligência Contínua: conecte com um gap que você já conhece do 1x00

Antes de listar quais fontes de alerta a MedDefense deveria assinar, pense em *quem* vai realmente ler esses alertas — e lembre que o 1x00 já documentou um problema real de "ninguém revisa os logs/alertas que já existem". Sua resposta fica mais forte se você conectar a recomendação de inteligência contínua com esse gap já conhecido, ao invés de tratá-los como assuntos completamente separados.

## Passo 5 — O Diagrama de Ciclo de Vida pede responsáveis diferentes em cada etapa, não a mesma pessoa toda vez

Resista à tentação de escrever "Analista de Segurança" pra todas as seis etapas. Pense em qual etapa exige aprovação orçamentária (isso não é o analista), qual exige coordenação com uma equipe clínica (isso não é TI sozinha), e qual depende inteiramente de um fornecedor externo que a MedDefense não controla.

## Onde entregar

O arquivo final vai como `23-validation_plan.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As 5 seções completas: Verificação Pós-Patch, Validação de Controle Compensatório, Cronograma de Rescan, Inteligência Contínua, e o Diagrama de Ciclo de Vida.
