# Passo a passo do exercício

## Passo 1 — Leia o pacote uma vez, sem anotar nada

Antes de organizar qualquer coisa, leia o `onboarding_packet.txt` inteiro do início ao fim só para ter uma visão geral. Não tente categorizar ainda — só entenda o "clima" da organização (você vai notar que é uma bagunça de propósito, isso é parte do exercício).

## Passo 2 — Releia com um marcador mental de 4 cores

Na segunda leitura, para cada frase pergunte: "isso é sobre organização, infraestrutura de TI, dados/serviços, ou é uma lacuna/contradição?" Eu recomendo até literalmente marcar/anotar cada trecho com uma letra (O, I, D, K) enquanto lê. Exemplo:

- *"350-bed acute care facility, downtown location"* → **O** (Organização)
- *"ehr-db-01 | PostgreSQL | EHR Database"* → **I** (Infraestrutura)
- *"HIPAA Security Rule compliance has never been formally assessed"* → **K** (Known Unknown — mas também toca em Data/Compliance)

Muitas frases vão servir para mais de uma seção — tudo bem, é normal.

## Passo 3 — Crie o esqueleto do arquivo primeiro

Antes de preencher, crie o arquivo `0-environment_summary.md` só com os títulos das 4 seções (isso evita que você "esqueça" de preencher alguma):

```markdown
# Structured Environment Summary — MedDefense Health Systems

## 1. Organization Overview

## 2. IT Infrastructure Identified

## 3. Data and Services

## 4. Known Unknowns
```

## Passo 4 — Preencha "Organization Overview"

Aqui você só precisa extrair e organizar, sem interpretar muito. Para cada site, puxe do Documento 1 (guia de RH): nome, tipo de local, função, headcount. Depois, do Documento 6 (organograma), monte a estrutura hierárquica.

Exemplo de como ficaria uma entrada:

```markdown
### MedDefense Central Hospital
- Tipo: hospital de cuidados agudos, localização urbana
- Função: 350 leitos, múltiplos departamentos clínicos
- Headcount aproximado: 1.400
```

Faça o mesmo para Westside Clinic e Corporate HQ. Depois resuma a hierarquia (CEO → CISO vago/James Chen → Sarah Park/IT, etc.) em bullets ou até reaproveitando o diagrama em texto.

## Passo 5 — Preencha "IT Infrastructure Identified"

Essa é a mais mecânica: vá linha por linha nos Documentos 2 e 5 (lista de ativos + diagrama de rede) e liste cada servidor, dispositivo de rede, endpoint e dispositivo médico. Formato sugerido — uma tabela ou lista por categoria:

```markdown
### Servidores — Central

| Nome       | SO/Plataforma    | Função        |
|------------|------------------|---------------|
| ehr-srv-01 | Ubuntu 20.04 LTS | Aplicação EHR |
| ...        | ...              | ...           |
```

Dica: não esqueça os itens "escondidos" nas anotações do Marcus, tipo o possível servidor extra na Westside, ou o MRI rodando Windows XP — isso conta como infraestrutura identificada, mesmo estando incerto (você pode marcar como "não confirmado").

## Passo 6 — Preencha "Data and Services"

Aqui você interpreta um pouco mais: com base na infraestrutura acima, pergunte "que tipo de dado passa por isso, e quem depende disso?" Exemplos de raciocínio:

- `ehr-db-01` guarda prontuários de pacientes → dado de saúde (PHI), usado por médicos/enfermagem
- `billing-srv-01` → dados financeiros/faturamento, usado pelo setor de cobrança
- Bombas de infusão / monitores → dados clínicos em tempo real, uso direto no cuidado ao paciente (e criticidade de vida)

## Passo 7 — Preencha "Known Unknowns"

Volte a tudo que você marcou com **K** no Passo 2. Essa seção é sobre honestidade, não sobre resolver os problemas. Alguns exemplos já presentes no texto:

- Não se sabe se há outro servidor no armário da Westside (nota do Marcus)
- Contagem de endpoints é de um relatório de 8 meses atrás, pode estar desatualizada
- Não está claro se o WiFi de convidados no Central está de fato isolado
- Não há avaliação formal de vulnerabilidade nem plano de resposta a incidentes documentado

## Passo 8 — Revise contra a regra de ouro

Releia o resultado e pergunte: "cada frase que escrevi está no pacote, ou eu inventei/assumi algo?" Se você assumiu algo (ex: "provavelmente há mais servidores não listados"), isso deveria estar na seção Known Unknowns, não afirmado como fato nas outras seções.

## Passo 9 — Salve no lugar certo

Segundo o enunciado, o arquivo final vai como `0-environment_summary.md` dentro de `blue_team/1x00_first_watch` no repositório `dlh-cyber_security`.
