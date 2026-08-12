# 15. A Validação do Pacote de Entrega

**Objetivo:** Validar o pacote de entrega de telemetria contra critérios de qualidade para garantir que ele esteja pronto para consumo pelos analistas no futuro.

## Contexto

Este é o portão de qualidade. Se o pacote de entrega estiver malformado, incompleto ou inconsistente. Este script é um meta-validador: ele verifica existência de arquivos, validade de JSON, presença de campos obrigatórios, contagens mínimas de eventos por fonte, consistência de timestamp entre plataformas e completude da verdade fundamental (ground truth). É o último script que você roda antes de atravessar do papel de construtor (builder) para o papel de analista.

## Instruções

Escreva um script `15-handoff_validation.sh` que valide o diretório `telemetry_handoff/`:

- Existência de arquivos: os 3 arquivos esperados presentes
- Validade de JSON: cada arquivo é interpretado sem erros
- Campos obrigatórios: todo evento tem `timestamp`, `hostname`, `sourcetype`, `eventcategory`
- Contagens mínimas de eventos: Windows >= 1000 eventos, Linux >= 500 eventos, ground truth >= 10 ações
- Consistência de timestamp: todos os timestamps são ISO 8601 válidos, todos dentro de um intervalo razoável, sem timestamps futuros
- Alinhamento entre plataformas: os intervalos de timestamp se sobrepõem (ambas as plataformas cobrem o mesmo período)
- Completude da verdade fundamental: toda ação tem uma entrada correspondente na matriz de detecção

Reporte PASS/FAIL por verificação, com um veredito final.

## Saída Esperada

```
$ ./15-handoff_validation.sh
[*] Validating telemetry_handoff/ ...
=== File Existence ===
[PASS] windows_events.json exists (4.2 MB)
[PASS] linux_events.json exists (3.1 MB)
[PASS] attack_ground_truth.json exists (12 KB)
=== JSON Validity ===
[PASS] windows_events.json: valid JSON, 2270 objects
[PASS] linux_events.json: valid JSON, 2022 objects
[PASS] attack_ground_truth.json: valid JSON, 12 objects
=== Required Fields ===
[PASS] All events have timestamp, hostname, source_type, event_category
=== Minimum Event Counts ===
[PASS] Windows: 2,270 >= 1,000
[PASS] Linux: 2,022 >= 500
[PASS] Ground truth: 12 >= 10
=== Timestamp Consistency ===
[PASS] All timestamps valid ISO 8601
[PASS] No future timestamps
[PASS] Range: 2026-03-25T00:00:00Z to 2026-03-25T23:59:59Z
=== Cross-Platform Alignment ===
[PASS] Windows and Linux time ranges overlap (23.5 hours shared)
=== Ground Truth Completeness ===
[PASS] 12/12 actions have detection matrix entries
VERDICT: PASS (14/14 checks)
Handoff package is ready for Module 3.
Report saved to: handoff_validation.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `15-handoff_validation.sh`, `handoff_validation.json`
