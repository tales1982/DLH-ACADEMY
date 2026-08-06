# O que você precisa fazer

Diferente da Tarefa 0, aqui o script não inspeciona o sistema — ele gera um documento de decisão. Na prática, você está escrevendo um script que produz um JSON com dados que você mesmo decide, baseado em critério profissional (curadoria dos 15 controles CIS que fazem sentido para a MedDefense).

## Passo 1 — Isso é curadoria, não extração automática

Não existe uma forma de "escanear" o benchmark CIS de 800 páginas e sair com os 15 controles certos automaticamente. Você (o autor do script) decide quais 15 controles importam, com base no enunciado: SSH, sysctl/kernel, PAM, minimização de serviços, permissões de arquivo, auditoria, exposição de firewall e retenção de log — isso já são 8 categorias, então distribua os 15 controles entre elas de forma que cubra todas.

## Passo 2 — Os números do "Expected Output" são uma restrição de design, não um acaso

5 críticos + 7 altos + 3 médios = 15. Isso significa que você precisa decidir deliberadamente quais dos seus 15 controles são "critical", "high" ou "medium" para bater exatamente nesses números — não é uma consequência natural, é uma meta que seu script precisa produzir.

## Passo 3 — `threat_mapping` é o que conecta esse projeto ao trabalho anterior

Cada controle deve referenciar uma ameaça real já documentada nos módulos anteriores — por exemplo, "movimento lateral via SSH" remete à Finding 009 do 1x02 e à Fase 3 do Crimson Tide (1x05). Não invente ameaças genéricas; use as mesmas que você já rastreou nos projetos 1x01 a 1x05.

## Passo 4 — `implementation_task` já revela a arquitetura das próximas tarefas

Esse campo deve apontar para o script de hardening que vai implementar aquele controle especificamente (ex: SSH → Tarefa 4, sysctl → Tarefa 5, e assim por diante nas tarefas 6-13 que ainda virão). Pense nisso como um índice que amarra o perfil CIS a um roteiro de scripts futuros — "Mapped implementation tasks: 10" no output esperado sugere que os 15 controles se agrupam em 10 tarefas de implementação distintas.

## Onde entregar

Os arquivos finais vão como `1-cis_profile.sh` e `cis_profile.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
