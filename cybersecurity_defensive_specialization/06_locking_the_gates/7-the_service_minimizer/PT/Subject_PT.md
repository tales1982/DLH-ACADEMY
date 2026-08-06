# 7. O Minimizador de Serviços

**Objetivo:** Identificar e desabilitar serviços desnecessários para reduzir a superfície de ataque apenas ao que as operações da MedDefense exigem.

## Contexto

A Seção 2 do CIS Benchmark cobre configuração de serviços. O princípio: todo serviço em execução é um ponto de entrada em potencial. Um servidor de faturamento não precisa de `avahi-daemon`, `cups` ou `rpcbind`. O scan do 1x02 encontrou o billing-srv-01 com serviços desnecessários expostos para toda a rede (Finding 006: MySQL em 0.0.0.0). A captura de linha de base contou 24 serviços habilitados. Um servidor de faturamento de produção precisa de menos de 10.

## Instruções

Escreva um script `7-service_minimization.sh` que:

- Liste todos os serviços habilitados
- Compare com uma whitelist de serviços exigidos pela MedDefense (definida como um array com comentários explicando por que cada um é necessário)
- Pare e desabilite os serviços que não estão na whitelist
- Verifique se os serviços exigidos estão rodando
- Reporte a contagem antes/depois

## Saída Esperada

```
$ sudo ./7-service_minimization.sh
[*] Scanning enabled services...
    Enabled services found: 24
[*] Comparing against MedDefense whitelist (9 required services)...
  avahi-daemon.service     [STOPPED] [DISABLED]
  cups.service             [STOPPED] [DISABLED]
  ModemManager.service     [STOPPED] [DISABLED]
  bluetooth.service        [STOPPED] [DISABLED]
  ssh.service              [ACTIVE]
  apache2.service          [ACTIVE]
  mysql.service            [ACTIVE]
  ufw.service              [ACTIVE]
  auditd.service           [ACTIVE]
  apparmor.service         [ACTIVE]
  cron.service             [ACTIVE]
  rsyslog.service          [ACTIVE]
  systemd-timesyncd.service [ACTIVE]
Before: 24 | After: 9 | Disabled: 15
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `7-service_minimization.sh`
