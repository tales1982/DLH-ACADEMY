# O que você precisa fazer

Esta tarefa é diferente das anteriores: não é um script que audita o AD ao vivo, é um script "construtor" — ele gera um documento de referência estático e estruturado. O valor está no CONTEÚDO de cada campo, não em lógica de consulta complexa.

## Passo 1 — Pense nos 10 campos como as perguntas que um analista júnior do SOC faria

Quando o Módulo 3 (análise de detecção) usar este arquivo, alguém vai abrir um alerta do Event ID 4732 sem saber nada sobre AD. Os campos existem para responder, na ordem: o que é isso (`event_name`, `security_meaning`), de onde vem (`log_source`, `audit_or_sensor_dependency`), é normal ver isso? (`normal_frequency`), devo me importar agora? (`triage_priority`), por que a MedDefense se importa especificamente (`crimson_tide_phase`), como fica um caso ruim na prática (`example_suspicious_pattern`), e como eu confirmo (`validation_method`). Preencha pensando nessa pessoa, não em você mesmo.

## Passo 2 — `crimson_tide_phase` precisa bater com o advisory real, não com um palpite

O advisory Crimson Tide (usado no módulo 05_board_briefing) tem 7 fases fixas: 1-Acesso Inicial, 2-Reconhecimento Interno, 3-Movimento Lateral (inclui Kerberoasting contra tickets RC4 — é aqui, não na Fase 4), 4-Exfiltração de Dados, 5-Destruição de Backup, 6-Implantação de Ransomware (via GPO — é a fase citada no Contexto desta tarefa), 7-Extorsão. Um erro comum é confundir Kerberoasting com a Fase 4 (que na verdade é exfiltração) — preste atenção em qual fase cada evento realmente detecta.

## Passo 3 — Nem todo Event ID tem uma "dependência" de configuração

O 1102 (log de auditoria limpo) é gerado pelo Windows incondicionalmente — não existe uma subcategoria de auditoria que o desabilite. Isso é diferente dos outros 16 eventos, que só aparecem se a subcategoria certa (ou o Sysmon, ou o Script Block Logging) estiver ativado. Documentar essa diferença no campo `audit_or_sensor_dependency` é o que torna a referência útil de verdade — alguém lendo só isso já sabe que não adianta "configurar" o 1102, só monitorá-lo.

## Passo 4 — O Sysmon tem uma dependência em duas camadas

Não basta o serviço Sysmon estar instalado — cada Event ID do Sysmon também depende de uma regra específica estar habilitada na configuração XML dele (`process_creation`, `network_connection`, `file_create`, etc.). Isso é diferente do log de Segurança nativo do Windows, que depende só do `auditpol`. Essa distinção de duas camadas é o que o campo `audit_or_sensor_dependency` precisa capturar para cada evento do Sysmon.

## Onde entregar

O arquivo final vai como `3-telemetry_reference.ps1` (mais `windows_event_reference.json` gerado), no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
