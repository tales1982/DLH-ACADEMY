# 13. A Linha de Base do Firewall

**Objetivo:** Configurar um firewall de host com política de negação padrão para entrada, permitindo apenas os serviços que a MedDefense exige.

## Contexto

Os serviços com hardening e a trilha de auditoria são inúteis se o servidor aceita conexões em portas que nenhum serviço está escutando. Um firewall de negação padrão significa que o servidor só "fala" quando é solicitado em canais aprovados. O scan do 1x02 encontrou o billing-srv-01 com 11 portas abertas. Depois da minimização de serviços (Tarefa 7), apenas 4 ou 5 deveriam ser alcançáveis. O firewall impõe isso na camada de rede, independente da configuração de serviços.

## Instruções

Escreva um script `13-firewall_baseline.sh` que:

- Habilite o UFW (ou configure nftables) com negação padrão para entrada, permissão padrão para saída
- Crie regras de permissão apenas para os serviços exigidos: SSH (porta 22, apenas da rede de gerência), HTTP/HTTPS (portas 80/443), MySQL (porta 3306, apenas da rede de aplicação)
- Habilite logging para conexões negadas
- Valide as regras listando o conjunto de regras ativo

## Saída Esperada

```
$ sudo ./13-firewall_baseline.sh
[*] Configuring UFW...
    Default incoming: deny
    Default outgoing: allow
[*] Adding allow rules...
    22/tcp from 10.10.1.0/24   [ADDED] SSH - management only
    80/tcp                     [ADDED] HTTP
    443/tcp                    [ADDED] HTTPS
    3306/tcp from 10.10.2.0/24 [ADDED] MySQL - app network only
[*] Enabling logging...
    Logging: on (low)
[*] Activating firewall...
    UFW: active
    Rules: 4 allow, default deny
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `13-firewall_baseline.sh`
