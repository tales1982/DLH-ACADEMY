# 1. Perfil de Controles CIS da MedDefense

**Objetivo:** Construir um perfil de hardening CIS orientado por ameaças para os servidores Linux da MedDefense, que se torna a entrada para as tarefas de remediação posteriores.

## Contexto

A tarefa original de priorização CIS dependia demais de interpretação manual do benchmark. Neste projeto, scripts são o entregável principal. Essa tarefa reconstruída transforma a priorização CIS em um perfil de controles estruturado e reutilizável, que os scripts seguintes conseguem consumir.

A MedDefense não precisa de uma lista genérica de recomendações CIS. Ela precisa de um perfil de controles focado para `billing-srv-01`, `web-srv-01` e `log-srv-01`, amarrado aos riscos reais do projeto: movimento lateral via SSH, autenticação fraca, serviços desnecessários, falta de visibilidade de auditoria, serviços de banco de dados expostos e hardening de kernel insuficiente.

## Instruções

Escreva `1-cis_profile.sh`.

O script precisa gerar `cis_profile.json` contendo exatamente 15 controles. Cada controle precisa incluir:

- `control_id`
- `title`
- `cis_section`
- `severity` (critical, high, ou medium)
- `asset_scope`
- `threat_mapping`
- `implementation_task`
- `verification_method`
- `justification`

Os controles selecionados precisam cobrir SSH, hardening de kernel/sysctl, PAM, minimização de serviços, permissões de sistema de arquivos, log de auditoria, exposição de firewall e retenção de logs.

## Saída Esperada

```
$ ./1-cis_profile.sh
Controls selected: 15
Critical: 5
High: 7
Medium: 3
CIS sections covered: 5
Mapped implementation tasks: 10
Report saved to: cis_profile.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `1-cis_profile.sh`, `cis_profile.json`
