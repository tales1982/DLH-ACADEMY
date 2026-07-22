# 11. A Seleção de Controles

**Objetivo:** Selecionar e justificar controles de segurança específicos para cada risco no registro, mapeando cada escolha para os CIS Controls e o NIST CSF.

## Contexto

O Registro de Riscos te diz O QUE existe de risco. Agora você decide O QUE fazer a respeito de cada um. Todo controle que você selecionar precisa satisfazer três critérios: precisa reduzir o risco específico que mira (efetividade), precisa caber no orçamento (eficiência), e precisa mapear para um framework reconhecido para que auditores consigam verificar (rastreabilidade).

## Instruções

Para cada um dos 10 riscos no seu Registro de Riscos que tem tratamento "Mitigar," selecione um ou mais controles específicos. Para cada controle:

```
Risco: [RISK-ID da T10]
Controle Selecionado: [Nome/descrição específica]
Mapeamento CIS Control: [Número do controle e ID da salvaguarda]
Mapeamento NIST CSF: [Função.Categoria, ex: PR.AC]
Tipo de Controle: [Preventivo / Detectivo / Corretivo / Compensatório]
Categoria do Controle: [Técnico / Administrativo / Operacional / Físico]
Custo de Implementação: [Da análise da T7]
Redução de Risco Esperada: [Quantificada onde possível]
Dependências: [Esse controle exige que outro controle já esteja em vigor primeiro?]
```

Depois das seleções individuais, produza um **Mapa de Dependência de Controles**: um diagrama em texto mostrando quais controles precisam ser implementados antes de outros. Por exemplo, a segmentação de rede precisa vir antes do isolamento de dispositivos médicos. O SIEM precisa vir antes do monitoramento 24/7.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `11-control_selection.md`
