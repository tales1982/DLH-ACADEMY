# 14. As Decisões de Risco

**Objetivo:** Aplicar estratégias de tratamento de risco às lacunas priorizadas, sob restrições realistas de orçamento e operação.

## Contexto

James Chen se senta com você para uma sessão de estratégia:

> "OK. Identificamos os problemas. Agora vem a parte difícil: o que nós realmente vamos FAZER a respeito? Eu tenho um orçamento de segurança de $120.000 para este ano fiscal. Isso parece muito, até você perceber que uma única licença de SIEM corporativo custa $80.000. Não podemos consertar tudo. Precisamos ser estratégicos."
>
> "Para cada uma das nossas principais lacunas, precisamos de uma decisão de tratamento. E 'consertar' não é uma estratégia."

## As Quatro Estratégias de Tratamento de Risco

- **Mitigar:** Implementar controles para reduzir o risco a um nível aceitável. Custa dinheiro e/ou esforço.
- **Transferir:** Transferir a consequência financeira para um terceiro (seguro, terceirização). Não elimina o risco, muda quem paga.
- **Aceitar:** Reconhecer o risco e não tomar nenhuma ação. Exige justificativa documentada e aprovação da liderança. Válido quando o custo da mitigação excede a perda potencial.
- **Evitar:** Eliminar o risco eliminando a atividade ou o ativo que o gera. Às vezes é a resposta certa, mas frequentemente não é viável.

## Instruções

Selecione as **7 lacunas de maior prioridade** da sua Análise de Lacunas (Task 12, atualizada no Task 13). Para cada uma, produza uma Decisão de Tratamento de Risco:

```
Gap ID: [Referência]
Título da Lacuna: [Da análise de lacunas]
Nível de Risco: [Da análise de lacunas, atualizado se mudou no Task 13]

Estratégia de Tratamento: [Mitigar / Transferir / Aceitar / Evitar]

Justificativa: [Por que essa estratégia para essa lacuna -- considere orçamento, viabilidade, impacto operacional]
```

**Se Mitigar:**
```
Controle(s) Proposto(s): [Controles específicos -- categoria e função]
Custo Estimado: [Ordem de grandeza: $0-1K / $1-10K / $10-50K / $50K+]
Esforço de Implementação: [Vitória Rápida < 1 semana / Curto Prazo < 1 mês / Longo Prazo > 1 mês]
Redução de Risco Esperada: [O quanto isso reduz o risco, e por quê]
```

**Se Transferir:**
```
Mecanismo de Transferência: [Tipo de seguro, serviço terceirizado, etc.]
Risco Residual: [Que risco permanece depois da transferência]
```

**Se Aceitar:**
```
Justificativa da Aceitação: [Por que o custo do tratamento excede a perda esperada]
Gatilho de Revisão: [Sob quais condições essa decisão deveria ser revisada]
```

**Se Evitar:**
```
Ação de Evitação: [Que atividade/ativo está sendo eliminado]
Impacto no Negócio: [O que a MedDefense perde ao evitar esse risco]
```

Toda entrada de lacuna termina com:

```
Trade-offs: [Quais são as desvantagens da estratégia escolhida?]
```

Ao final, produza um **Resumo de Orçamento** mostrando como suas recomendações de mitigação se encaixam no orçamento anual de $120.000. Se elas excederem o orçamento, explique o que você adiaria para o próximo ano fiscal e por quê.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `14-risk_decisions.md`
