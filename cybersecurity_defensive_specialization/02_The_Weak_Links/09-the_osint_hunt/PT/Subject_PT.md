# 9. A Caça OSINT

**Objetivo:** Usar inteligência de fontes abertas (OSINT) para identificar vulnerabilidades que afetam a MedDefense e que o scan automatizado não detectou.

## Contexto

Scanners automatizados não são onisciente. Eles verificam o que foram configurados para verificar, contra as bases de dados que possuem. Eles perdem: vulnerabilidades divulgadas depois que a base de plugins foi atualizada pela última vez, vulnerabilidades em serviços que não conseguem identificar (fingerprint), vulnerabilidades lógicas que exigem contexto para identificar, e fraquezas em configurações que não têm acesso autenticado para avaliar.

Uma avaliação completa de vulnerabilidades complementa o scan com pesquisa OSINT manual.

## Instruções

Usando fontes públicas (avisos de segurança de fornecedores, alertas da CISA, blogs de segurança, NVD), pesquise vulnerabilidades que afetam a stack tecnológica da MedDefense mas que NÃO foram identificadas no relatório de scan.

Foque em:

1. **Vulnerabilidades do FortiGate FortiOS** — a MedDefense usa um FortiGate 100F. Pesquise no NVD por CVEs recentes do FortiOS. Identifique pelo menos 1 CVE crítico ou alto que poderia afetar esse dispositivo (o scan pode não ter verificado o próprio firmware do firewall).
2. **Vulnerabilidades do Microsoft Office 365 / Entra ID** — a MedDefense usa O365 E3 para toda a organização. O scan não cobriu serviços em nuvem. Pesquise pelo menos 1 vulnerabilidade ou técnica de ataque recente mirando ambientes O365.
3. **Vulnerabilidades do Synology DSM** — o NAS de backup roda Synology DSM 7. Pesquise no NVD por CVEs do DSM 7. Identifique pelo menos 1.

Para cada vulnerabilidade encontrada:

- **Fonte:** [Onde você encontrou — URL do NVD, aviso da CISA, página do fornecedor]
- **CVE:** [Se aplicável]
- **Produto Afetado:** [Ativo da MedDefense]
- **Por Que o Scan Não Detectou:** [Estava fora do escopo? Scan não-autenticado? Plugin não disponível?]
- **CVSS / Severidade:** [Se disponível]
- **Impacto na MedDefense:** [O que a exploração significaria especificamente para a MedDefense?]
- **Recomendação:** [O que a MedDefense deveria fazer a respeito?]

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `9-osint_hunt.md`
