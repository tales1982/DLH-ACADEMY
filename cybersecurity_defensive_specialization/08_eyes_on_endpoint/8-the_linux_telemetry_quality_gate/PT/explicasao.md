# O que você precisa fazer

Esse script é o irmão Linux do `4-windows_telemetry_quality.ps1`: mesma ideia de portão de qualidade, mas em vez de PowerShell é um único programa `jq` gigante que lê `linux_events_export.json` e devolve `linux_telemetry_quality.json` já pronto — o Bash em volta só imprime o resumo no console lendo de volta o JSON gerado.

## Passo 1 — O relatório inteiro é montado numa única chamada `jq -n --slurpfile`, não em vários `jq` encadeados

Em vez de chamar `jq` várias vezes (uma para distribuição, outra para lacunas, outra para completude) e colar os pedaços em Bash, o script inteiro é UM programa jq só, de `jq -n --slurpfile export "$IN_JSON" ... '...'` até o fechamento em `> "$OUT_JSON"`. Cada bloco (`$event_distribution`, `$gaps`, `$timestamp_pct`, etc.) é uma variável `as $nome` dentro do mesmo pipeline, e o objeto final é montado de uma vez só no `{...}` do fim. Isso evita ler o JSON de entrada mais de uma vez e garante que todas as métricas venham do mesmo snapshot de `$events`.

## Passo 2 — `total_hours` conta buckets de hora-calendário, não duração corrida, e o comentário no script explica exatamente por quê

A linha `(($distinct_hours[-1] | strptime(...) | mktime) - ($distinct_hours[0] | strptime(...) | mktime)) / 3600 | floor + 1` calcula quantos buckets de hora (relógio) o intervalo toca, não quantas horas se passaram. O comentário no próprio script dá o exemplo: um intervalo de 14:46 a 16:32 toca 3 buckets (14h, 15h, 16h) mesmo tendo menos de 2 horas reais decorridas. Se o script comparasse `hours_with_events` (uma contagem de buckets) contra uma duração corrida em vez de uma contagem de buckets, `hours_with_events` poderia ultrapassar `total_hours` sempre que os eventos caíssem perto de uma virada de hora — por isso o `floor + 1` existe.

## Passo 3 — Quais campos contam como "completos" muda de acordo com a categoria do evento

A completude não é genérica: para eventos `execve`, o script confere se `field1` OU `field2` está preenchido (são os campos genéricos que a task de export usa para carregar a linha de comando). Para SSH, ele primeiro filtra os eventos com `.source_type == "auth.log" and (.event_category | test("^ssh_login"))` e só aí confere `source_ip` e `user`. Para arquivos do auditd, filtra `.source_type == "audit.log" and .event_category == "file_access"` e confere `field1` (caminho) e `field2` (operação/nametype) separadamente, gerando dois percentuais distintos (`auditd_file_path_pct` e `auditd_file_operation_pct`). Cada categoria de evento carrega sua informação relevante em campos genéricos diferentes, então o script precisa saber, categoria por categoria, onde procurar.

## Passo 4 — A função `pct()` devolve 100%, não 0%, quando o denominador é zero

`def pct($n; $d): if $d > 0 then ((($n / $d) * 10000) | round) / 100 else 100.0 end;` — se não existir nenhum evento SSH no export, por exemplo, `ssh_source_ip_pct` fica em 100% em vez de 0%. Essa escolha evita que uma categoria de evento simplesmente ausente do dataset derrube artificialmente a pontuação de qualidade; o score só é penalizado quando a categoria existe e está incompleta.

## Passo 5 — Os pesos da pontuação final somam exatamente 1.0 e ignoram de propósito hostname/timestamp

A fórmula `($time_coverage_score * 0.20) + ($gap_score * 0.15) + ($execve_cmdline_pct * 0.20) + ($ssh_source_ip_pct * 0.20) + ($file_path_pct * 0.15) + ($event_category_pct * 0.10)` usa seis pesos que somam 1.0, mas note que `hostname_pct`, `source_type_pct` e `timestamp_pct` aparecem no relatório em `field_completeness` só como informação — não entram na conta do `quality_score`. O score pondera o que um analista realmente usa para triagem (linha de comando, IP de origem, caminho de arquivo, cobertura de tempo, lacunas), não a completude estrutural básica do evento.

## Onde entregar

O arquivo final vai como `8-linux_telemetry_quality.sh` (que lê `linux_events_export.json` e gera `linux_telemetry_quality.json`), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
