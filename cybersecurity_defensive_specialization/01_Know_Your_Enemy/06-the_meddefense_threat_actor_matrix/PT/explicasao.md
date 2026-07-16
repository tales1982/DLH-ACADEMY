# O que você precisa fazer

Essa tarefa é uma consolidação — você não está descobrindo nada novo, está reorganizando tudo que já sabe sobre os 6 tipos de ator num formato de referência única. O desafio real está em manter consistência com o que você já escreveu nas Tarefas 1-5, não em inventar avaliações novas.

## Passo 1 — Nem todo ator recebe o mesmo nível de detalhe no seu material anterior

Ransomware (Tarefa 2) e insiders (Tarefa 3) você já analisou em profundidade. Nation-State APT, Hacktivista e Atacante Oportunista provavelmente só apareceram de forma mais leve na Tarefa 1 (taxonomia). Está tudo bem — para esses, apoie-se no conhecimento geral do setor de saúde (por que um Estado-Nação se interessaria por dados médicos? Por que um hacktivista miraria um hospital especificamente?) combinado com o perfil real da MedDefense.

## Passo 2 — Probabilidade não é a mesma coisa para todos os atores

Pense assim: ransomware e insider negligente devem ter Probabilidade alta pra praticamente qualquer hospital do tamanho da MedDefense (dados do setor sustentam isso fortemente). Nation-State e Hacktivista tendem a ter Probabilidade mais baixa — a menos que você identifique algo específico na MedDefense (parceria de pesquisa, posicionamento político, etc.) que mude isso.

## Passo 3 — "Exposição da MedDefense" é o campo mais importante da tabela

É aqui que você prova que a análise é sobre a MedDefense e não genérica. Cada ator precisa apontar pra Gap IDs reais do 1x00 — não repita os mesmos gaps pra todos os atores. Pergunte-se: um insider malicioso explora gaps de controle de acesso; um atacante oportunista explora gaps de credenciais padrão e sistemas desatualizados; um Estado-Nação exploraria uma cadeia mais sofisticada.

## Passo 4 — O Top 3 precisa combinar dois eixos, não só ranquear por "medo"

Um ator de baixa probabilidade mas altíssimo impacto pode ou não superar um ator de alta probabilidade e impacto médio — isso depende de como você pesa os dois eixos. Escreva a justificativa de cada um dos 3 explicando explicitamente como você combinou probabilidade e impacto pra chegar naquela posição, não só "porque é o mais perigoso."

## Onde entregar

O arquivo final vai como `6-threat_actor_matrix.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
