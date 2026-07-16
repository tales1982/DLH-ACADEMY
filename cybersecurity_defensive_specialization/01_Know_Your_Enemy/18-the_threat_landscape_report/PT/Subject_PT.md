# 18. O Relatório de Panorama de Ameaças

**Objetivo:** Produzir um Relatório de Panorama de Ameaças em nível profissional, adequado para revisão executiva e uso operacional.

## Contexto

Esse é o documento complementar à Avaliação de Postura de Segurança que você produziu no Projeto 0x00. Juntos, eles formam o quadro completo: como a MedDefense se parece por dentro (postura) e como ela se parece por fora (ameaças). O Conselho vai ler os dois lado a lado.

## Instruções

Produza um Relatório de Panorama de Ameaças completo da MedDefense Health Systems.

### Estrutura Obrigatória

**1. Resumo Executivo** (1 página no máximo)
- O panorama de ameaças em 2-3 frases
- A ameaça mais perigosa isolada contra a MedDefense
- Top 3 recomendações
- Escrito para um Conselho não-técnico

**2. Escopo e Metodologia**
- Fontes de inteligência usadas
- Frameworks analíticos aplicados (STRIDE, ATT&CK, análise de kill chain)
- Conexão com a Avaliação de Postura de Segurança (1x00)

**3. Panorama de Ameaças do Setor de Saúde**
- Por que a saúde é alvo (3-4 fatores-chave)
- Tendências atuais e ameaças emergentes
- Estatísticas do setor que contextualizam a exposição da MedDefense

**4. Perfis de Ator de Ameaça da MedDefense**
- Os 6 tipos de ator avaliados, com probabilidade e ranking de prioridade
- Foco nos Top 3 com perfis detalhados

**5. Análise de Superfície de Ataque**
- Superfícies externa, interna e humana resumidas
- Pontos-chave de exposição com evidência

**6. Caminhos de Ataque Críticos**
- As 5 kill chains com pontos de ruptura
- Os 3 ativos mais conectados e os 3 vetores mais versáteis

**7. Resumo da Análise STRIDE**
- Análise profunda do EHR (achados-chave)
- Análise de superfície do PACS, AD e Rede (principais ameaças por sistema)

**8. Cenários de Ameaça**
- Os 3 cenários em forma resumida (detalhe completo em apêndice)
- Avaliação de impacto no negócio para cada um

**9. Correlação Gap-Ameaça**
- Como as ameaças recalibraram as prioridades de gap do 1x00
- Os Críticos Três gaps e A Surpresa

**10. Recomendações Priorizadas**
- Top 5 ameaças com ações recomendadas
- Recomendação estratégica de 2 iniciativas
- Conexão com a próxima fase: avaliação de vulnerabilidade (1x02)

### Critérios de Qualidade

- Todo achado remonta a uma evidência (fontes de inteligência, dados do 1x00, análise de framework)
- Toda recomendação se conecta a uma ameaça específica e a um gap específico
- O relatório é autocontido: um leitor que não viu suas entregas de tarefas precisa entender as conclusões
- Tom profissional do início ao fim

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `18-threat_landscape_report.md`
