# 20. O Playbook de Implementação

**Objetivo:** Produzir um playbook operacional passo a passo pras primeiras 5 mudanças criptográficas a serem implantadas em produção.

## Contexto

Esse é o documento que a Sarah Park leva pra equipe de TI dela numa segunda-feira de manhã. Não é uma estratégia. Não é um relatório. É um playbook: faça isso, depois isso, depois verifique, depois prossiga. Cada ação tem pré-requisitos, passos, critérios de validação e um plano de rollback.

## Instruções

Produza um Playbook de Implementação pras 5 mudanças criptográficas de maior prioridade da sua avaliação. Pra cada uma:

```
Ação #[N]: [Nome descritivo]
Prioridade: [Da T15 - Imediata / Fase 1 / Fase 2]
Sistema Afetado: [Hostname específico]
Pré-requisitos: [O que precisa estar em vigor antes de começar]

Passos:
  1. [Comando específico ou mudança de configuração]
  2. [...]
  3. [...]

Validação:
  - [Como verificar que a mudança foi aplicada corretamente]
  - [Como verificar que nenhuma interrupção de serviço ocorreu]

Rollback:
  - [Como reverter se algo der errado]
  - [Tempo máximo de inatividade aceitável antes do rollback ser acionado]

Janela de Manutenção: [Quando realizar isso - horário comercial serve ou precisa ser durante a madrugada?]
Comunicação: [Quem precisa ser notificado antes e depois]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `22-implementation_playbook.md`
