# 16. Diff de Melhoria do Lynis

**Objetivo:** Comparar os resultados do Lynis antes e depois do hardening e produzir um relatório estruturado de melhoria.

## Contexto

Sarah Park precisa de um relatório que mostre quais achados desapareceram, quais permanecem, e se o hardening introduziu novos problemas.

## Instruções

Escreva `16-lynis_diff.sh`.

O script precisa ler `lynis_findings.json` e `lynis_post_findings.json`, ou gerar o arquivo pós-hardening rodando o Lynis e analisando o resultado.

O script precisa escrever `hardening_improvement.json` com:

- `before_score`
- `after_score`
- `delta`
- `resolved_findings`
- `remaining_findings`
- `new_findings`
- `resolved_count`
- `remaining_count`
- `new_count`
- `residual_risk_summary`

## Saída Esperada

```
$ sudo ./16-lynis_diff.sh
Before: 52
After: 84
Delta: +32
Findings resolved: 41
Findings remaining: 22
New findings: 4
Report saved to: hardening_improvement.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `16-lynis_diff.sh`
