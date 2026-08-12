# 6. O Mapeamento das Fontes de Log no Linux

**Objetivo:** Inventariar todas as fontes de log ativas no sistema Linux com hardening aplicado, documentando sua localização, formato, política de rotação, relevância de segurança e taxa de eventos.

## Contexto

A telemetria Linux vem de múltiplas fontes com formatos diferentes: o auditd produz registros estruturados, o auth.log usa formato syslog, os logs de aplicação variam por serviço. Antes de exportar esses dados em um formato consistente, você precisa saber exatamente o que tem. Esse inventário se torna a especificação de entrada para o seu script de exportação.

## Instruções

Escreva um script `6-log_source_map.sh` que:

- Descubra todas as fontes de log ativas no sistema: auth.log, syslog, audit.log, kern.log, dpkg.log, logs de acesso/erro do apache2 e qualquer outra fonte relevante para segurança
- Para cada fonte: caminho do arquivo, tipo de formato (syslog, JSON, audit, custom), política de rotação (a partir da configuração do logrotate), tamanho atual do arquivo, eventos por hora estimados, classificação de relevância de segurança (critical, high, medium, low)
- Identifique quaisquer fontes esperadas que estejam ausentes ou não estejam gerando eventos

## Saída Esperada

```
$ ./6-log_source_map.sh
[*] Discovering log sources...
Source             Path                    Format    Rotation   Events/hr  Relevance
------             ----                    ------    --------   ---------  ---------
auth.log           /var/log/auth.log       syslog    90 days    42         critical
audit.log          /var/log/audit/audit.log audit     30 days    187        critical
syslog             /var/log/syslog         syslog    60 days    95         high
kern.log           /var/log/kern.log       syslog    30 days    12         medium
apache2 access     /var/log/apache2/access  combined  14 days    234        high
apache2 error      /var/log/apache2/error   custom    14 days    8          high
dpkg.log           /var/log/dpkg.log       custom    365 days   <1         medium
Sources found: 7 | Missing: 0
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `6-log_source_map.sh`
