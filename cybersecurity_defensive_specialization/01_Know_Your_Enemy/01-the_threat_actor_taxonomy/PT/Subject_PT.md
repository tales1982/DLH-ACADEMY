# 1. A Taxonomia de Agentes de Ameaça

**Objetivo:** Classificar agentes de ameaça por tipo, atributos e motivação, usando somente o comportamento observado.

## Contexto

Analistas de inteligência raramente sabem quem atacou uma organização no momento da investigação. O que eles têm é comportamento: o que o atacante fez, como fez, o que mirou, e o que deixou pra trás. A partir do comportamento, você infere o tipo de agente. A partir do tipo de agente, você prevê o próximo movimento dele.

Frameworks definem seis categorias de agente de ameaça: estado-nação, crime organizado, hacktivista, ameaça interna (insider), atacante sem habilidade, e shadow IT. Cada uma tem atributos característicos:

- **Interno vs Externo:** O agente opera de dentro ou de fora da organização?
- **Recursos e Financiamento:** O agente tem apoio financeiro significativo, ou trabalha com ferramentas gratuitamente disponíveis?
- **Sofisticação:** O agente desenvolve ferramentas e técnicas customizadas, ou depende de exploits publicamente disponíveis?

As motivações variam: exfiltração de dados, espionagem, disrupção de serviço, chantagem, ganho financeiro, crenças filosóficas ou políticas, motivações éticas, vingança, caos, guerra.

## Arquivos Fornecidos

- `threat-actor-reports.txt` (8 relatórios de inteligência anonimizados, cada um com 3-4 frases descrevendo um ataque)

## Instruções

Para cada um dos 8 relatórios, produza uma classificação estruturada:

```
Relatório [Letra]:
  Tipo de Agente: [Uma das 6 categorias]
  Interno/Externo: [Interno / Externo / Poderia ser qualquer um - justifique]
  Recursos: [Alto / Médio / Baixo - justifique]
  Sofisticação: [Alta / Média / Baixa - justifique]
  Motivação Primária: [Uma da lista de motivações Sec+ - justifique]
  Nível de Confiança: [O quão certo você está? Alto/Médio/Baixo e por quê]
```

Para o **Relatório G**, que é deliberadamente ambíguo, explique por que múltiplos tipos de agente poderiam se encaixar e qual evidência ajudaria a distinguir entre eles.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `1-threat_actor_taxonomy.md`
