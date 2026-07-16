# 9. A Matriz de Vetor-para-Ativo

**Objetivo:** Produzir um cruzamento sistemático mostrando quais vetores de ataque conseguem alcançar quais ativos críticos, criando um mapa completo de exposição a ameaça.

## Contexto

Vetores isolados são pontos de dado. Vetores cruzados são inteligência. Um e-mail de phishing sozinho é um incômodo. Um e-mail de phishing que entrega credenciais pra rede plana que alcança o banco de dados do EHR contendo 50.000 registros de paciente — isso é uma kill chain esperando pra acontecer.

## Instruções

Produza uma Matriz de Vetor-para-Ativo cruzando vetores de ataque (linhas) com ativos críticos (colunas).

**Colunas (Ativos):** Use seus Top 5 Ativos Críticos da Tarefa 8 do 1x00, mais IoT Médico e Active Directory (7 colunas no total).

**Linhas (Vetores):** Use no mínimo estes 8 vetores:

1. Phishing / Spear Phishing
2. Exploração de VPN
3. Credenciais Padrão/Compartilhadas
4. Exploração de Software Vulnerável
5. Comprometimento de Cadeia de Suprimentos
6. Insider (Malicioso)
7. Insider (Negligente)
8. Acesso Físico

Para cada célula onde existir um caminho viável, escreva um caminho de ataque de uma frase descrevendo como aquele vetor alcança aquele ativo. Exemplo: *"Phishing → credenciais de clínico → rede plana → PostgreSQL 5432 aberto → dados de paciente do ehr-db-01."*

Deixe células vazias onde não existir caminho direto ou indireto viável. Você deve preencher no mínimo 20 células.

Depois da matriz, identifique os **3 ativos mais conectados** (ativos alcançáveis pelo maior número de vetores) e os **3 vetores mais versáteis** (vetores que alcançam o maior número de ativos). Explique em uma frase cada por que essas representam as intersecções de maior prioridade pra MedDefense.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `9-vector_asset_matrix.md`
