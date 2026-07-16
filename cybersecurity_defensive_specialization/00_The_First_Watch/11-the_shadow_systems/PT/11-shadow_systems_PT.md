# Avaliação de Sistemas Sombra — MedDefense Health Systems

## Sistema 1: NAS Pessoal do Dr. Patel (Cardiologia)

### Avaliação de Risco
1. **Dado sensível:** Dados de pesquisa clínica/cardiologia, que podem incluir informação de paciente reidentificável dependendo do desenho do estudo.
2. **Controles que não cobrem:** Nenhum dos 16 controles da matriz do Task 10 se aplica — nunca foi inventariado, então não tem backup, antivírus, log de acesso, e fica fora das regras do firewall que dependem de ativos conhecidos.
3. **Pior cenário:** Um NAS de nível consumidor falha ou é comprometido, e dados de pesquisa — potencialmente com identificadores de paciente — são perdidos ou expostos sem nenhuma trilha de auditoria e sem como saber o que havia ali.

### Resposta Recomendada: **Legitimar e Proteger**
O Dr. Patel comprou isso porque o drive compartilhado estava "lento demais" — essa é uma necessidade real e não atendida, não frívola. Descontinuar sem alternativa só empurra o mesmo comportamento pra um lugar menos visível. Traga o dispositivo para a governança de TI: inventarie, aplique controles de backup e acesso, e avalie se a reclamação de performance original precisa ser resolvida na infraestrutura de arquivos oficial.

## Sistema 2: Google Drive Compartilhado do Marketing (Gmail Pessoal)

### Avaliação de Risco
1. **Dado sensível:** Arquivos de mídia e comunicados de imprensa — geralmente classificação mais baixa (Público/Interno), mas comunicados ainda não publicados podem ser comercialmente sensíveis antes da divulgação.
2. **Controles que não cobrem:** Todos eles — esse dado vive inteiramente fora da rede da MedDefense, então nenhuma regra de firewall, job de backup ou controle de endpoint tem qualquer alcance sobre ele.
3. **Pior cenário:** O funcionário dono da conta Gmail pessoal sai da organização, e a MedDefense perde acesso (ou controle) sobre os próprios materiais de marketing e histórico de comunicação, sem nenhum processo de transição.

### Resposta Recomendada: **Migrar**
A MedDefense já paga pelo O365 E3 (Task 0), que inclui SharePoint/OneDrive — uma alternativa funcionalmente equivalente, já licenciada, já sob controle. Este é o caso mais claro dos três de "por que estamos pagando por shadow IT quando já somos donos da versão oficial".

## Sistema 3: Raspberry Pi ("Monitor de Rede," 2º andar do Central)

### Avaliação de Risco
1. **Dado sensível:** Não está claro por natureza — foi configurado como uma ferramenta de monitoramento de rede, o que tipicamente implica visibilidade ampla do tráfego de rede, não armazenamento de um conjunto específico de dados.
2. **Controles que não cobrem:** Todos eles — ninguém mexeu nele desde que o Marcus e o estagiário saíram, então ele não recebeu correções, não foi revisado, e não está no inventário de ninguém.

   *Cruzamento de fontes:* essa descrição bate quase exatamente com o `UNKNOWN-01` (A-012) da varredura de rede do Task 7 — um host Linux com SSH e dois serviços web, na subnet de servidores do Central, que a Sarah não conseguiu identificar mas suspeitava ser "do Marcus ou do estagiário". É bem provável que seja o mesmo dispositivo, não um quarto ainda não descoberto.
3. **Pior cenário:** Um dispositivo esquecido com visibilidade ampla de rede, sem correções há meses, vira um ponto de apoio para movimento lateral — exatamente o tipo de ponto de pivô negligenciado que transformou um único host comprometido num problema de rede inteira no Task 2.

### Resposta Recomendada: **Descontinuar** (pendente confirmação)
Diferente dos outros dois, ninguém depende atualmente desse dispositivo pra nada — seu propósito original (um projeto de estagiário) terminou quando o dono saiu. Antes de remover, confirme que ele não está silenciosamente desempenhando uma função da qual alguém hoje depende (conforme as notas de reconciliação do Task 7), mas o caminho padrão deveria ser remoção, não legitimação, já que não há dono de negócio atual para protegê-lo formalmente.

## Atualização do Registro de Ativos (Task 7)

| Asset ID | Nome | Tipo | Localização | Dono (Depto) | SO/Plataforma | Serviços Críticos | Segmento de Rede | Status | Notas |
|---|---|---|---|---|---|---|---|---|---|
| A-026 | NAS Pessoal do Dr. Patel | Repositório de Dados | Central, escritório da Cardiologia | Cardiologia (não oficial) | Desconhecido (NAS consumidor) | Armazenamento de dados de pesquisa | 10.10.1.0/24 (tomada do escritório) | Shadow IT | Comprado para contornar drive compartilhado lento; recomendado Legitimar e Proteger |
| A-027 | Drive Compartilhado do Marketing | Aplicação | Nuvem (vinculado a Gmail pessoal) | Marketing (não oficial) | Google Drive (SaaS) | Armazenamento de mídia/imprensa | N/A (nuvem externa) | Shadow IT | Vinculado a uma conta pessoal; recomendado Migrar para O365/SharePoint |
| A-012 *(atualização)* | UNKNOWN-01 / Raspberry Pi "Monitor de Rede" | Servidor | Central, 2º andar / subnet de servidores (10.10.2.99) | Nenhum (antigo projeto de estagiário) | Linux 4.x | Não claro — provavelmente monitoramento de rede | 10.10.2.0/24 | Shadow IT | Provavelmente o Raspberry Pi que o Mike Torres descreveu; sem manutenção desde que o Marcus e o estagiário saíram; recomendado Descontinuar pendente confirmação |

## Recomendação de Política de Shadow IT

A mudança de política única mais efetiva seria estabelecer um **processo de entrada de TI rápido e de baixo atrito** para novas ferramentas e dispositivos — os três casos aqui existem porque alguém tinha uma necessidade real e não atendida (um drive compartilhado lento, a necessidade de compartilhar mídia externamente, o desejo de monitorar a rede) e nenhum caminho oficial fácil pra resolver isso rapidamente. Um processo de solicitação leve, com um prazo de resposta comprometido (ex: 48 horas), removeria o incentivo de resolver problemas silenciosamente fora da visibilidade da TI — o que é uma correção mais duradoura do que qualquer quantidade de detecção posterior.
