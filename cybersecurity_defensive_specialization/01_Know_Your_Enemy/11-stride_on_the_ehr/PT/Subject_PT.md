# 11. STRIDE no EHR

**Objetivo:** Aplicar o modelo de ameaça STRIDE em profundidade no sistema mais crítico da MedDefense pra identificar sistematicamente toda categoria de ameaça.

## Contexto

STRIDE é uma abordagem estruturada pra identificação de ameaças. Em vez de fazer brainstorm de ameaças aleatoriamente, você percorre seis categorias sistematicamente, garantindo que nada seja esquecido. Aplicado a um sistema específico com arquitetura conhecida, produz um inventário de ameaças abrangente que nenhum pensamento ad-hoc conseguiria igualar.

O sistema de EHR é o ativo mais crítico da MedDefense. Ele consiste no `ehr-srv-01` (servidor de aplicação), `ehr-db-01` (banco de dados PostgreSQL), as estações clínicas que o acessam e os caminhos de rede entre todos eles. Você já conhece a arquitetura do seu trabalho no 1x00. Agora coloque-a sob estresse.

**Categorias STRIDE:**

- **Spoofing (Falsificação):** Fingir ser alguém ou algo que não é
- **Tampering (Adulteração):** Modificar dados ou código sem autorização
- **Repudiation (Repúdio):** Negar que uma ação ocorreu quando de fato ocorreu
- **Information Disclosure (Divulgação de Informação):** Expor dados a partes não autorizadas
- **Denial of Service (Negação de Serviço):** Tornar um recurso indisponível
- **Elevation of Privilege (Elevação de Privilégio):** Obter capacidades além do que foi autorizado

## Instruções

Aplique STRIDE ao Sistema de EHR da MedDefense (`ehr-srv-01` + `ehr-db-01` + estações clínicas + conexões de rede). Para cada categoria STRIDE, identifique pelo menos 2 ameaças específicas e concretas, únicas desse sistema nesse ambiente.

Para cada ameaça:

```
Categoria: [S/T/R/I/D/E]
ID da Ameaça: [EHR-S1, EHR-T1, etc.]
Descrição: [O que especificamente poderia acontecer, não genérico, específico da MedDefense]
Vetor de Ataque: [Como essa ameaça seria realizada? Referencie vetores do T8]
Impacto: [Qual é a consequência num contexto clínico?]
Controle Existente: [Algo da Matriz de Controles do 1x00 endereça isso? Referencie o ID do Controle]
Gap: [Se nenhum controle existir, referencie o ID do Gap do 1x00]
```

Você deve produzir no mínimo 12 ameaças distribuídas nas 6 categorias (pelo menos 2 por categoria).

Depois do inventário de ameaças, escreva um **Resumo STRIDE para o EHR** (um parágrafo): Qual categoria STRIDE representa o maior risco para esse sistema específico, e por quê? O que torna essa categoria particularmente perigosa num contexto de saúde?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `11-stride_ehr.md`
