# 0. O Relatório de Scan

**Objetivo:** Desenvolver o reflexo profissional de ler um relatório de scan pela sua estrutura e contexto antes de mergulhar em cada achado individual.

## Contexto

Trinta e um achados. Quatro Críticos. Sete Altos. A tentação é pular direto pros vermelhos. Resista.

Um relatório de scan é um conjunto de dados, não uma análise. Antes de investigar qualquer achado individual, você precisa entender o formato geral dos dados: quantos achados existem, qual a distribuição de severidade, quais sistemas são mais afetados, o que o scanner cobriu e, principalmente, o que ele não cobriu.

Essa é a mesma disciplina que separa um analista júnior de um sênior. O júnior entra em pânico com "4 Críticos". O sênior pergunta: "4 Críticos de quantos no total? Em quais sistemas? Estão no mesmo ativo? Estão relacionados?"

## Arquivos Fornecidos

- `meddefense-vulnerability-scan.txt`

## Instruções

Leia o relatório de scan inteiro, do início ao fim. Não pesquise nenhum achado individual ainda. Depois produza um **Resumo de Primeiras Impressões** contendo:

1. **Metadados do Scan:** O que foi escaneado, quando, por quem, qual política de scan foi usada, o que NÃO foi escaneado (leia as notas de metodologia).
2. **Distribuição de Achados:** Contagem por severidade (Crítico/Alto/Médio/Baixo/Informativo). Qual nível de severidade tem mais achados?
3. **Mapa de Calor de Ativos:** Quais hosts aparecem com mais frequência nos achados? Liste os 5 principais hosts por número de achados. Cruze com seu Registro de Ativos (1x00 T7) para identificar o papel de cada host.
4. **Primeiras Observações:** Baseado numa leitura rápida (não pesquisa profunda), quais padrões você percebe? Os achados Críticos estão concentrados em um sistema ou espalhados por vários? Algum achado parece se relacionar com outro? Alguma coisa te surpreendeu?
5. **Limitações do Scan:** O que esse scan NÃO te diz? Quais ativos, serviços ou tipos de vulnerabilidade estão fora do escopo dele?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `0-first_impressions.md`
