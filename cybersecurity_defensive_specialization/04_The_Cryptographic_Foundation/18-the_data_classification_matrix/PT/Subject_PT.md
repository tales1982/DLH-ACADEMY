# 18. A Matriz de Classificação de Dados

**Objetivo:** Aplicar princípios de proteção de dados pra produzir uma política de classificação de dados abrangente pra MedDefense que guie toda decisão de criptografia.

## Contexto

Criptografia não é binária ("criptografado" ou "não criptografado"). É um espectro guiado pela sensibilidade do dado. O cardápio do refeitório de um hospital não precisa de AES-256. O status de HIV de um paciente precisa. A classificação do dado determina o nível de proteção, e o nível de proteção determina o algoritmo, o rigor do gerenciamento de chaves e os controles de acesso.

## Instruções

### Parte 1 - Inventário de Tipos de Dado

Classifique todos os dados da MedDefense em tipos: Regulado (HIPAA/PHI), PII, Financeiro, Propriedade Intelectual, Legal e Operacional. Alguns dados podem pertencer a múltiplos tipos.

### Parte 2 - Níveis de Classificação

Defina 4 níveis de classificação pra MedDefense:

- **Público** (exemplo: endereço do hospital, horário de visitas)
- **Interno** (exemplo: diretório de funcionários, agendas de reunião)
- **Confidencial** (exemplo: relatórios financeiros, contratos de fornecedores)
- **Restrito** (exemplo: prontuários de pacientes, credenciais, chaves de criptografia)

Pra cada nível, defina: quem pode acessar, que criptografia é exigida (em repouso e em trânsito), o que acontece se ele for exposto.

### Parte 3 - A Árvore de Decisão de Classificação

Produza uma árvore de decisão baseada em texto que um funcionário da MedDefense poderia seguir pra classificar um novo tipo de dado: "É dado de paciente? → Restrito. Contém informação financeira? → Confidencial. É dado operacional interno? → Interno."

### Parte 4 - Soberania e Geolocalização

A MedDefense está considerando migrar backups pro armazenamento em nuvem da AWS (do roadmap do 1x03). Em 2-3 frases, explique por que a soberania de dados importa pra saúde. Se a região da AWS fica em outro estado ou país, que implicações de HIPAA surgem? A criptografia mitiga a preocupação de soberania?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `18-data_classification.md`
