# O que você precisa fazer

Esse script não gera telemetria nova, ele audita a telemetria que a Task 3 (`3-windows_telemetry_export.ps1`) já exportou. É um gate: lê `windows_events_export.json`, calcula métricas objetivas de completude e continuidade, e produz uma nota única de 0 a 100 com um veredito (`good`/`acceptable`/`poor`).

## Passo 1 — A completude de campo é calculada por um único helper genérico, não por código repetido

Em vez de escrever uma verificação separada para `command_line`, `source_ip` e `script_block_text`, o script tem uma única função `Get-CompletenessPercent`, que recebe uma lista de eventos e um `FieldPath` como string (por exemplo `"enriched.command_line"`), faz `-split '\.'` nesse caminho e desce propriedade por propriedade usando `$value.PSObject.Properties.Name -contains $segment`. Isso é necessário porque em PowerShell, acessar `$obj.propriedade_que_nao_existe` sob `Set-StrictMode -Version Latest` lança um erro em vez de retornar `$null` silenciosamente — por isso o código sempre confere se a propriedade existe antes de acessá-la.

## Passo 2 — Os eventos de processo são identificados por dois critérios diferentes ao mesmo tempo

A linha `$Events | Where-Object { $_.event_id -eq 4688 -or $_.event_id -eq "Sysmon-1" }` reconhece que "evento de processo" no export não é um `event_id` único: pode ser o 4688 nativo do Windows Security log (número) ou o `"Sysmon-1"` que a Task 3 usa para diferenciar o Event ID 1 do Sysmon do 4688 nativo (string). O mesmo padrão de dois-tipos-de-fonte se repete para logon (4624/4625) e PowerShell (4104), mostrando que o script está ciente de que a mesma categoria de evento de segurança pode vir de canais diferentes com IDs diferentes.

## Passo 3 — A cobertura por hora é construída com buckets fixos, não contando timestamps direto

O script não conta "quantas horas têm pelo menos um evento" perguntando aos timestamps — ele constrói `$TotalHours` buckets de uma hora entre `$WindowStart` e `$WindowEnd` (com fallback pro primeiro/último timestamp observado, se `window_start`/`window_end` não vierem no export) e, para cada bucket, filtra quantos timestamps caem dentro dele com `-ge $bucketStart -and -lt $bucketEnd`. Isso garante que uma hora sem NENHUM evento apareça no relatório com contagem zero, em vez de simplesmente não existir — é assim que `hours_without_events` vira um número real, não uma ausência.

## Passo 4 — A pontuação de qualidade pondera duração de silêncio contra quantidade de lacunas, não as duas coisas juntas

A fórmula (`$TimeCoverageScore*0.25 + $GapScore*0.15 + $CommandLineCompleteness*0.20 + $SourceIPCompleteness*0.20 + $ScriptBlockCompleteness*0.20`) usa pesos que somam exatamente 1.0. Repare que `$GapScore` não usa a duração das lacunas — ele penaliza pela CONTAGEM (`100 - ($Gaps.Count * 10)`, com piso em zero via `[math]::Max`). Ou seja, cinco lacunas pequenas de 31 minutos derrubam a nota tanto quanto uma única lacuna de 5 horas. Isso é uma escolha deliberada de design: instabilidade recorrente da fonte de log é tratada como pior sinal do que um único gap isolado.

## Onde entregar

Os arquivos finais vão como `4-windows_telemetry_quality.ps1` (que lê `windows_events_export.json` e gera `windows_telemetry_quality.json`), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
