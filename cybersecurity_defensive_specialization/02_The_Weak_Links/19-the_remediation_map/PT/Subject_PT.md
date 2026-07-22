# 19. O Mapa de Remediação

**Objetivo:** Projetar ações de remediação específicas para cada vulnerabilidade priorizada, considerando restrições operacionais e os riscos da própria remediação.

## Contexto

Corrigir uma vulnerabilidade sempre tem um custo: o patch que quebra a aplicação de faturamento, a regra de firewall que bloqueia tráfego clínico legítimo, o reinício de servidor que tira o EHR do ar durante as visitas médicas. Remediação não é "aplicar o patch". Remediação é "aplicar o patch, mas primeiro entender o que pode quebrar, testar numa janela de manutenção, ter um plano de rollback, e comunicar com as equipes clínicas."

## Instruções

Para os seus 8 achados priorizados, projete um plano de remediação:

```
Achado [ID]:
  Tipo de Resposta: [Patch / Mudança de Configuração / Controle Compensatório / Exceção]

  Se Patch:
    Fonte do Patch: [URL do aviso do fornecedor ou método de atualização]
    Pré-requisitos: [Teste, janela de manutenção, backup]
    Plano de Rollback: [Como reverter se o patch causar problemas]
    Risco Operacional: [O que pode dar errado durante a aplicação do patch?]

  Se Mudança de Configuração:
    Descrição da Mudança: [Mudança exata necessária]
    Avaliação de Impacto: [Quais serviços ou usuários são afetados?]

  Se Controle Compensatório:
    Descrição do Controle: [Qual controle e como ele reduz o risco]
    Risco Residual: [Que risco permanece após o controle?]

  Se Exceção:
    Justificativa: [Por que a remediação não é viável]
    Data de Revisão: [Quando essa decisão será reavaliada]
    Monitoramento: [Que monitoramento compensa o risco aceito?]

  Prazo: [Imediato / 7 dias / 30 dias / 90 dias]
  Responsável: [TI / Segurança / Fornecedor / Clínico - quem executa isso?]
  Estimativa de Custo: [$0-1K / $1-10K / $10-50K / $50K+]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `19-remediation_map.md`
