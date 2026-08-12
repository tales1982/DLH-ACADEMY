# O que você precisa fazer

Esse script é o equivalente Linux do `3-windows_telemetry_export.ps1`: pega três fontes de log com formatos completamente diferentes (auth.log, audit.log, syslog) e produz um único JSON com o mesmo formato normalizado, para o analista do Módulo 3 conseguir usar `jq` na exportação Linux exatamente como usaria na do Windows.

## Passo 1 — Tudo é feito em um awk por arquivo, de propósito, por causa de custo de subprocesso

O comentário no topo do script é direto sobre isso: um design ingênuo (loop em Bash chamando `grep`/`date` uma vez por linha) foi medido em MINUTOS contra um `audit.log` real de dezenas de milhares de linhas. Por isso cada fonte é processada com uma única passada de `awk` que já emite TSV normalizado, e a normalização final de timestamp para ISO 8601 é feita numa única passada de `jq` no final — não por evento. A mesma lógica se aplica ao Passo 2: o `audit.log` é parseado direto do arquivo bruto em vez de usar `ausearch`, porque `ausearch` é um subprocesso por consulta, e chamá-lo por linha (ou até por tipo de evento) reintroduziria exatamente o custo que o awk único evita.

## Passo 2 — O auth.log classifica por padrões de texto específicos do `sshd`/`sudo`/`su`, e ignora tudo que não reconhece

O awk do auth.log usa `index()` e regex para separar: `ssh_login_success` (contém `"Accepted"` e casa com `sshd\[[0-9]+\]:`), `ssh_login_failure` (contém `"Failed password"`, com um `gsub` extra para remover o prefixo `"invalid user "` antes de extrair o nome do usuário), `sudo` (linha com `sudo:` seguido de espaço/tab E contém `COMMAND=`), e `su` (casa `su(\[pid\])?:` E `"session (opened|closed) for user"`). Qualquer linha que não bate em nenhum desses padrões cai no `else { next }` e é descartada — o script não tenta capturar "tudo", só os padrões de evento que o enunciado pede.

## Passo 3 — O audit.log usa os números de syscall do x86_64 diretamente, não só o nome

A detecção de `execve` casa `syscall=(59|322|execve|execveat)` — 59 e 322 são os números reais de `execve` e `execveat` na tabela de syscalls x86_64, incluídos porque o campo `syscall=` no registro bruto do kernel normalmente vem como número, não como nome; o nome só aparece se a ferramenta que gerou o log já resolveu via `ausyscall`. Isso é uma diferença sutil de quem só conhece auditd por `ausearch -i` (que resolve os nomes para leitura humana) — o arquivo bruto que este script lê direto não tem essa tradução.

## Passo 4 — O timestamp clássico do syslog não carrega fuso horário, então o script captura o offset do host uma única vez

`LOCAL_UTC_OFFSET="$(date +%z)"` é capturado uma vez no início e passado para a função jq `normalize_syslog_ts`. Ela trata dois formatos de entrada: um timestamp já ISO 8601 (com ou sem offset embutido) e o formato clássico do syslog `"Mon DD HH:MM:SS"`, que não tem ano nem fuso — o ano vem de `$CURRENT_YEAR` e o fuso vem do offset capturado do host, presumindo que os logs foram escritos no fuso horário local da máquina. A função auxiliar `offset_seconds` faz a conta manual de `+HHMM`/`-HHMM` para segundos porque o jq não tem um parser de fuso embutido para esse formato.

## Passo 5 — O intervalo de tempo reportado (`time_range`) é derivado dos próprios eventos exportados, não de um argumento externo

Depois que os três JSONs intermediários (`auth.json`, `audit.json`, `syslog.json`) são gerados, o script os "slurpa" juntos com `jq -s -r '[.[][] | .timestamp] | sort | .[0], .[-1]'` para achar o menor e o maior timestamp entre TODOS os eventos das três fontes — é assim que `Time range:` na saída reflete o que realmente foi capturado, com fallback para `1970-01-01T00:00:00Z` caso não haja nenhum evento.

## Onde entregar

O arquivo final vai como `7-linux_export.sh` (que gera `linux_events_export.json` por padrão, ou o nome passado como argumento), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
