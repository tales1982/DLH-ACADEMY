# 10. O Registro de Riscos

**Objetivo:** Construir o Registro de Riscos formal que servirá como a espinha dorsal operacional do programa de segurança da MedDefense.

## Contexto

Todo entregável que você produziu até agora — a análise de gaps, o panorama de ameaças, a avaliação de vulnerabilidades, os cálculos de ALE — alimenta um documento mestre: o Registro de Riscos. Isso não é um resumo. É o instrumento de governança vivo que acompanha cada risco identificado através de seu ciclo de vida: identificação, pontuação, tratamento, monitoramento e revisão.

Um Registro de Riscos profissional é o documento que o CISO abre quando o Conselho pergunta: "O que te tira o sono à noite?" Ele é revisado mensalmente, atualizado quando novas ameaças surgem e quando controles são implantados. É a fonte única de verdade sobre a postura de risco do programa de segurança.

## Instruções

Construa um Registro de Riscos da MedDefense contendo seus 10 principais riscos. Use os seguintes campos para cada entrada:

| Campo | Descrição |
|---|---|
| Risk ID | Identificador sequencial (RISK-001, RISK-002, etc.) |
| Descrição do Risco | Uma frase descrevendo o evento de risco |
| Categoria do Risco | Estratégico / Operacional / Conformidade / Financeiro |
| Fonte da Ameaça | Tipo de ator do 1x01 |
| Vulnerabilidade | ID do Achado do 1x02 |
| Ativo(s) Afetado(s) | Do Registro de Ativos do 1x00 |
| Probabilidade | Escala de 1-5 com definição |
| Impacto | Escala de 1-5 com definição |
| Nota de Risco Inerente | Probabilidade × Impacto |
| ALE | Da T5/T6 (onde disponível) |
| Dono do Risco | Pessoa/cargo específico na MedDefense |
| Decisão de Tratamento | Mitigar / Transferir / Aceitar / Evitar |
| Justificativa do Tratamento | Por que essa decisão, em uma frase |
| Controle(s) Planejado(s) | Controles específicos da T7 |
| Risco Residual | Depois que os controles planejados forem aplicados |
| KRI | Indicador-Chave de Risco que sinalizaria que esse risco está aumentando |
| Data de Revisão | Quando essa entrada de risco será reavaliada |

Depois do registro, escreva uma **Nota de Governança do Registro de Riscos** (um parágrafo): Quem mantém esse registro na MedDefense? Com que frequência ele é revisado? O que dispara uma revisão fora do ciclo? O que acontece quando um limite de KRI é ultrapassado?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `10-risk_register.md`
