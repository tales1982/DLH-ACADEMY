# 3. O Arquivo do Insider

**Objetivo:** Distinguir ameaças internas maliciosas de negligentes, identificar indicadores comportamentais, e conectar cada cenário a lacunas de controle já existentes.

## Contexto

Nem toda ameaça vem através do firewall. James Chen traz isso à tona durante um café:

> "Quando o Conselho ouve 'cibersegurança', eles imaginam um hacker de moletom com capuz num quarto escuro. Eles não imaginam uma atendente de faturamento que copia prontuários de pacientes pra um pendrive porque está com raiva de ter sido preterida numa promoção. Mas nosso registro de incidentes do ano passado conta uma história diferente."

A ameaça interna é particularmente perigosa na saúde porque a equipe clínica precisa de acesso amplo a dados de paciente pra fazer seu trabalho. O desafio não é restringir o acesso — é detectar quando um acesso legítimo vira um uso ilegítimo.

## Instruções

Você recebe 5 cenários de insider retirados diretamente do ambiente da MedDefense. Para cada um, produza uma análise estruturada.

### Os Cenários

**Cenário 1 — O Login Compartilhado:** O departamento de Radiologia usa uma conta compartilhada ("raduser/radiology1") para a estação PACS. Vários técnicos usam as mesmas credenciais ao longo do dia. Ninguém desloga entre pacientes.

**Cenário 2 — A Conta Fantasma:** A conta VPN de um contratado de suporte de TI permaneceu ativa por 47 dias depois que o contrato dele terminou. Os logs de rede mostram que a conta se autenticou 3 vezes fora do horário nas semanas após o desligamento. *(Referência: isso espelha o Incidente F da sua análise de incidentes do 1x00.)*

**Cenário 3 — O NAS Pessoal:** O Dr. Patel, da Cardiologia, conectou um dispositivo NAS pessoal na tomada de rede do escritório dele. Ele guarda dados de pesquisa e "cópias de conveniência" de arquivos de pacientes que consulta com frequência. O NAS não é criptografado, não tem backup, e não é visível para a TI. *(Referência: o achado de shadow IT do Task 11 do 1x00.)*

**Cenário 4 — A Funcionária Curiosa:** Uma atendente de recepção acessa o prontuário eletrônico de um político local que foi tratado no MedDefense Central. Ela não altera nada. Ela conta pra uma amiga sobre a visita. A amiga posta isso nas redes sociais.

**Cenário 5 — O Administrador Sobrecarregado:** Um administrador de sistemas, sobrecarregado de chamados, escreve um script para automatizar redefinições de senha. O script guarda credenciais de administrador do Active Directory em texto puro num arquivo na área de trabalho dele. Ele compartilha o script com um colega por e-mail pra "ajudar com o backlog."

### Para Cada Cenário, Entregue

```
Cenário [N]:
  Classificação: [Maliciosa / Negligente - justifique]
  Indicadores Comportamentais: [Que sinais observáveis poderiam ter sinalizado isso antes do dano ocorrer? Liste 2-3]
  Controle Existente (do 1x00): [Qual controle da sua Matriz de Controles cobre ou deveria cobrir isso? Se nenhum, diga isso]
  Lacuna Explorada (do 1x00): [Qual lacuna da sua Análise de Lacunas permitiu esse cenário? Referencie o Gap ID se possível]
  Mitigação Recomendada: [Um controle específico - Técnico ou Administrativo - que reduziria esse risco]
```

Depois das 5 análises individuais, escreva uma **Avaliação de Padrão** (um parágrafo): Que fragilidade sistêmica na MedDefense torna ameaças internas particularmente perigosas? Conecte sua resposta a pelo menos 2 achados do Projeto 1x00.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `3-insider_assessment.md`
