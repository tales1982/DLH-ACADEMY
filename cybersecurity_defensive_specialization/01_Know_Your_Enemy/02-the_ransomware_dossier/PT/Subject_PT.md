# 2. O Dossiê de Ransomware

**Objetivo:** Analisar o modelo operacional de um grupo de ransomware-as-a-service e avaliar sua ameaça específica à MedDefense.

## Contexto

Três hospitais regionais num raio de 320 km da MedDefense foram atingidos por ransomware nos últimos 8 meses. Dois pagaram. O terceiro perdeu 3 semanas de dados e desviou ambulâncias por 11 dias. O James Chen não está dormindo bem.

Ransomware não é uma ameaça monolítica. É uma indústria. Desenvolvedores constroem as ferramentas. Afiliados as implantam. Corretores de acesso inicial vendem os pontos de entrada. Negociadores cuidam da extorsão. Entender esse ecossistema é a diferença entre um slide genérico de "ransomware é ruim" e uma avaliação específica e acionável da exposição da MedDefense.

## Arquivos Fornecidos

- `blackreef-ransomware-profile.txt` (um perfil detalhado de um grupo RaaS fictício, mas realista)

## Instruções

Leia o perfil do BlackReef. Depois produza uma **Avaliação de Ameaça de Ransomware para a MedDefense** com quatro seções:

1. **Resumo do Modelo Operacional:** Descreva como o BlackReef opera. Cubra: o modelo RaaS (papéis de desenvolvedor vs afiliado), o ciclo de vida do ataque (do acesso inicial à extorsão), e o mecanismo de dupla extorsão. Mantenha factual e conciso.
2. **Lógica de Direcionamento à Saúde:** Usando o perfil do BlackReef E o dossiê de inteligência do Task 0, explique em um parágrafo substancial por que hospitais são estruturalmente alvos ideais para grupos de ransomware. Identifique pelo menos 3 fatores específicos.
3. **Avaliação de Exposição da MedDefense:** Referencie diretamente sua Análise de Lacunas do Projeto 0x00. Identifique as 4 lacunas que um grupo no estilo BlackReef exploraria, na ordem provável da sequência de ataque. Para cada lacuna: nomeie-a (com Gap ID se possível), explique como ela habilita o próximo passo na cadeia de ataque, e avalie o que acontece se essa lacuna não for fechada.
4. **Avaliação de Probabilidade:** Numa escala de Crítica / Alta / Média / Baixa, qual é a probabilidade de a MedDefense enfrentar um ataque de ransomware nos próximos 12 meses? Justifique sua avaliação usando estatísticas do setor (do dossiê) e fatores específicos da MedDefense (da sua avaliação de postura).

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `2-ransomware_assessment.md`
