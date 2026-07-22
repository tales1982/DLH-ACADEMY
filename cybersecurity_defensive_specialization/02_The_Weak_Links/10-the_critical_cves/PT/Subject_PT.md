# 10. Os CVEs Críticos

**Objetivo:** Conduzir uma análise profunda e abrangente dos 5 achados mais críticos do relatório de scan.

## Contexto

A triagem superficial está feita. Agora é hora de se aprofundar nos achados que mais importam. Para cada achado crítico, você está construindo o pacote completo de inteligência que um gerente de SOC precisa para tomar uma decisão de correção: detalhes técnicos, status do exploit, contexto de negócio e correlação com ameaças.

## Instruções

Selecione os 5 achados do relatório de scan que você avalia como mais críticos (não necessariamente os 5 com o CVSS mais alto — use o julgamento que você desenvolveu nas tarefas anteriores). Para cada um:

```
Achado: [ID do Achado no relatório de scan]
CVE: [Se aplicável]
Host: [Do relatório de scan]
Papel do Ativo: [Do Registro de Ativos 1x00 - o que esse sistema faz?]
Criticidade do Ativo: [Da Matriz de Criticidade 1x00 - notas de CIA]

Análise Técnica:
  Descrição da Vulnerabilidade: [Com suas próprias palavras]
  Nota Base CVSS: [Do NVD]
  Disponibilidade de Exploit: [Da T4 - Nota de Explorabilidade 1-5]
  Status no CISA KEV: [Listado ou não]
  CWE: [Da T3]

Análise Contextual:
  Exposição de Rede: [Isso é alcançável da internet? Da rede plana? De quais sub-redes?]
  Posição na Cadeia de Ataque: [Esse achado aparece em alguma das 5 kill chains do 1x01 T10? Em qual passo?]
  Ator de Ameaça: [Qual tipo de ator do 1x01 T6 mais provavelmente exploraria isso? Por qual vetor?]
  Achados Relacionados: [Esse achado se combina com outros achados para criar uma cadeia? Referencie os IDs dos Achados.]

Prioridade Ajustada: [Crítico/Alto/Médio/Baixo - sua avaliação depois da análise contextual completa]
Justificativa: [Por que essa prioridade, referenciando todas as evidências acima]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `10-critical_cves.md`
