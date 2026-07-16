# Avaliação de Criticidade de Ativos — MedDefense Health Systems

## Matriz de Criticidade de Ativos

| Categoria de Ativo | Confidencialidade | Integridade | Disponibilidade | Geral | Justificativa |
|---|---|---|---|---|---|
| Sistema EHR (A-001, A-002) | Crítico | Crítico | Crítico | **Crítico** | Guarda PHI de mais de 50.000 pacientes ativos; uma violação aciona notificação obrigatória ao HHS e litígio. Uma falha de integridade faz médicos agirem sobre dado clínico errado. Uma indisponibilidade já forçou uso de papel uma vez (Task 1, Incidente E). |
| PACS / Imagem Médica (A-003) | Alto | Crítico | Alto | **Crítico** | Imagens diagnósticas ligadas diretamente ao diagnóstico; uma imagem trocada ou alterada leva a uma decisão clínica errada. Não coberto pelo backup noturno, então uma indisponibilidade arrisca perda permanente, não só tempo fora do ar. |
| Infraestrutura de Faturamento (A-004) | Médio | Médio | Alto | **Alto** | Dado financeiro/de convênio, não de segurança de vida. Já causou uma paralisação real de 4 dias no processamento de reembolsos (Task 1, Incidente A) e hospedou um minerador não detectado por 2 semanas (Task 2). |
| Identidade e Diretório (A-005, A-006) | Alto | Crítico | Crítico | **Crítico** | Todo login Windows da organização depende do AD. Um DC comprometido dá ao atacante credenciais em todo o domínio; a indisponibilidade do DC trava o acesso da equipe a quase tudo, incluindo sistemas clínicos. |
| Arquivos, Impressão e Backup (A-007, A-008, A-009, A-010, A-024) | Alto | Médio | Crítico | **Crítico** | O NAS-01 espelha cópias de dados do EHR, faturamento e AD — sua confidencialidade reflete o que ele armazena. É o único backup, nunca testado em DR completo, e compartilha a sala de servidores com a produção (Task 5, G-003). |
| Aplicações Voltadas ao Paciente/Clínico (A-011, A-018, A-019) | Crítico | Alto | Médio | **Crítico** | O Portal do Paciente já vazou dado de um paciente para outro via IDOR (Task 1, Incidente B); o sistema de farmácia já sobrescreveu dado real de dosagem (Task 1, Incidente C). Ambas são falhas comprovadas, não hipotéticas. |
| Núcleo de Rede (A-020, A-021, A-022) | Alto | Crítico | Crítico | **Crítico** | A própria regra permissiva do firewall foi o caminho de saída do comprometimento do Task 2. Uma queda no núcleo derruba a conectividade do Central inteiro de uma vez — toda outra categoria depende desta. |
| IoT Médico (A-014, A-015, A-016, A-017) | Médio | Crítico | Crítico | **Crítico** | Falhas de integridade/disponibilidade aqui não são problemas de dado — são problemas de segurança do paciente (leitura errada de sinal vital, dosagem de infusão interrompida). As bombas BD Alaris carregam uma CVE conhecida e não mitigada. |
| Endpoints Clínicos e Administrativos (A-013) | Médio | Médio | Médio | **Médio** | O comprometimento de uma única estação tem impacto direto moderado, mas a rede plana (rastreada em Núcleo de Rede) transforma qualquer uma delas num ponto de pivô — esse risco de amplificação é rastreado separadamente. |
| Shadow IT / Ativos Não Documentados (A-012, A-023, A-025) | Alto | Médio | Baixo | **Alto** | Desconhecidos por definição — sem visibilidade sobre que dado tocam ou expõem. A indisponibilidade deles não paralisa operações oficiais, mas sua presença mina o escopo assumido de todo outro controle. |

## Os 5 Ativos Mais Críticos

**1. `ehr-db-01` (A-002).** Este é o alvo de maior valor de todo o ambiente: o banco de dados PostgreSQL de fato que guarda informação de saúde protegida de mais de 50.000 pacientes. Também está atualmente acessível por toda a faixa 10.10.0.0/16 em vez de restrito ao `ehr-srv-01`, o que significa que sua exposição é maior do que só a criticidade sugeriria.

**2. `ad-dc-01` (A-005).** Como controlador de domínio primário, este único servidor é a âncora de confiança de quase todo login da organização. Seu comprometimento não afeta só um sistema — entrega ao atacante as chaves para se mover lateralmente por qualquer coisa integrada ao domínio, e sua indisponibilidade tranca a equipe fora de quase tudo.

**3. `NAS-01` (A-010).** A única cópia de backup dos sistemas mais críticos da MedDefense vive aqui, na mesma rede e na mesma sala dos servidores que ela protege, sem réplica offsite e sem recuperação de desastres testada. Se a produção for perdida, isso é a única coisa entre a MedDefense e a perda permanente de dados — e nunca foi comprovado que funciona em escala real.

**4. FortiGate 100F (A-020).** O único ponto de perímetro e roteamento interno de todo o site Central. Sua má configuração já permitiu um comprometimento real (Task 2); sua falha ou comprometimento adicional não degrada um serviço só, pode derrubar ou expor a rede inteira de uma vez.

**5. Frota de Bombas de Infusão BD Alaris (A-016).** O ativo mais diretamente ligado à segurança do paciente nesta lista. Esses dispositivos controlam a dosagem de medicamentos de pacientes reais, rodam firmware com vulnerabilidade conhecida e sinalizada pelo fabricante, e estão sem isolamento na mesma rede plana que tudo mais — um comprometimento aqui não é uma violação de dados, é um potencial evento de dano clínico.
