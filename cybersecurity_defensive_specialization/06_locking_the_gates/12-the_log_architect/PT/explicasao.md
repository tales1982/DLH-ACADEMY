# O que você precisa fazer

Essa tarefa tem duas partes bem distintas: configurar PARA ONDE os logs vão (rsyslog) e por QUANTO TEMPO eles ficam guardados (logrotate). São dois arquivos de configuração diferentes.

## Passo 1 — rsyslog: a sintaxe é "facility.severity -> destino"

`auth,authpriv.*` significa "todas as severidades das facilities auth e authpriv". Isso normalmente já vem parcialmente configurado de fábrica no Ubuntu (em `/etc/rsyslog.d/50-default.conf`), então parte do seu trabalho é VERIFICAR se já está correto antes de sobrescrever, e só adicionar/corrigir o que estiver faltando — lembre que idempotência importa aqui também.

## Passo 2 — logrotate: cada arquivo de log tem seu próprio bloco de configuração

Um bloco típico em `/etc/logrotate.d/rsyslog` (ou um arquivo customizado seu) se parece com:
```
/var/log/auth.log {
    rotate 90
    daily
    compress
    delaycompress
    missingok
    notifempty
}
```
`delaycompress` é o que implementa "comprimido depois de 7 dias" de forma aproximada (comprime a partir da segunda rotação, não da primeira) — se você precisar de um controle mais fino de "exatamente 7 dias antes de comprimir", isso exige um script auxiliar rodando via cron, já que o logrotate padrão não tem esse parâmetro exato.

## Passo 3 — "Verificar que estão recebendo eventos" precisa de um teste real, não só checar se o arquivo existe

Gere um evento de autenticação de verdade (por exemplo, uma tentativa de SSH, ou `logger -p auth.info "teste"` para o syslog) e depois confira com `tail` se a linha nova apareceu no arquivo esperado.

## Passo 4 — Permissões 640 root:adm é o padrão do Ubuntu, então parte do trabalho é apenas confirmar/corrigir

No Ubuntu, o grupo `adm` tradicionalmente tem leitura em logs do sistema para permitir que administradores non-root consigam ler logs sem ser root. `chmod 640` e `chown root:adm` são os comandos diretos aqui — o ponto é garantir que nenhuma mudança anterior (por exemplo, de um admin apressado) tenha deixado esses arquivos com permissão mais aberta (como 644 ou 666).

## Onde entregar

O arquivo final vai como `12-log_config.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
