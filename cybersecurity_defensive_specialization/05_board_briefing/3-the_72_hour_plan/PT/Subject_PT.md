# 3. O Plano de 72 Horas

**Objetivo:** Desenhar um plano de resposta emergencial priorizando as ações que a MedDefense precisa tomar nas próximas 72 horas para reduzir a exposição ao Crimson Tide.

## Contexto

A Estratégia de Segurança era um roteiro de 6 meses. O Crimson Tide comprimiu esse prazo para 72 horas. Você não pode implementar a estratégia inteira da noite para o dia. Você precisa escolher as ações que trazem a maior redução de risco no menor tempo, com os recursos disponíveis agora.

As restrições são reais:

- Sarah Park tem 2 pessoas de TI disponíveis hoje à noite (além dela mesma)
- O firmware do FortiGate exige renovação do contrato de suporte ($2.400) antes de poder ser baixado
- O projeto de segmentação exige configuração de novos switches (2-3 dias no mínimo)
- O isolamento do backup pode ser feito hoje à noite (desconexão física do NAS da rede)
- Mudanças na configuração Kerberos do AD exigem uma janela de manutenção (risco de quebrar a autenticação)

## Instruções

Produza um **Plano de Resposta Emergencial de 72 Horas** organizado em 3 níveis:

- **Nível 1 — Hoje à Noite (0-12 horas):** Ações que podem ser tomadas imediatamente, sem aprovação de orçamento, sem compras e com risco mínimo de interrupção de serviço. São as coisas que você faz antes de dormir.
- **Nível 2 — Amanhã (12-36 horas):** Ações que exigem alguma coordenação, possivelmente uma breve janela de serviço, e podem precisar de aprovação de orçamento emergencial na reunião com a diretoria.
- **Nível 3 — Essa Semana (36-72 horas):** Ações que exigem compras, envolvimento de fornecedores ou mudanças de configuração que precisam de testes.

Para cada ação:

```
Ação: [Descrição específica]
Fase Bloqueada: [Qual fase do Crimson Tide isso endereça?]
Responsável: [James / Sarah / Você / Fornecedor externo]
Pré-requisitos: [O que precisa acontecer primeiro?]
Risco da Ação: [O que pode dar errado?]
Risco da Inação: [O que acontece se isso não for feito?]
```

Termine com uma **Avaliação de Conflito de Recursos**: alguma ação do Nível 1 conflita com alguma do Nível 2 (mesma pessoa necessária em múltiplas tarefas, mesmo sistema precisando de múltiplas mudanças)? Como você resolve esses conflitos?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x05_board_briefing`
- **Arquivo:** `3-emergency_plan.md`
