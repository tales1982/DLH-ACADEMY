# 13. A Exposição Web

**Objetivo:** Analisar vulnerabilidades voltadas à web com atenção específica à exposição na internet vs exposição somente interna.

## Contexto

Uma vulnerabilidade num sistema exposto à internet e a mesma vulnerabilidade num sistema somente interno não são o mesmo risco. O relatório de scan tem achados relacionados à web no portal do paciente (exposto à internet), na interface de gerenciamento do NAS (interno) e no servidor de aplicação do EHR (interno, mas na rede plana). Cada um exige uma análise diferente.

## Instruções

Identifique todos os achados relacionados à web no relatório de scan (cabeçalhos de segurança, configuração TLS, divulgação de informação, vulnerabilidades de aplicação). Agrupe-os por host e analise:

Para cada host com achados web:

- **Host:** [Nome e IP]
- **Exposição:** [Exposto à internet / Somente interno / Interno mas acessível pela rede plana]
- **Achados:** [Liste todos os achados relacionados à web que afetam esse host]
- **Risco Combinado:** [Considerando todos os achados juntos, qual é o risco agregado?]
- **Cenário de Ataque:** [Como um atacante encadearia esses achados? Referencie as kill chains do 1x01 se aplicável]
- **Prioridade:** [Em relação aos outros hosts web, qual deveria ser corrigido primeiro?]

Depois da análise por host, responda: O Achado 017 (divulgação de informação do Tomcat) levou a SecurePoint a descobrir manualmente o Achado 031 (Ghostcat - CVSS 9.8). O que isso te diz sobre o valor de investigar achados "Médios" que revelam informação de versão?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `13-web_exposure.md`
