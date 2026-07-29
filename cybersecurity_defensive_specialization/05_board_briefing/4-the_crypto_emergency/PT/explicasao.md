# O que você precisa fazer

Essa tarefa conecta a criptografia (1x04) com o incidente atual. É fácil tratar criptografia como um assunto teórico — essa tarefa força você a mostrar exatamente como a AUSÊNCIA de criptografia vira uma porta de entrada real para um atacante.

## Passo 1 — Nem toda fase do Crimson Tide tem uma causa criptográfica

Das 7 fases, provavelmente só 2 ou 3 têm relação direta com criptografia (Fase 4 — exfiltração de banco de dados sem criptografia, e Fase 5 — destruição de backups sem criptografia, são os candidatos óbvios). Não force uma conexão criptográfica em fases como "Movimento Lateral" só para preencher a tabela — se não existe uma fragilidade criptográfica ali, não inclua essa fase na Parte 1.

## Passo 2 — "Acelerar para 72 horas" é uma pergunta com resposta real, não retórica

Pense de verdade: criptografar um banco de dados de produção em produção, com pacientes usando o sistema, é uma operação que normalmente exige planejamento, teste e uma janela de manutenção — isso NÃO cabe em 72 horas com segurança. Já isolar/criptografar o backup no NAS pode ser mais rápido. Seja honesto sobre o que é realista tecnicamente, mesmo sob pressão do Board.

## Passo 3 — A reordenação de prioridades precisa de uma justificativa que cite o ataque

Não basta dizer "backup encryption agora é #1". Diga POR QUE: porque o Crimson Tide destrói backups especificamente para impedir recuperação sem pagamento, e isso é a etapa mais crítica e mais rápida de corrigir das duas.

## Passo 4 — O "E Se" tem uma resposta técnica específica, não é livre

Preste atenção na pista que o próprio enunciado te dá: "a chave de criptografia está armazenada no MESMO servidor" e o atacante tem acesso de domain admin. Pense: se a chave está acessível no mesmo lugar que os dados, criptografia em repouso sozinha protege contra o quê exatamente (roubo do disco físico, backup perdido) e contra o quê ela NÃO protege (um atacante com acesso administrativo ao próprio servidor rodando o banco de dados). Essa distinção é o ponto central da resposta.

## Onde entregar

O arquivo final vai como `4-crypto_emergency.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
