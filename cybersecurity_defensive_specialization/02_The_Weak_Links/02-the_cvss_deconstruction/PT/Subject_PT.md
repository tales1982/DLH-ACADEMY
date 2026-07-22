# 2. A Desconstrução do CVSS

**Objetivo:** Dominar o sistema de pontuação CVSS v3.1 desconstruindo, construindo e comparando notas usando a Calculadora do NIST.

## Contexto

Uma nota CVSS sem entendimento é só um número. Uma nota CVSS com entendimento é uma ferramenta de decisão. Esta tarefa transforma a primeira coisa na segunda.

Abra a Calculadora CVSS v3.1 do NIST no seu navegador. Você vai usá-la nos três exercícios.

## Instruções

### Exercício 1: Desconstrução

Pegue a seguinte string de vetor CVSS do relatório de scan (Achado 001, CVE-2021-44790):

```
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H
```

Para cada componente, explique:

- O que a abreviação significa
- O que o valor selecionado significa
- Quais outros valores são possíveis e como eles mudariam a nota
- Por que esse valor específico foi selecionado para esta vulnerabilidade

Depois responda: Se o Attack Vector fosse mudado de Network (N) para Local (L), qual seria a nova nota? Calcule na Calculadora do NIST e explique por que a nota muda.

### Exercício 2: Construção

Você descobre uma vulnerabilidade com estas características:

- Explorável apenas a partir da rede local (não da internet)
- A exploração é complexa e exige condições específicas
- O atacante precisa de privilégios de baixo nível
- Nenhuma interação do usuário é necessária
- A vulnerabilidade afeta apenas o sistema alvo (escopo inalterado)
- A exploração bem-sucedida compromete a confidencialidade completamente
- Nenhum impacto na integridade
- Nenhum impacto na disponibilidade

Construa a string do vetor CVSS manualmente. Depois insira na Calculadora do NIST e verifique sua nota. Documente a string do vetor, a nota calculada e a classificação de severidade.

### Exercício 3: Comparação

Selecione dois achados do relatório de scan: um com nota CVSS acima de 9.0 e outro com nota entre 5.0 e 7.0. Insira os dois vetores na calculadora, lado a lado. Identifique os componentes específicos que explicam a diferença de nota. Quais componentes têm o maior impacto na nota final?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `2-cvss_analysis.md`
