# 14. A Postura de Rede

**Objetivo:** Quantificar como a arquitetura de rede plana amplifica o risco efetivo de cada vulnerabilidade individual.

## Contexto

A rede plana não é um achado no relatório de scan. É o achado que está por baixo de todos os outros achados. Toda vulnerabilidade no scan é mais perigosa por causa da rede plana. Uma injeção de SQL no `billing-srv-01` ficaria contida ao segmento de faturamento numa rede segmentada. Na rede plana da MedDefense, ela é um trampolim para o EHR, o controlador de domínio e os dispositivos médicos.

## Instruções

Selecione 3 CVEs do scan que afetam sistemas diferentes. Para cada um, faça uma análise de impacto de segmentação:

```
CVE: [ID]
Host: [Sistema afetado]
Nota Base CVSS: [Do scan]

Cenário A: Atual (rede plana):
  Quem consegue alcançar essa vulnerabilidade: [Todo o 10.10.0.0/16 - descreva o escopo]
  O que o atacante consegue alcançar DEPOIS da exploração: [Todos os outros sistemas, descreva o raio de impacto]
  Risco Efetivo: [Sua avaliação]

Cenário B: Hipotético (rede segmentada):
  Quem consegue alcançar essa vulnerabilidade: [Só sistemas na mesma VLAN]
  O que o atacante consegue alcançar DEPOIS da exploração: [Só sistemas na mesma VLAN, a menos que consigam pivotar através de um firewall]
  Risco Efetivo: [Sua avaliação]

Fator de Amplificação de Risco: [O quanto a rede plana aumenta o risco real desse CVE específico?]
```

Depois das 3 análises, produza um **Resumo de Postura de Rede** (um parágrafo): Qual é o efeito agregado de amplificação de risco da rede plana em todo o relatório de scan? Por que a segmentação de rede é possivelmente mais impactante do que corrigir qualquer CVE individual?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `14-network_posture.md`
