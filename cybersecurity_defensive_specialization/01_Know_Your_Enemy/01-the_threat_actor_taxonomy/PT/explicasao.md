# O que você precisa fazer

Aqui você vira o "profiler" — recebe 8 relatórios de incidentes reais anonimizados e, só pelo **comportamento** descrito (sem nenhuma atribuição dada), precisa classificar quem provavelmente fez aquilo. É um exercício de dedução, não de memorização.

## Passo 1 — As 6 categorias e como reconhecê-las rapidamente

- **Estado-nação:** ferramentas customizadas, zero-days, permanência longa (meses/anos), alvo é propriedade intelectual/pesquisa, não dinheiro rápido.
- **Crime organizado:** motivação financeira direta, ransomware, exfiltração pra extorsão, ferramentas comerciais ou compradas.
- **Hacktivista:** mensagem política/ideológica, geralmente sem tentativa de aprofundar o acesso — o objetivo é a mensagem, não o dado.
- **Ameaça interna (insider):** o agente já tem (ou tinha até recentemente) acesso legítimo.
- **Atacante sem habilidade/oportunista:** ferramentas públicas, sem escolha específica de alvo, encontrado por varredura em massa.
- **Shadow IT:** não é bem um "atacante" — é uma fragilidade criada por alguém de dentro, sem intenção maliciosa, que abre uma porta pra outra coisa acontecer.

## Passo 2 — Os 4 atributos, um de cada vez

Para cada relatório, responda nessa ordem (cada resposta ajuda a próxima):
1. **Interno/Externo:** o agente estava dentro da organização, ou vindo de fora?
2. **Recursos:** ferramenta comercial/customizada = recursos altos; ferramenta pública/gratuita = recursos baixos.
3. **Sofisticação:** técnica exigia conhecimento avançado (zero-day, C2 sobre DNS) ou só usar algo já pronto (credencial padrão, exploit público)?
4. **Motivação:** escolha da lista Sec+ — não force "ganho financeiro" em tudo; olhe o que o relatório realmente mostra (revanche, ideologia, chantagem, etc.).

## Passo 3 — Uma armadilha específica: quem é "o agente" no Relatório F?

Releia com atenção: o funcionário da engenharia biomédica **não tinha intenção maliciosa** — ele só configurou um Raspberry Pi mal protegido. Pergunte-se: **o relatório está descrevendo o comportamento de quem, exatamente?** Tem duas "camadas" de agente nesse cenário — uma fragilidade (Shadow IT, sem intenção) e uma ação de ataque de fato (feita por outra parte). Pense em qual das duas é "o agente" que você deve classificar primeiro, e considere se vale mencionar as duas camadas na sua resposta.

## Passo 4 — O Relatório G é ambíguo de propósito — não force uma resposta única

O enunciado já avisa isso. Em vez de tentar "adivinhar a resposta certa", pense em **pelo menos dois tipos de agente que se encaixam igualmente bem** nas evidências dadas (conta legítima usada remotamente, sempre fora do horário, sempre do mesmo IP, foco em pacientes de alto valor, sem pedido de resgate, dado não apareceu na dark web ainda). Depois pergunte: que peça de evidência, se existisse, resolveria a ambiguidade? (Pense em: a senha do médico vazou em algum incidente anterior? O IP corresponde a algum lugar conhecido? Alguém mais tinha acesso àquela conta?)

## Passo 5 — Nível de Confiança não é sobre "quanto você entendeu", é sobre "quanto a evidência sustenta"

Um relatório com uma assinatura técnica clara (ex: malware customizado + certificado roubado + zero-day) permite confiança Alta na sofisticação/recursos, mesmo sem saber o nome do grupo. Um relatório com comportamento genérico e replicável por qualquer pessoa (ex: exploit público, sem escolha de alvo) também permite confiança Alta — só que pra uma classificação diferente (oportunista, não estado-nação). Confiança Baixa é reservada pra quando a evidência aponta em direções diferentes ao mesmo tempo, como no Relatório G.

## Onde entregar

O arquivo final vai como `1-threat_actor_taxonomy.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`. São 8 classificações completas, mais a reflexão extra sobre o Relatório G.
