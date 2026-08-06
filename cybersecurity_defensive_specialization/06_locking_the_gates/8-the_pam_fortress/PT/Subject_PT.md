# 8. A Fortaleza do PAM

**Objetivo:** Configurar o PAM para impor requisitos de qualidade de senha e bloquear contas após tentativas de autenticação falhas.

## Contexto

O alerta do Crimson Tide documentou que em 3 das 5 violações, o atacante usou credenciais roubadas (Fase 2) e Kerberoasting (Fase 3) para se mover lateralmente. Senhas fracas são a causa raiz. O PAM é onde o Linux impõe a política de senhas. Atualmente, a MedDefense não tem requisitos de complexidade de senha, nem bloqueio de conta, nem aplicação de histórico de senha nos seus servidores Linux.

## Instruções

Escreva um script `8-pam_hardening.sh` que:

- Instale o `libpam-pwquality` se não estiver presente
- Configure a qualidade de senha: `minlen 14`, requisitos de complexidade, `reject_username`
- Configure o bloqueio de conta com `pam_faillock`: 5 tentativas, bloqueio de 900 segundos
- Configure o histórico de senha: lembrar 12 senhas
- Valide a configuração do PAM checando os arquivos relevantes

## Saída Esperada

```
$ sudo ./8-pam_hardening.sh
[*] Checking libpam-pwquality...
    Already installed: libpam-pwquality 1.4.2
[*] Configuring password quality (/etc/security/pwquality.conf)...
    minlen = 14                      [SET]
    dcredit = -1                     [SET]
    ucredit = -1                     [SET]
    lcredit = -1                     [SET]
    ocredit = -1                     [SET]
    maxrepeat = 3                    [SET]
    reject_username                  [SET]
[*] Configuring account lockout (pam_faillock)...
    deny = 5                         [SET]
    unlock_time = 900                [SET]
    fail_interval = 900              [SET]
[*] Configuring password history...
    remember = 12                    [SET]
Password minimum length: 14 | Lockout: 5 attempts / 15 min | History: 12
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `8-pam_hardening.sh`
