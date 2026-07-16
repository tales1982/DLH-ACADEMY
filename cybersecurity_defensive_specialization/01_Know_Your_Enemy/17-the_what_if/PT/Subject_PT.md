# 17. E Se...?

**Objetivo:** Demonstrar entendimento profundo da dinâmica do panorama de ameaças, analisando como mudanças específicas de negócio remodelariam o perfil de ameaça da MedDefense.

## Contexto

Um panorama de ameaças não é estático. Ele muda a cada decisão de negócio, cada mudança tecnológica, cada evento público. A capacidade de antecipar como as ameaças evoluem, antes que se materializem, separa segurança reativa de segurança proativa.

## Instruções

Analise 3 mudanças hipotéticas no negócio ou ambiente da MedDefense. Para cada uma, produza uma avaliação de impacto estruturada.

**Cenário A:** A MedDefense faz parceria com uma universidade pra lançar um ensaio clínico de um tratamento cardíaco experimental. O ensaio envolve 500 pacientes, protocolos de pesquisa proprietários e colaboração com 3 instituições de pesquisa internacionais. Os dados do ensaio ficam armazenados num novo servidor dedicado na MedDefense Central.

**Cenário B:** A MedDefense migra seu sistema de EHR do local (`ehr-srv-01` / `ehr-db-01`) para um modelo SaaS hospedado na nuvem, fornecido pela MedTech Solutions. Os servidores locais são desativados. Todo acesso ao EHR passa pela nuvem.

**Cenário C:** Um veículo de notícias regional publica uma matéria investigativa revelando que a MedDefense foi vítima do ataque de ransomware de janeiro no `billing-srv-01`. A matéria inclui depoimentos de ex-pacientes preocupados com seus dados. A história é replicada por mídia nacional de saúde.

Para cada cenário, responda:

- **Novos Atores de Ameaça:** Essa mudança atrai novos tipos de adversário? Quais e por quê?
- **Vetores Alterados:** Quais vetores de ataque se tornam mais ou menos relevantes?
- **Prioridades Deslocadas:** Como o Top 5 de ameaças do T16 muda? Alguma sobe ou desce?
- **Novos Gaps:** Isso cria algum gap de segurança que não existia antes?
- **Avaliação Líquida:** A exposição geral a ameaça da MedDefense aumenta, diminui ou muda de forma? (Um veredito de uma frase, com justificativa.)

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `17-threat_evolution.md`
