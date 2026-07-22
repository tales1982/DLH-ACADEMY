# 6. Os Achados de Configuração Incorreta

**Objetivo:** Analisar vulnerabilidades que não têm identificador CVE e entender por que elas são igualmente perigosas.

## Contexto

O relatório de scan contém achados marcados como "Configuração Incorreta" sem CVE. Sem CVE significa sem nota CVSS, sem página no NVD, sem entrada no Exploit-DB. Também significa que a maioria das ferramentas automatizadas de priorização vai ignorá-los. Esse é exatamente o problema.

A Onda de Ransomware do MongoDB de 2017 afetou 28.000 bancos de dados. Nenhum tinha CVE. Todo comprometimento foi uma configuração incorreta: bancos de dados expostos à internet sem autenticação. A violação da Capital One de 2019, que expôs 100 milhões de registros, foi uma configuração incorreta. Não foi um bug de software. Foi uma regra mal configurada do AWS WAF.

## Instruções

Identifique 6 achados de configuração incorreta no relatório de scan (achados com "N/A" no campo CVE). Para cada um:

- **ID do Achado:** [Do relatório de scan]
- **Host:** [Sistema afetado]
- **Configuração Incorreta:** [O que está errado, especificamente]
- **Por Que Não Tem CVE:** [Explique por que isso é um erro de configuração, não um bug de software]
- **Avaliação de Severidade:** [Crítico/Alto/Médio/Baixo - seu julgamento, justificado]
- **Cruzamento com o 1x00:** [Isso corresponde a uma observação do seu walk-through (1x00 T3), uma lacuna de controle (1x00 T5), ou um achado do scan de rede (1x00 T7)? Seja específico.]
- **Risco de CVE Comparável:** [Nomeie um CVE do scan que tenha um nível de risco real similar, e explique por que a configuração incorreta é igualmente ou mais perigosa apesar de não ter nota CVSS]

Depois das 6 análises, responda em um parágrafo: Por que a afirmação "Nosso scan de CVE não mostra nada crítico, estamos seguros" fornece uma falsa segurança perigosa?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `6-misconfiguration_analysis.md`
