# 7. O Kit de Ferramentas de Ofuscação

**Objetivo:** Distinguir entre criptografia, hashing e técnicas de ofuscação, projetar um esquema de tokenização pra MedDefense, e avaliar a esteganografia tanto como ferramenta de proteção quanto como vetor de ameaça.

## Contexto

Nem todo mecanismo de proteção de dados é criptografia. O Sec+ 1.4 distingue várias técnicas de ofuscação: tokenização (substituir dados sensíveis por tokens não sensíveis), mascaramento de dados (esconder partes do dado preservando o formato) e esteganografia (esconder dados dentro de outros dados). Cada uma tem um caso de uso específico, e confundi-las é um erro comum no exame e um erro real de design.

## Instruções

### Parte 1 - Comparação de Técnicas

Produza uma comparação de 5 técnicas de proteção de dados: Criptografia, Hashing, Tokenização, Mascaramento de Dados e Esteganografia. Para cada uma:

- O que ela faz com o dado
- Se o dado original pode ser recuperado (e por quem)
- Um caso de uso concreto de saúde

### Parte 2 - Design de Tokenização da MedDefense

O departamento de faturamento da MedDefense precisa processar pagamentos mas não deveria armazenar números completos de cartão de crédito. Projete um esquema de tokenização:

- Qual dado é tokenizado (e qual formato o token assume)
- Onde o cofre (vault) de mapeamento token-para-dado-real é armazenado (e como esse cofre é protegido, incluindo criptografia e controles de acesso)
- O que acontece se o cofre de tokens for comprometido
- Como isso se compara a simplesmente criptografar os números de cartão de crédito (vantagens e desvantagens de tokenização vs. criptografia pra esse caso de uso)

### Parte 3 - Exemplos de Mascaramento de Dados

Produza 3 exemplos de dados mascarados da MedDefense mostrando o que diferentes papéis deveriam ver:

| Campo de Dado | Valor Completo | Enfermeiro(a) (clínico) | Atendente de Faturamento | Recepção |
|---|---|---|---|---|
| CPF/SSN | 987-65-4321 | ? | ? | ? |
| Nome do Paciente | Maria Gonzalez | ? | ? | ? |
| Diagnóstico | Diabetes Tipo 2 | ? | ? | ? |

Para cada célula, determine o nível de mascaramento apropriado e justifique em uma frase com base na necessidade de saber (need-to-know) do papel.

### Parte 4 - Esteganografia como Vetor de Ameaça

Em 4-5 frases, explique por que a esteganografia é uma preocupação séria pro programa de prevenção de perda de dados (DLP) da MedDefense. Considere: imagens médicas DICOM são arquivos binários grandes transferidos rotineiramente entre unidades. Como um funcionário mal-intencionado poderia embutir dados de pacientes exfiltrados dentro de arquivos de imagem legítimos? O que torna isso mais difícil de detectar do que a exfiltração de dados tradicional? Qual controle da sua estratégia do 1x03 ajudaria a detectar isso?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `7-obfuscation_toolkit.md`
