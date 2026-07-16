# O que você precisa fazer

Esse é o exercício mais "de negócio" do projeto até agora. Você não está mais só apontando problemas — está decidindo **o que fazer** sobre eles, com dinheiro de verdade e limitado ($120.000). Pegue as 7 lacunas de maior prioridade que você já tem no Task 12/13 e decida uma estratégia pra cada uma.

## Passo 1 — Escolhendo entre Mitigar / Transferir / Aceitar / Evitar

A pergunta chave pra cada lacuna: **dá pra resolver com um controle técnico/administrativo/físico razoável (Mitigar)? Ou faz mais sentido jogar o risco financeiro pra outra empresa (Transferir)? Ou o custo de resolver é maior que o prejuízo esperado (Aceitar)? Ou a única solução real é parar de fazer aquilo (Evitar)?**

Algumas pistas de quando usar cada uma, baseadas no que você já sabe da MedDefense:

- **Mitigar** é a escolha padrão pra maioria das lacunas técnicas com solução conhecida — ex: falta de MFA, falta de alerta automático, antivírus sem cobertura completa. Você já tem o controle compensatório do MRI (Task 6) como um exemplo de "Mitigar" bem documentado — pode reaproveitar aquele raciocínio de custo/esforço/redução de risco.
- **Transferir** faz sentido pra riscos que são caros de eliminar tecnicamente mas baratos de segurar — ex: o risco residual de um ataque de ransomware bem-sucedido pode ser parcialmente transferido via seguro cibernético, mesmo que você também mitigue tecnicamente.
- **Aceitar** só é válido com justificativa de verdade — não é "não temos tempo", é "o custo de corrigir isso é maior que a perda esperada". Ex: o `print-srv-01` fora de suporte (Task 4/7) pode ser um bom candidato a Aceitar, já que é baixo valor como alvo — mas você precisa justificar com números, não só dizer "é pouco importante".
- **Evitar** é raro, mas pode se aplicar a algo como o Shadow IT do Task 11 — "evitar" o risco do Google Drive pessoal do Marketing pode significar simplesmente proibir o uso e não oferecer alternativa (embora Migrar geralmente seja mais razoável nesse caso).

## Passo 2 — Preenchendo os campos condicionais

Repare que o enunciado só pede os campos extras **da estratégia que você escolheu** — não preencha "Estimated Cost" numa lacuna que você decidiu Aceitar, por exemplo. Isso é de propósito: cada estratégia tem sua própria "prova" de que foi bem pensada.

## Passo 3 — Sendo realista nas estimativas de custo e esforço

Você já tem números reais espalhados pelo projeto pra usar como referência, em vez de chutar:
- Backup em nuvem: **$14.400/ano** (cotação já recebida, Task 0/4)
- SIEM (Wazuh, open-source): baixo custo de licença, mas esforço de implementação real
- Guarda de segurança adicional: pense na faixa de custo do contrato atual (Task 4, ClearView)
- MFA: pode ser $0 se já está incluído no O365 E3 que a MedDefense já paga (Task 0)

Use esse tipo de raciocínio pra estimar as outras — "isso é mão de obra interna" tende a ser mais barato que "isso é uma licença nova de software corporativo".

## Passo 4 — O Resumo de Orçamento é o teste final

Some o "Estimated Cost" de todas as lacunas que você marcou como Mitigar. Se passar de $120.000 (o que é bem provável, já que o James avisou que um único SIEM já consome quase 70% disso), você precisa **escolher o que fica pra depois** — e justificar com base em criticidade: o que é Crítico fica, o que é Alto pode esperar o próximo ano fiscal, dependendo do quanto sobra de orçamento.

## Onde entregar

O arquivo final vai como `14-risk_decisions.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
