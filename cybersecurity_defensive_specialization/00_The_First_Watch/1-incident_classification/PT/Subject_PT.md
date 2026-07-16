# 1. Os Primeiros Incidentes

**Objetivo:** Aprender a classificar eventos de segurança usando a Tríade CIA como framework de análise.

## Contexto

Ao ler as anotações do Marcus no pacote de integração, você encontra uma seção intitulada "Registro de Incidentes, Últimos 6 Meses." É uma lista bruta de eventos relevantes de segurança que ocorreram na MedDefense. Alguns foram tratados. Outros não. Nenhum foi formalmente classificado.

Antes de conseguir avaliar a postura de segurança, você precisa entender o que já deu errado. Mais importante ainda, você precisa de um framework para descrever *como* deu errado. Esse framework é a **Tríade CIA**:

- **Confidencialidade (Confidentiality):** Uma informação foi acessada por alguém que não deveria tê-la visto.
- **Integridade (Integrity):** Uma informação ou sistema foi modificado sem autorização.
- **Disponibilidade (Availability):** Um serviço, sistema ou dado ficou inacessível quando era necessário.

Todo incidente de segurança impacta pelo menos um desses pilares. Alguns impactam mais de um.

## O Registro de Incidentes

### Incidente A — 15 de janeiro

Um ransomware criptografou o servidor de faturamento (`billing-srv-01`) durante o fim de semana. A equipe financeira não conseguiu processar solicitações de reembolso junto aos convênios por 4 dias. O backup disponível tinha 3 semanas de atraso devido a um cron job mal configurado.

### Incidente B — 2 de fevereiro

Uma enfermeira na Westside Clinic relatou que um paciente perguntou sobre resultados de exames que ainda não haviam sido compartilhados com ele. A investigação revelou que o portal do paciente tinha um controle de acesso quebrado, que permitia a qualquer paciente autenticado visualizar os resultados de laboratório de outros pacientes apenas alterando um parâmetro na URL.

### Incidente C — 18 de março

O sistema de gestão da farmácia exibiu dosagens incorretas para um medicamento específico nas três unidades por aproximadamente 6 horas. Um script de atualização do banco de dados continha um bug que sobrescreveu os valores de dosagem. O erro foi identificado por um farmacêutico que percebeu que os números não batiam com a referência impressa.

### Incidente D — 5 de abril

O site público do MedDefense Central foi desfigurado (defacement). A página inicial foi substituída por uma mensagem política. O site não contém dados de pacientes. Foi restaurado a partir de um backup em 2 horas.

### Incidente E — 22 de maio

O sistema de prontuário eletrônico (EHR) sofreu uma indisponibilidade de 9 horas durante uma migração de banco de dados planejada. A migração demorou mais do que o esperado e o procedimento de rollback nunca havia sido testado. Os médicos recorreram a registros em papel durante a interrupção.

### Incidente F — 10 de junho

O notebook pessoal de um estagiário de TI, conectado ao WiFi corporativo, foi encontrado rodando um cliente de torrent que estava compartilhando arquivos. Os logs de rede mostraram que o notebook esteve na rede interna (não na rede de convidados) por 3 semanas. O notebook tinha acesso ao mesmo segmento de rede do compartilhamento de arquivos do RH.

## Instruções

Analise os 6 incidentes do registro do Marcus acima. Para cada um, identifique:

1. O pilar CIA primário impactado.
2. Uma justificativa de uma frase explicando o porquê.
3. Se um pilar secundário também for impactado, identifique-o e explique a conexão.

Produza uma tabela formatada de classificação de incidentes.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `1-incident_classification.md`
