# 20. A Matriz de Prioridade

**Objetivo:** Produzir o cronograma definitivo de remediação de vulnerabilidades organizado por urgência.

## Contexto

Esse é o documento que vai pra mesa da Diretora de TI numa segunda-feira de manhã. Ele diz a ela: corrija isso hoje, isso até sexta, isso até o fim do mês, e isso até o fim do trimestre. Sem ambiguidade. Sem "depende". Ações claras, prazos claros, responsáveis claros.

## Instruções

Organize TODOS os achados "Acionáveis" (Crítico e Padrão da T16) numa Matriz de Prioridade com 4 horizontes de tempo:

| Horizonte | Prazo | Critério |
|---|---|---|
| Imediato | 24-48 horas | Exploit armado + ativo crítico + ameaça ativa |
| Curto prazo | 7 dias | CVE Crítico/Alto com PoC + ativo importante |
| Médio prazo | 30 dias | CVE Alto/Médio ou configuração incorreta significativa |
| Longo prazo | 90 dias | Mudanças de arquitetura, migrações de EOL, correções sistêmicas |

Para cada entrada: ID do Achado, descrição (uma linha), ação de remediação (uma linha), responsável e custo estimado.

Termine com um **Resumo de Orçamento**: Qual é o custo total estimado de todas as remediações? Como isso se compara ao orçamento anual de segurança de $120.000 do 1x00? O que precisa ser adiado, e por quê?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `20-priority_matrix.md`
