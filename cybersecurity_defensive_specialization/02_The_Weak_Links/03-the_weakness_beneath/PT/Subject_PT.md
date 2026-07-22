# 3. A Fraqueza Por Baixo

**Objetivo:** Usar a taxonomia CWE para identificar padrões de fraqueza por trás de CVEs individuais.

## Contexto

O CVE te diz "o que está quebrado." O CWE te diz "por que continua quebrando." Se três CVEs diferentes, em três produtos diferentes, remetem todos ao CWE-787 (Out-of-bounds Write), isso não é coincidência, é um padrão. Entender o padrão permite prever onde a próxima vulnerabilidade vai aparecer, não só reagir à atual.

## Instruções

Vá até cwe.mitre.org.

### Parte 1: Rastreando CVEs até CWEs

Selecione 3 CVEs do relatório de scan que tenham atribuições de CWE na página do NVD. Para cada um:

- Identifique o CWE (ID + nome)
- Vá até a página do CWE e leia a descrição
- Encontre a posição do CWE na hierarquia (ele é filho de uma fraqueza mais ampla? qual é o pai?)
- Verifique: esse CWE está no CWE Top 25 Most Dangerous Software Weaknesses?

### Parte 2: Análise de Padrões

Olhe para todos os 31 achados do relatório de scan. Quantos CWEs distintos você consegue identificar? Existem achados que compartilham o mesmo CWE subjacente, mesmo sendo CVEs diferentes? Identifique pelo menos um padrão assim.

### Parte 3: Recomendação

Com base nos padrões de CWE que você encontrou no scan da MedDefense: se a MedDefense estivesse desenvolvendo software internamente, qual categoria de CWE os desenvolvedores deveriam ser treinados para evitar primeiro, e por quê?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `3-cwe_analysis.md`
