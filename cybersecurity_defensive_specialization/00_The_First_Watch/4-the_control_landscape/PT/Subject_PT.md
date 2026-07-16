# 4. O Panorama de Controles

**Objetivo:** Identificar, classificar e documentar os controles de segurança existentes usando a taxonomia profissional de dois eixos: categoria (Técnico / Administrativo / Físico) e função (Preventivo / Detectivo / Corretivo).

## Contexto

James Chen te envia um e-mail depois da volta pelas instalações:

> "Boas observações hoje. Agora eu preciso que você faça a outra metade: documentar o que nós JÁ TEMOS, não só o que está errado. Pedi para a Sarah Park te dar acesso à nossa documentação existente. Ela vai te mandar trechos de configuração, documentos de política e qualquer outra coisa que ela conseguir encontrar. Monte um retrato completo dos nossos controles de segurança atuais."

Controles de segurança são os mecanismos que uma organização usa para proteger seus ativos. Eles são classificados em dois eixos.

### Categoria (do que o controle é feito)

- **Técnico:** Implementado por meio de tecnologia. Firewalls, criptografia, listas de controle de acesso, antivírus, monitoramento de logs.
- **Administrativo:** Implementado por meio de políticas, procedimentos e processos humanos. Treinamento de segurança, verificação de antecedentes, políticas de uso aceitável, planos de resposta a incidentes.
- **Físico:** Implementado no mundo físico. Fechaduras, câmeras, cercas, sistemas de combate a incêndio, leitores de crachá.

### Função (o que o controle faz)

- **Preventivo:** Impede que um incidente aconteça. Um firewall bloqueando tráfego não autorizado.
- **Detectivo:** Identifica um incidente durante ou depois que ele ocorre. Um IDS alertando sobre tráfego suspeito.
- **Corretivo:** Repara danos ou restaura operações depois de um incidente. Um procedimento de restauração de backup.

Duas funções adicionais que você vai encontrar:

- **Dissuasório:** Desencoraja um atacante de tentar uma ação. Uma placa de "Local Sob Vigilância."
- **Compensatório:** Uma alternativa usada quando o controle ideal não é viável. Isolamento de rede para um sistema que não pode ser corrigido (patched).

## Arquivos Fornecidos

- `meddefense-controls-artifacts.txt` (contém trechos de regras de firewall, configuração de SSH, documento de política de senhas, relatório de status de antivírus, configuração de backup, contrato de segurança física e registros de treinamento da equipe)

## Instruções

Revise todos os artefatos fornecidos. Para cada controle de segurança que você conseguir identificar, documente-o no seguinte formato:

```
Control ID: [C-001, C-002, etc.]
Control Name: [Nome descritivo]
Description: [O que ele faz, especificamente]
Category: [Technical / Administrative / Physical]
Function: [Preventive / Detective / Corrective / Compensating / Deterrent]
Asset(s) Protected: [Qual ativo ou zona esse controle protege]
Source: [De qual artefato você identificou isso]
```

Você precisa identificar no mínimo 12 controles distintos a partir dos artefatos fornecidos. Inclua controles das três categorias. Não invente controles que não estejam evidenciados nos artefatos.

Depois de listar todos os controles, produza uma **Matriz Resumo de Controles** em formato de tabela, colocando o Control ID de cada controle na célula apropriada. Células que permanecerem vazias após seu inventário representam possíveis lacunas.

| | Preventivo | Detectivo | Corretivo | Compensatório | Dissuasório |
|---|---|---|---|---|---|
| **Técnico** | | | | | |
| **Administrativo** | | | | | |
| **Físico** | | | | | |

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `4-control_inventory.md`
