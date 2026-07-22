# 14. A Arquitetura de Segmentação

**Objetivo:** Projetar um plano de segmentação de rede que transforme a rede plana da MedDefense numa arquitetura defensável.

## Contexto

A rede plana apareceu em toda kill chain que você construiu no 1x01. Ela amplificou toda vulnerabilidade no 1x02. É a única fraqueza arquitetural cuja resolução tem o maior efeito cascata sobre a postura de risco da MedDefense. Agora você projeta a correção.

Essa tarefa é diferente das outras porque é um exercício de design. Você não está analisando nem avaliando. Você está criando uma arquitetura de rede que ainda não existe.

## Instruções

Projete um plano de segmentação de rede para a MedDefense com os seguintes entregáveis:

### Parte 1 — Definição de Zonas

Defina pelo menos 5 zonas de rede (VLANs) com seu propósito, quais sistemas pertencem a cada uma, e quais fluxos de tráfego são permitidos entre zonas:

- Zona de servidores (EHR, faturamento, servidor de arquivos, AD)
- Zona de estações clínicas (postos de enfermagem, estações de médicos)
- Zona de dispositivos médicos (monitores, bombas, PACS, ressonância)
- Zona de gerenciamento (estações de administração de TI, ferramentas de segurança)
- Zona de convidados/IoT (dispositivos não-clínicos, WiFi de visitantes)

Para cada zona: nome, faixa de IP, sistemas incluídos, conexões de saída permitidas e conexões de entrada permitidas.

### Parte 2 — Regras de Firewall

Escreva 10 regras de firewall críticas (em formato pseudocódigo: `zona de origem → zona de destino : porta/protocolo : allow/deny`) que aplicam a segmentação. Inclua pelo menos 2 regras de negação (deny) e explique o que cada regra previne.

### Parte 3 — Impacto na Kill Chain

Pegue sua kill chain #1 do 1x01 (o cenário de ransomware). Percorra-a passo a passo e identifique em qual(is) passo(s) a segmentação teria quebrado a cadeia. Estime a porcentagem das suas 5 principais kill chains que seriam interrompidas por esse design de segmentação.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `14-segmentation_architecture.md`
