# 1. O Mergulho Profundo no CVE

**Objetivo:** Pesquisar o CVE-2023-27997 no NVD e avaliar sua explorabilidade usando as ferramentas que você já domina desde os Projetos 1x02 e 1x04.

## Contexto

O alerta cita o CVE-2023-27997 como o vetor de acesso inicial. Você tem as ferramentas e as habilidades para pesquisar esse CVE com o mesmo rigor que você aplicou aos achados do scan em 1x02. Dessa vez, a urgência não é acadêmica. Esse CVE está sendo ativamente explorado contra hospitais na sua região agora mesmo.

## Instruções

### Parte 1 — Pesquisa no NVD

Acesse nvd.nist.gov e pesquise o CVE-2023-27997. Documente:

- Descrição completa
- Vetor CVSS v3.1 e nota base
- Classificação CWE
- Produtos e versões afetados
- Referências (alerta do fornecedor, patches)

### Parte 2 — Avaliação de Exploit

Usando searchsploit e Exploit-DB, avalie a disponibilidade de exploit:

- Existe um exploit público?
- Esse CVE está no catálogo CISA KEV?
- Qual é a sua Pontuação de Explorabilidade (1-5, usando a escala do 1x02 T4)?

### Parte 3 — Contextualização CVSS para a MedDefense

Usando a Calculadora CVSS do NIST, aplique Métricas Ambientais específicas para o FortiGate da MedDefense. Considere:

- O FortiGate é a ÚNICA defesa de perímetro (sem redundância)
- Ele termina todos os túneis VPN (os 3 sites dependem dele)
- Ele está nas cadeias de ataque #1, #2 e #3 do 1x01
- O contrato de suporte expirou (aplicar o patch exige renovação primeiro)

Qual é a nota CVSS ajustada para a MedDefense? Ela é maior ou menor que a nota base?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x05_board_briefing`
- **Arquivo:** `1-cve_deep_dive.md`
