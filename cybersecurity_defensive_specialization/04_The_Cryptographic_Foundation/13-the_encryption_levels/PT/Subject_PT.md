# 13. Os Níveis de Criptografia

**Objetivo:** Comparar os seis níveis de criptografia definidos e recomendar o nível apropriado pra cada repositório de dados da MedDefense.

## Contexto

"Criptografar o banco de dados" parece simples, mas existem pelo menos três jeitos de fazer isso: criptografar o disco inteiro onde o banco fica (disco completo), criptografar os arquivos do banco (nível de arquivo), ou criptografar campos individuais dentro do banco (nível de registro). Cada um tem propriedades radicalmente diferentes: escopo de proteção, impacto de performance, complexidade de gerenciamento de chaves, e o que acontece quando alguém com acesso legítimo ao banco consulta os dados.

Escolher o nível errado ou deixa dados expostos, ou cria problemas operacionais que a equipe clínica não vai tolerar.

## Instruções

Produza uma tabela comparativa dos 6 níveis de criptografia do Sec+ 1.4:

| Nível | Escopo | Impacto de Performance | Gerenciamento de Chaves | Caso de Uso |
|---|---|---|---|---|
| Disco completo | Disco físico ou virtual inteiro | ? | ? | ? |
| Partição | Uma partição lógica | ? | ? | ? |
| Volume | Volume lógico (pode abranger vários discos) | ? | ? | ? |
| Arquivo | Arquivos individuais | ? | ? | ? |
| Banco de Dados | Banco de dados inteiro ou tablespace | ? | ? | ? |
| Registro | Campos ou registros individuais | ? | ? | ? |

Pra cada um: preencha todas as colunas e explique em uma frase quando esse nível é a melhor escolha.

Depois, produza um **Mapa de Níveis de Criptografia da MedDefense**: pra cada repositório de dados da MedDefense, recomende o nível de criptografia específico e justifique sua escolha:

- Prontuários de pacientes no PostgreSQL (`ehr-db-01`)
- Dados de backup no `NAS-01`
- Registros financeiros no MySQL (`billing-srv-01`)
- Imagens médicas no PACS (`pacs-srv-01`)
- Dados de e-mail no O365
- Laptops de funcionários
- Firmware/configuração das bombas BD Alaris

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `13-encryption_levels.md`
