# 5. O Refinamento das Regras do auditd

**Objetivo:** Refinar a configuração do auditd feita no 2x00 adicionando regras focadas em detecção para execução de processos, criação de sockets de rede e acesso a arquivos sensíveis adicionais, e então validar que cada regra dispara corretamente.

## Contexto

As regras do auditd do 2x00 Task 10 cobriam arquivos de identidade, escalonamento de privilégio e execução de ferramentas suspeitas. Mas elas deixaram de fora categorias críticas: execução de processos via `execve` (o equivalente Linux do Sysmon Event ID 1), criação de sockets de rede, acesso a arquivos de chave SSH e modificações em diretórios de cron. Essa tarefa preenche essas lacunas para aproximar a visibilidade da telemetria Linux do nível que o Sysmon oferece no Windows.

## Instruções

Escreva um script `5-auditd_refine.sh` que:

- Carregue as regras atuais do auditd e reporte a contagem
- Adicione regras focadas em detecção:
  - Execução de processos via execve (`-a always,exit -F arch=b64 -S execve -k process_exec`)
  - Criação de sockets de rede (`-a always,exit -F arch=b64 -S socket -S connect -k network_connect`)
  - Acesso a arquivos de chave SSH (`-w /home/*/.ssh/ -p rwa -k ssh_keys`)
  - Modificações em diretórios de cron (`-w /etc/cron.d/ -p wa -k cron_persist` e `/var/spool/cron/`)
  - Acesso à configuração do sudo (`-w /etc/sudoers.d/ -p wa -k sudoers`)
- Carregue as regras atualizadas
- Valide que cada regra nova dispara, executando uma ação de teste e buscando com `ausearch`

## Saída Esperada

```
$ sudo ./5-auditd_refine.sh
[*] Current auditd rules: 14
[*] Adding detection-focused rules...
    execve syscall tracking               [ADDED]
    socket/connect syscall tracking       [ADDED]
    SSH key file monitoring               [ADDED]
    Cron directory monitoring             [ADDED]
    sudoers.d monitoring                  [ADDED]
[*] Loading rules... augenrules --load: OK
[*] Total rules: 19
[*] Validating new rules...
    execve: ran /usr/bin/id -> ausearch -k process_exec    [CAPTURED]
    socket: curl localhost -> ausearch -k network_connect  [CAPTURED]
    ssh_keys: touch ~/.ssh/test -> ausearch -k ssh_keys    [CAPTURED]
    cron: touch /etc/cron.d/test -> ausearch -k cron_persist [CAPTURED]
    sudoers: touch /etc/sudoers.d/test -> ausearch -k sudoers [CAPTURED]
Rules added: 5 | Validation: 5/5 PASS
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `5-auditd_refine.sh`
