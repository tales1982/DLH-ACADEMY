# 1. O Ecossistema CVE

**Objetivo:** Navegar pelo National Vulnerability Database (NVD) para pesquisar CVEs específicos e entender o sistema global de identificação de vulnerabilidades.

## Contexto

Cada CVE naquele relatório de scan é uma entrada num registro global. Por trás de cada identificador existe uma história: quem descobriu a falha, o que ela afeta, quão severa ela é, se existe um patch, se existe um exploit. O NVD é onde essas histórias vivem.

Você vai usar o NVD constantemente como profissional de segurança. Esta tarefa constrói esse reflexo de navegação.

## Instruções

Selecione 3 CVEs do relatório de scan: um Crítico, um Alto, e um Médio. Vá até nvd.nist.gov e pesquise cada um.

Para cada CVE, documente:

- **CVE ID:** [ex.: CVE-2021-44790]
- **URL do NVD:** [link direto pra página do NVD]
- **Descrição:** [Com suas próprias palavras - não copie a descrição do NVD literalmente]
- **Produtos Afetados:** [Liste pelo menos 3 produtos/versões afetados a partir dos dados CPE do NVD]
- **String do Vetor CVSS v3.1:** [Copie o vetor completo]
- **Nota Base CVSS:** [Nota]
- **CWE:** [O ID e nome do CWE listado na página do NVD]
- **Referências:** [Liste 3 links de referência da página do NVD e identifique o que cada um é: aviso do fornecedor, patch, artigo, PoC, etc.]
- **Data de Publicação:** [Quando este CVE foi publicado?]
- **Última Modificação:** [Quando foi atualizado pela última vez?]

Depois das 3 análises de CVE, responda estas perguntas:

1. Qual é a estrutura de um ID de CVE? (O que o ano e o número significam?)
2. O que é uma CNA (CVE Numbering Authority) e qual papel ela exerce?
3. Quais estados de ciclo de vida um CVE pode ter? (Reserved, Published, Rejected — explique cada um.)
4. Encontre um CVE no NVD com status "Rejected." Por que ele foi rejeitado?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `1-cve_ecosystem.md`
