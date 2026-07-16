# 8. Os Vetores Técnicos

**Objetivo:** Identificar e analisar os vetores de ataque técnicos (não-humanos) específicos da MedDefense usando evidência concreta da varredura de rede e da avaliação de postura.

## Contexto

Engenharia social te faz entrar pela porta. Vetores técnicos te fazem permanecer dentro do prédio. A varredura de rede do Projeto 1x00 revelou um cenário de serviços expostos, software desatualizado e controles ausentes que formam um catálogo de pontos de entrada técnicos e oportunidades de movimento lateral.

O framework Security+ (2.2) define vetores técnicos como: software vulnerável, sistemas sem suporte, redes inseguras (wireless, cabeada, Bluetooth), portas de serviço abertas, credenciais padrão e dispositivos removíveis. Cada um desses existe no ambiente da MedDefense.

## Instruções

Usando o Resumo de Varredura de Rede e seus artefatos de avaliação de postura do Projeto 1x00, produza uma Avaliação de Vetores Técnicos cobrindo 6 categorias de vetor. Para cada uma:

```
Categoria do Vetor: [Termo do Sec+ 2.2]
Evidência na MedDefense: [Sistema, porta, configuração ou gap específico que cria esse vetor. Referencie dados da varredura de rede ou achados do 1x00.]
Ativo(s) Afetado(s): [Quais sistemas ficam expostos por esse vetor?]
Ator Mais Provável de Explorar: [Referencie a Matriz de Atores de Ameaça do T6]
Cenário de Exploração: [Em 2-3 frases, como um atacante usaria esse vetor contra a MedDefense?]
Proteção Atual: [Qual controle do 1x00 endereça isso parcialmente, se algum?]
Referência de Gap: [Qual gap do 1x00 habilita esse vetor?]
```

### As 6 Categorias a Cobrir

1. **Software Vulnerável:** Apache 2.4.29 no `billing-srv-01`, Ubuntu 18.04 LTS fora de suporte, qualquer outro software desatualizado identificado
2. **Sistemas Sem Suporte:** Windows XP na estação de MRI, Windows Server 2012 R2 no `print-srv-01`
3. **Portas de Serviço Abertas:** MySQL 3306 e PostgreSQL 5432 acessíveis por toda a rede, RDP em estações selecionadas, interfaces web de IoT médico
4. **Credenciais Padrão:** Conta compartilhada do PACS, interfaces das bombas BD Alaris, qualquer outra credencial padrão ou compartilhada identificada
5. **Redes Inseguras:** Rede plana (sem segmentação), roteador consumidor da Westside, isolamento de WiFi incerto
6. **Dispositivos Removíveis / Endpoints Não-Gerenciados:** Nenhuma GPO de restrição de USB, iPads não-gerenciados, dispositivos de shadow IT

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `8-technical_vectors.md`
