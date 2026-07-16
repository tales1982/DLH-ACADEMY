# 2. A Armadilha do Sintoma

**Objetivo:** Desenvolver o reflexo analítico de olhar além dos sintomas visíveis e identificar causas-raiz em eventos de segurança.

## Contexto

Lembra do post-it no monitor do Marcus? *"Check billing-srv-01, something is wrong."* Este é o servidor que foi atingido por ransomware em janeiro (Incidente A). Ele foi reconstruído, mas os problemas de performance que Marcus notou começaram antes do ransomware e voltaram depois da reconstrução.

A equipe de TI sinalizou o `billing-srv-01` três vezes nos últimos dois meses por "degradação de performance." Em cada ocasião, o administrador de sistemas reiniciou o servidor, o que resolveu o problema temporariamente. O último chamado do administrador diz:

> "Saturação recorrente de CPU no billing-srv-01. Provavelmente subdimensionado para a carga de trabalho de faturamento. Recomendo upgrade de hardware ou migração para uma VM mais potente."

James Chen não está convencido. Marcus também não estava. James pede que você dê uma olhada mais de perto.

## Arquivos Fornecidos

- `billing-srv-01_diagnostics.txt` (contém um snapshot da saída do comando `top` e um trecho do `netstat` do servidor)

### Trecho do arquivo de diagnóstico

```
top - 14:22:07 up 12 days, 3:47, 2 users
PID    USER      PR  NI  %CPU  %MEM    COMMAND
8834   www-data  20   0  94.2   3.1    ./kworker -o stratum+tcp://pool.monero.org:4443
1102   root      20   0   2.1   8.4    /usr/sbin/apache2 -k start
1455   mysql     20   0   1.3  12.6    /usr/sbin/mysqld

Active Internet connections:
Proto  Local Address      Foreign Address        State
tcp    10.10.2.15:45892   185.243.115.89:4443    ESTABLISHED
tcp    10.10.2.15:45901   91.121.87.10:8080      ESTABLISHED
tcp    10.10.2.15:80      10.10.1.0/24:*         LISTEN
```

## Instruções

O administrador de sistemas diz que isso é um problema de capacidade de hardware. Você precisa determinar o que está realmente acontecendo e por que o diagnóstico dele está errado.

1. **Identifique o processo:** O que o `kworker` está fazendo? O que a conexão `stratum+tcp://pool.monero.org` revela? Qual é o propósito real desse processo?
2. **Classifique o comprometimento real:** O sintoma visível é degradação de performance (impacto em Disponibilidade). Mas quais são as violações de segurança primárias de fato? Identifique os dois pilares CIA comprometidos *antes* da Disponibilidade ser afetada, e explique cada um.
3. **Explique por que a solução do administrador falha:** Se a MedDefense seguir a recomendação de fazer upgrade do hardware do servidor, o problema de segurança desaparece? Por que sim ou por que não?
4. **Conecte com o incidente de janeiro:** O ransomware de janeiro e este minerador de criptomoeda estão no mesmo servidor. O que isso sugere sobre a postura de segurança do servidor? Que pergunta você deveria estar fazendo sobre como os dois incidentes foram possíveis?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `2-root_cause_analysis.md`
