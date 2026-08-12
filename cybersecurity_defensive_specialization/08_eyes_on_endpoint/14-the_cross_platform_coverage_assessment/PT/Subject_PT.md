# 14. A Avaliação de Cobertura Entre Plataformas

**Objetivo:** Produzir a avaliação final de cobertura de telemetria que explica o que o SOC consegue detectar, o que permanece parcialmente visível e o que ainda é um ponto cego.

## Contexto

A tarefa original de avaliação de cobertura era ampla demais. Esta versão reconstruída torna a saída precisa e operacional. Ela precisa combinar o pacote de entrega, as matrizes de detecção e os relatórios de qualidade em um arquivo final de metadados que acompanha o pacote de telemetria.

O SOC deve conseguir ler esse arquivo e entender imediatamente os pontos fortes e os limites do conjunto de dados.

## Instruções

Escreva um script Bash chamado `14-coverage_assessment.sh`.

O script precisa ler:

- `telemetry_handoff/windows_events.json`
- `telemetry_handoff/linux_events.json`
- `telemetry_handoff/attack_ground_truth.json`
- `windows_detection_matrix.json`
- `linux_detection_matrix.json`
- `windows_telemetry_quality.json`
- `linux_telemetry_quality.json`
- `sysmon_coverage_matrix.json`

O script precisa produzir `telemetry_coverage_assessment.json`.

A avaliação precisa incluir:

- Total de eventos
  - por plataforma
  - por tipo de fonte
  - por categoria de evento
- Resumo da matriz de detecção
  - total de ações simuladas
  - ações capturadas
  - ações perdidas
  - detecções em múltiplas fontes
- Cobertura ATT&CK
  - técnicas cobertas
  - técnicas parcialmente cobertas
  - técnicas cegas
  - fonte responsável pela cobertura
- Lacunas conhecidas
  - descrição
  - plataforma impactada
  - técnica impactada
  - motivo
  - melhoria de instrumentação recomendada
- Resumo de qualidade
  - pontuação do Windows
  - pontuação do Linux
  - classificação final de confiança da entrega

O script precisa usar `jq`.

## Saída Esperada

```
$ ./14-coverage_assessment.sh
[*] Loading telemetry handoff package...
Windows events: 2270
Linux events: 2022
Ground truth actions: 12
Detection matrix: 11/12 captured
ATT&CK covered: 9
ATT&CK partial: 2
ATT&CK blind: 1
Windows quality: 94.2
Linux quality: 96.1
Confidence: acceptable
Report saved to: telemetry_coverage_assessment.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `14-coverage_assessment.sh`, `telemetry_coverage_assessment.json`
