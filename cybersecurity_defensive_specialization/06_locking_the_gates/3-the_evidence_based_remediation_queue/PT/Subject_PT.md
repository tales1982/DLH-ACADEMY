# 3. Fila de Remediação Baseada em Evidências

**Objetivo:** Converter o perfil de controles CIS e os achados do Lynis em uma fila de remediação priorizada e baseada em evidências.

## Contexto

Essa tarefa se torna o motor de decisão que explica por que as Tarefas 4-13 são executadas e em qual ordem. Todo item de remediação precisa ser sustentado por evidência, mapeado para um script de hardening posterior, e ordenado por risco.

## Instruções

Escreva `3-remediation_queue.sh`.

O script precisa ler `cis_profile.json` e `lynis_findings.json`, e então produzir `gap_analysis.json` e `remediation_queue.json`.

Para cada controle CIS, determine um status: `compliant`, `non_compliant`, `partially_compliant`, ou `not_assessed`.

Para todo controle não conforme ou parcialmente conforme, inclua:

- IDs ou mensagens de achados do Lynis correspondentes
- ativo afetado
- script de remediação a executar
- severidade
- pontuação de prioridade de 1 a 100
- risco operacional se não for resolvido
- checagem de validação esperada

A fila precisa estar ordenada por pontuação de prioridade, decrescente.

## Saída Esperada

```
$ ./3-remediation_queue.sh
Controls assessed: 15
Compliant: 2
Non-compliant: 10
Partially compliant: 2
Not assessed: 1
Remediation actions queued: 12
Report saved to: gap_analysis.json
Queue saved to: remediation_queue.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `3-remediation_queue.sh`, `gap_analysis.json`, `remediation_queue.json`
