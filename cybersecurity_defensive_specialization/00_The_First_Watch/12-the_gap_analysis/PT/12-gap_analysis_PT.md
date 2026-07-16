# Análise de Lacunas Priorizada — MedDefense Health Systems

*Nota de metodologia: "sem controle detectivo ou corretivo" nas regras Crítico/Alto abaixo é lida de forma estrita — as duas funções ausentes, não só uma. Quando um controle corretivo (ex: backup) existe mas o detectivo não, a lacuna é classificada como Alto, não Crítico.*

## Lacunas

### GAP-001
- **Título:** Banco de dados do EHR acessível por toda a rede interna, sem detecção de acesso anômalo
- **Ativo(s) Afetado(s):** `ehr-db-01` (Crítico, Task 8)
- **Dado em Risco:** Prontuários médicos (Restrito, Task 9)
- **Status Atual do Controle:** C-002 (acesso à subnet restrito a VPN), C-009 (backup noturno) se aplicam
- **O que Está Faltando:** Detectivo — nenhum monitoramento de quem consulta o banco além do servidor de aplicação esperado
- **Nível de Risco:** Alto
- **Justificativa do Risco:** Ativo crítico e dado Restrito, mas existe um controle corretivo (backup) — o que falta é detecção, não ausência total de cobertura.
- **Impacto Potencial:** Um atacante em qualquer lugar da rede plana poderia consultar ou exfiltrar prontuários diretamente, sem gerar nenhum alerta.

### GAP-002
- **Título:** Nenhuma capacidade funcional de detecção ou resposta a incidentes em todo o ambiente
- **Ativo(s) Afetado(s):** Núcleo de Rede, Identidade e Diretório, Sistema EHR (todos Críticos, Task 8)
- **Dado em Risco:** Todas as categorias Restritas e Confidenciais (Task 9) — os próprios logs são Confidenciais e desprotegidos
- **Status Atual do Controle:** C-005, C-013 produzem logs, mas nada os revisa ou alerta (Task 10)
- **O que Está Faltando:** Detectivo (funcional) e Corretivo (não existe plano de resposta a incidentes em nenhum lugar do projeto)
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Afeta ativos Críticos e dado Restrito; a detecção é nula na prática (logs que ninguém lê) e não há processo de resposta documentado — as duas funções genuinamente ausentes.
- **Impacto Potencial:** Repetição do Task 2 — um comprometimento roda por semanas sem detecção, descoberto só por acidente.

### GAP-003
- **Título:** O único repositório de backup não tem proteção ou redundância própria
- **Ativo(s) Afetado(s):** `NAS-01` (Crítico, Task 8)
- **Dado em Risco:** Espelha dado Restrito/Confidencial de todo sistema que faz backup nele (Task 9)
- **Status Atual do Controle:** C-002 restringe só o caminho de rede
- **O que Está Faltando:** Detectivo e Corretivo — nada monitora o NAS-01 contra adulteração, e nada faz backup dele
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Ativo crítico, nenhum controle detectivo ou corretivo protege o próprio controle.
- **Impacto Potencial:** Um único evento de ransomware com movimento lateral destrói a produção e a cópia de recuperação de última instância simultaneamente.

### GAP-004
- **Título:** Frota de bombas de infusão tem zero controles de segurança dedicados
- **Ativo(s) Afetado(s):** Frota de Bombas BD Alaris (Crítico, Task 8)
- **Dado em Risco:** Dados clínicos/sinais vitais e de dosagem em tempo real (Restrito, Task 9)
- **Status Atual do Controle:** Nenhum encontrado no mapa de cobertura do Task 10
- **O que Está Faltando:** Preventivo, Detectivo e Corretivo — ausência completa
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Ativo crítico de segurança do paciente, sem nenhuma cobertura de controle e com vulnerabilidade conhecida, sinalizada pelo fabricante e não mitigada.
- **Impacto Potencial:** Dano direto ao paciente através de manipulação de dosagem, sem nenhuma forma de detectar ou conter.

### GAP-005
- **Título:** Antivírus de endpoint exclui todos os servidores do ambiente
- **Ativo(s) Afetado(s):** `ehr-srv-01`, `billing-srv-01`, `ad-dc-01/02`, `file-srv-01` (Críticos, Task 8)
- **Dado em Risco:** Prontuários, dados financeiros, credenciais (Restrito/Confidencial, Task 9)
- **Status Atual do Controle:** Backup C-009 existe; C-005 cobre só o `ehr-srv-01`
- **O que Está Faltando:** Cobertura Preventiva/Detectiva em todo servidor, exceto log parcial em um só
- **Nível de Risco:** Alto
- **Justificativa do Risco:** Ativos críticos, mas um controle corretivo (backup) existe em toda a organização, então a cobertura é incompleta, não totalmente ausente.
- **Impacto Potencial:** Malware em qualquer servidor (como já aconteceu duas vezes) roda sem controle até causar um sintoma visível.

### GAP-006
- **Título:** Armário de rede sem fechadura, credenciais expostas, sem câmera e sem procedimento de violação
- **Ativo(s) Afetado(s):** Núcleo de Rede (Crítico, Task 8) — A-022
- **Dado em Risco:** Credenciais de sistema (Restrito, Task 9)
- **Status Atual do Controle:** Nenhum
- **O que Está Faltando:** Preventivo, Detectivo e Corretivo, todos ausentes
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Ativo crítico, ausência completa de controles detectivos e corretivos, trivial de explorar.
- **Impacto Potencial:** Qualquer pessoa pode ler as credenciais do switch na parede e reconfigurar ou interceptar o tráfego de um andar inteiro, sem ser detectada.

### GAP-007
- **Título:** Dispositivos médicos IoT compartilham uma rede plana sem isolamento
- **Ativo(s) Afetado(s):** Categoria IoT Médico — monitores, leitores de crachá, chamada de enfermagem (Crítico, Task 8)
- **Dado em Risco:** Dados clínicos em tempo real (Restrito, Task 9)
- **Status Atual do Controle:** Só firewall de perímetro
- **O que Está Faltando:** Preventivo (sem segmentação) e Detectivo (sem monitoramento específico por dispositivo)
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Categoria crítica de segurança do paciente, sem controle detectivo ou corretivo dedicado.
- **Impacto Potencial:** Uma estação comprometida alcança dispositivos médicos diretamente — o mesmo padrão sinalizado para o MRI no Task 6, mas em toda a frota de dispositivos.

### GAP-008
- **Título:** Servidor de faturamento tem cobertura fraca apesar de dois comprometimentos anteriores
- **Ativo(s) Afetado(s):** `billing-srv-01` (Alto, Task 8)
- **Dado em Risco:** Dados financeiros/faturamento (Confidencial, Task 9)
- **Status Atual do Controle:** C-002, C-009 se aplicam; sem antivírus, sem controle detectivo dedicado
- **O que Está Faltando:** Preventivo e Detectivo, ambos incompletos
- **Nível de Risco:** Alto
- **Justificativa do Risco:** Ativo classificado Alto, dado Confidencial, com cobertura incompleta (não ausente) — existe controle corretivo.
- **Impacto Potencial:** Um terceiro comprometimento, seguindo o mesmo padrão dos incidentes de ransomware e minerador.

### GAP-009
- **Título:** Compartilhamento de RH alcançável por dispositivos não gerenciados
- **Ativo(s) Afetado(s):** `file-srv-01`
- **Dado em Risco:** Registros de RH de funcionários (Confidencial, Task 9)
- **Status Atual do Controle:** Só permissões de arquivo padrão
- **O que Está Faltando:** Segmentação de rede para impedir alcance de dispositivos não gerenciados
- **Nível de Risco:** Alto
- **Justificativa do Risco:** Dado Confidencial com um incidente comprovado (não teórico) de cobertura incompleta — Task 1, Incidente F.
- **Impacto Potencial:** Um dispositivo não autorizado na rede alcança dados pessoais de funcionários sem nenhuma restrição.

### GAP-010
- **Título:** Login compartilhado do PACS elimina responsabilização individual pelo acesso a imagens
- **Ativo(s) Afetado(s):** `pacs-srv-01` (Crítico, Task 8)
- **Dado em Risco:** Dados de imagem médica (Restrito, Task 9)
- **Status Atual do Controle:** Nenhum — reportado à Sarah Park, sem resolução
- **O que Está Faltando:** Detectivo (sem como atribuir acesso) e Corretivo (problema conhecido e não resolvido)
- **Nível de Risco:** Crítico
- **Justificativa do Risco:** Ativo crítico, dado Restrito, sem controle detectivo ou corretivo apesar do problema ser formalmente conhecido.
- **Impacto Potencial:** Visualização não autorizada de imagens de paciente não pode ser rastreada a um indivíduo, prejudicando qualquer investigação.

### GAP-011
- **Título:** Três sistemas shadow IT confirmados ficam totalmente fora da governança
- **Ativo(s) Afetado(s):** A-012, A-023, A-025, A-026, A-027 (categoria Shadow IT, Alto, Task 8)
- **Dado em Risco:** Dados de pesquisa, alcance de rede próximo ao RH, escopo incerto (Task 9/11)
- **Status Atual do Controle:** Nenhum, por definição
- **O que Está Faltando:** Toda categoria de controle
- **Nível de Risco:** Alto
- **Justificativa do Risco:** Categoria classificada Alto com cobertura de controle totalmente ausente, embora o impacto individual de cada dispositivo seja limitado comparado aos sistemas clínicos centrais.
- **Impacto Potencial:** Qualquer um dos cinco vira um ponto de apoio não detectado ou um ponto de perda de dados, como detalhado no Task 11.

### GAP-012
- **Título:** A rede plana transforma qualquer endpoint num ponto de pivô em potencial
- **Ativo(s) Afetado(s):** Frota de Estações do Central (Médio, Task 8)
- **Dado em Risco:** Varia conforme o que cada estação acessa
- **Status Atual do Controle:** C-006, C-008, C-012 se aplicam e reduzem — mas não eliminam — o risco
- **O que Está Faltando:** Segmentação de rede para limitar o raio de impacto do comprometimento de um único endpoint
- **Nível de Risco:** Médio
- **Justificativa do Risco:** Ativo classificado Médio com controles parciais já reduzindo o risco, conforme a regra de Médio.
- **Impacto Potencial:** Uma única estação vítima de phishing vira uma plataforma de lançamento alcançando servidores e dispositivos médicos igualmente.

### GAP-013
- **Título:** Servidor de impressão além do fim de vida útil
- **Ativo(s) Afetado(s):** `print-srv-01`
- **Dado em Risco:** Mínimo — só trabalhos de impressão
- **Status Atual do Controle:** Exposição só à rede interna atua como fator compensatório parcial
- **O que Está Faltando:** Suporte/correções de SO
- **Nível de Risco:** Baixo
- **Justificativa do Risco:** Alvo de baixo valor com uma medida compensatória parcial (sem exposição externa), consistente com a própria avaliação M-08 do Marcus.
- **Impacto Potencial:** Limitado — um comprometimento aqui é mais uma questão de conformidade do que um risco de exploração ativa.

## Resumo de Distribuição de Lacunas

**Por nível de risco:** 6 Críticas (GAP-002, 003, 004, 006, 007, 010), 5 Altas (GAP-001, 005, 008, 009, 011), 1 Média (GAP-012), 1 Baixa (GAP-013) — 13 lacunas no total.

**Categorias de ativo com mais lacunas:** IoT Médico e Infraestrutura de Arquivos/Backup aparecem cada uma em 2-3 lacunas; Núcleo de Rede, EHR e PACS ancoram cada um pelo menos uma lacuna Crítica — confirmando que essas são as categorias que mais precisam de atenção.

**Concentração por função de controle:** Esmagadoramente **Detectivo e Corretivo**. Toda lacuna desta lista remonta a um controle Detectivo ou Corretivo ausente ou não funcional, nunca a uma ausência total de medidas Preventivas — isso confirma o padrão identificado desde o Task 5: a MedDefense superinveste em prevenção e tem quase nenhuma capacidade de perceber ou se recuperar quando a prevenção falha.
