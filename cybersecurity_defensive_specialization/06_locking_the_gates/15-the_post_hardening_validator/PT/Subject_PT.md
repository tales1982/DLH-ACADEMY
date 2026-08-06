# 15. O Validador Pós-Hardening

**Objetivo:** Escrever um script somente-leitura que verifica de forma independente se todo controle de hardening está no estado esperado.

## Contexto

Hardening não é um evento único. Desvio de configuração (configuration drift) acontece: um administrador muda uma configuração de sysctl para depuração e esquece de reverter. Uma atualização de software sobrescreve o `sshd_config`. Esse script é a ferramenta de validação contínua que James Chen roda toda segunda-feira de manhã. Ele não faz nenhuma mudança no sistema. Ele só lê e reporta.

## Instruções

Escreva um script `15-validation.sh` que verifique cada configuração de hardening das Tarefas 4-13 contra seu valor esperado. Para cada controle:

- Leia o estado real do sistema
- Compare com o valor esperado
- Registre PASS ou FAIL

O script precisa sair com código 0 se todas as checagens passarem, código 1 se qualquer checagem falhar.

## Saída Esperada

```
$ sudo ./15-validation.sh
[PASS] PermitRootLogin = no
[PASS] PasswordAuthentication = no
[PASS] MaxAuthTries = 3
[PASS] net.ipv4.ip_forward = 0
[PASS] net.ipv4.tcp_syncookies = 1
[PASS] kernel.randomize_va_space = 2
[FAIL] net.ipv4.conf.all.log_martians = 0 (expected: 1)
[PASS] auditd.service = active
[PASS] apparmor.service = active
[PASS] UFW status = active
[PASS] Default incoming = deny
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `15-validation.sh`
