# Matriz de Controles Completa — MedDefense Health Systems

## Parte 1: Registro de Controles (Atualizado)

| ID | Nome do Controle | Categoria | Função | Ativo(s) Protegido(s) | Efetividade | Evidência/Fonte |
|---|---|---|---|---|---|---|
| C-001 | Firewall — Restrição de Entrada Web | Técnico | Preventivo | `web-srv-01` | Forte | Task 4, Artefato 1 |
| C-002 | Firewall — Acesso ao Servidor Restrito a VPN | Técnico | Preventivo | Subnet de servidores | Adequada | Task 4; nota do Marcus: "permite TODOS os serviços da VPN — permissivo demais" |
| C-003 | Regra Deny-All do Firewall | Técnico | Preventivo | Rede interna inteira | Forte | Task 4, Artefato 1 |
| C-004 | Autenticação SSH Somente por Chave | Técnico | Preventivo | Só `ehr-srv-01` | Adequada | Task 4; forte nesse host, mas não implantado na organização toda |
| C-005 | Log Detalhado de SSH | Técnico | Detectivo | Só `ehr-srv-01` | Fraca | Os logs existem, ninguém os revisa (Task 5, G-002) |
| C-006 | Política de Complexidade e Rotação de Senha | Administrativo | Preventivo | Todas as contas | Adequada | Task 4; sem exigência de MFA, contas compartilhadas toleradas |
| C-007 | Bloqueio de Conta | Técnico | Preventivo | Contas gerenciadas pelo AD | Forte | Task 4, aplicado via GPO |
| C-008 | Proteção de Endpoint Sophos | Técnico | Preventivo | Só estações Windows | Fraca | Exclui todos os servidores (Task 5, G-004) |
| C-009 | Backup Noturno (Veeam) | Técnico | Corretivo | Servidores principais | Adequada | Nunca testado em DR; mesma sala da produção (Task 5, G-003) |
| C-010 | Guarda de Segurança | Físico | Preventivo | Entrada principal do Central | Fraca | Só seg-sex 7h-19h; nenhum outro site ou horário |
| C-011 | Cobertura de CFTV | Físico | Detectivo | Entradas do prédio | Fraca | Sem cobertura da sala de servidores/armário/ala administrativa (Task 5, G-006) |
| C-012 | Treinamento Anual de Segurança | Administrativo | Preventivo | Todos os funcionários | Fraca | 58-71% de conclusão, sem simulação de phishing |
| C-013 | Log Local do FortiGate | Técnico | Detectivo | Perímetro de rede | Fraca | Só local, sem encaminhamento, sem alerta |
| C-014 | Segmentação de Rede do MRI | Técnico | Compensatório | `WS-RAD-01` (MRI) | Fraca | Task 6 — **proposto, ainda não implementado** |
| C-015 | Processo de Governança de Risco do MRI | Administrativo | Compensatório | `WS-RAD-01` (MRI) | Fraca | Task 6 — **proposto, ainda não implementado** |
| C-016 | Restrição Física/USB do MRI | Físico | Preventivo | `WS-RAD-01` (MRI) | Fraca | Task 6 — **proposto, ainda não implementado** |

## Parte 2: Matriz Resumo de Controles Atualizada

| | Preventivo | Detectivo | Corretivo | Compensatório | Dissuasório |
|---|---|---|---|---|---|
| **Técnico** | 6 controles — média Adequada (3 Forte, 2 Adequada, 1 Fraca) | 2 controles — média Fraca | 1 controle — Adequada | 1 controle — Fraca (proposto) | 0 |
| **Administrativo** | 2 controles — média Fraca/Adequada | 0 | 0 | 1 controle — Fraca (proposto) | 0 |
| **Físico** | 2 controles — média Fraca | 1 controle — Fraca | 0 | 0 | 0 |

## Parte 3: Mapa de Cobertura de Controles (Top 5 Ativos Críticos, Task 8)

| Ativo Crítico | Preventivo | Detectivo | Corretivo | Compensatório | Avaliação de Cobertura |
|---|---|---|---|---|---|
| `ehr-db-01` | C-002, C-006 | — | C-009 | — | **Parcialmente Protegido** — nenhum controle detectivo no repositório de dado de maior valor de todos |
| `ad-dc-01` | C-002, C-006, C-007 | — | C-009 | — | **Parcialmente Protegido** — mesmo ponto cego detectivo na âncora de confiança do domínio |
| `NAS-01` | C-002 | — | — | — | **Sub-Protegido** — ele *é* o controle corretivo pra tudo mais, mas nada o protege diretamente e nada o corrige se ele falhar |
| FortiGate 100F | C-003 (próprio) | C-013 (próprio) | — | — | **Parcialmente Protegido** — boa auto-cobertura, mas sem redundância/failover se ele cair |
| Frota de Bombas BD Alaris | — | — | — | — | **Desprotegido** — nenhum controle dedicado de nenhum tipo; isolamento recomendado pelo fabricante nunca foi implementado |
