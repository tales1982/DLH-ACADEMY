# O que você precisa fazer

Diferente do Task 8 (que olhava pra **ativos**), aqui o foco é o **dado em si**, seguindo ele pelos 3 estados que você já estudou no `guia-de-estudo.html`: em repouso, em trânsito, em uso. Você precisa de no mínimo 7 categorias de dado, cada uma com uma linha completa na tabela.

## Passo 1 — Não confunda "categoria de dado" com "sistema"

O Task 8 pedia pra agrupar por sistema/ativo. Este pede pra agrupar por **tipo de informação**, independente de onde ela mora. Exemplos de categorias (o enunciado já sugere 7):

1. Prontuários médicos (EHR)
2. Dados de imagem médica (PACS)
3. Dados financeiros/faturamento
4. Registros de RH de funcionários
5. Credenciais de sistema (senhas, chaves)
6. Logs de auditoria
7. Dados de pesquisa/ensaios clínicos (se a MedDefense tiver isso — releia o Task 0, pode não haver evidência, e nesse caso é honesto dizer que não foi confirmado)

## Passo 2 — Preenchendo os 3 estados, usando o que você já sabe

Você já tem quase tudo isso espalhado pelas tasks anteriores. Alguns exemplos prontos pra você reaproveitar:

- **Prontuários médicos — Em Repouso:** `ehr-db-01` (Task 0/7). **Em Trânsito:** rede interna, sem segmentação (Task 0/6). **Em Uso:** posto de enfermagem — e aqui você já tem uma lacuna documentada: a sessão aberta sem bloqueio automático (Task 3, Observação 3).
- **Dados de imagem médica — Em Repouso:** `pacs-srv-01` (Task 0/7), que você já sabe que **não é coberto pelo backup** (Task 4/7) — isso já é uma lacuna em repouso.
- **Credenciais de sistema — Em Uso:** login compartilhado da radiologia (`raduser/radiology1`, Task 0) — ótimo exemplo de lacuna em uso, porque elimina responsabilização individual.

## Passo 3 — A coluna "Lacunas de Proteção" é o coração do exercício

Para cada categoria, você tem 3 chances de achar uma lacuna (uma por estado). Nem toda categoria vai ter lacuna nos 3 — tudo bem, seja honesto. Mas sempre pergunte:

- **Em Repouso:** o dado está criptografado? Está no mesmo lugar que o backup dele (lembra do NAS-01 no mesmo rack, Task 4/5)?
- **Em Trânsito:** a rede por onde ele passa é segmentada, ou é a mesma rede plana que já identificamos em quase toda task anterior?
- **Em Uso:** quem consegue ver a tela? A sessão expira sozinha? Existe MFA pra acessar?

## Passo 4 — O Resumo de Risco de Dados final

A pergunta pede pra você escolher **uma** combinação categoria+estado como a pior de todas. Pense assim: qual categoria tem a classificação mais alta (Restrito) combinada com a lacuna mais grave num dos três estados? Isso normalmente aponta pra Prontuários Médicos em algum estado específico — mas justifique com um fato concreto, não com uma opinião genérica.

## Onde entregar

O arquivo final vai como `9-data_map.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
