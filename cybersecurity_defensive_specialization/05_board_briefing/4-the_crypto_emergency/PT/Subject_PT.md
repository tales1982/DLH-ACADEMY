# 4. A Emergência Criptográfica

**Objetivo:** Identificar as fragilidades criptográficas específicas que o Crimson Tide explora e priorizar as correções criptográficas do 1x04 que endereçam esse ataque.

## Contexto

O alerta revela que o Crimson Tide tem como alvo específico bancos de dados não criptografados e backups não criptografados. Sua Avaliação de Postura Criptográfica (1x04) identificou exatamente essas lacunas. A pergunta agora é: quais correções criptográficas do seu plano de implementação precisam ser aceleradas para conter essa ameaça específica?

## Instruções

### Parte 1 — Mapeamento da Superfície de Ataque Criptográfica

Para cada fase do Crimson Tide que explora uma fragilidade criptográfica:

```
Fase: [Número e nome]
Fragilidade Criptográfica: [Lacuna específica do 1x04 T0 ou T15]
O Que o Crimson Tide Explora: [Como a ausência de criptografia permite essa fase]
Correção Criptográfica Recomendada: [Do plano de implementação do 1x04]
Prazo de Emergência: [Isso pode ser acelerado para 72 horas?]
```

### Parte 2 — Reordenação de Prioridades de Criptografia

Seu plano de implementação do 1x04 tinha 5 ações prioritárias. Com base no alerta do Crimson Tide, a ordem deveria mudar? Produza uma **Lista de Prioridades Criptográficas Atualizada** com a justificativa para qualquer mudança.

### Parte 3 — O Cálculo "E Se"

Se o banco de dados de pacientes da MedDefense estivesse criptografado em repouso (como recomendado no 1x04 T13), o que mudaria na Fase 4 do ataque do Crimson Tide? Os dados ainda seriam exfiltráveis? Em quais condições? (Considere: o atacante tem acesso de domain admin e a chave de criptografia do banco de dados está armazenada no mesmo servidor.)

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x05_board_briefing`
- **Arquivo:** `4-crypto_emergency.md`
