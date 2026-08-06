# 12. O Arquiteto de Logs

**Objetivo:** Configurar o rsyslog para logging estruturado e definir políticas de rotação de log que garantam que os logs sejam preservados e exportáveis.

## Contexto

O `auditd` lida com eventos em nível de kernel, mas logs de autenticação (`auth.log`), logs de sistema (`syslog`) e logs de serviço são tratados pelo `rsyslog`. Se o rsyslog estiver mal configurado, tentativas de login SSH, eventos do PAM e falhas de serviço desaparecem em `/dev/null`. Se a rotação de log for agressiva demais, evidências são destruídas antes que os analistas consigam examiná-las. Essa tarefa garante que toda fonte de log no servidor com hardening esteja devidamente configurada, retida e pronta para a exportação de telemetria que você vai construir no 2x02.

## Instruções

Escreva um script `12-log_config.sh` que:

- Configure o rsyslog para escrever eventos de autenticação em `/var/log/auth.log` com formatação estruturada
- Configure o roteamento de facilities do syslog para fontes relevantes à segurança
- Defina políticas de rotação de log: `auth.log` retido por 90 dias, `syslog` retido por 60 dias, comprimido após 7 dias
- Verifique se `auth.log` e `syslog` estão recebendo eventos ativamente
- Garanta que as permissões dos arquivos de log restrinjam o acesso apenas ao root

## Saída Esperada

```
$ sudo ./12-log_config.sh
[*] Configuring rsyslog...
    auth,authpriv.* -> /var/log/auth.log     [CONFIGURED]
    *.info;auth.none -> /var/log/syslog      [CONFIGURED]
[*] Setting log rotation policies...
    /var/log/auth.log: rotate 90, compress after 7d  [SET]
    /var/log/syslog: rotate 60, compress after 7d    [SET]
[*] Verifying log activity...
    /var/log/auth.log: receiving events       [OK]
    /var/log/syslog: receiving events         [OK]
[*] Securing log file permissions...
    /var/log/auth.log: 640 root:adm          [OK]
    /var/log/syslog: 640 root:adm            [OK]
Log sources configured: 2 | Rotation policies: 2 | Permissions: secured
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `12-log_config.sh`
