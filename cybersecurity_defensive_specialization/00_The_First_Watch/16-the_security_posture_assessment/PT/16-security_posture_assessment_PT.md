# MedDefense Health Systems — Avaliação de Postura de Segurança

## 1. Sumário Executivo

A postura de segurança da MedDefense hoje é **só preventiva e efetivamente cega**: a organização tem controles razoáveis impedindo que alguns ataques comecem, mas quase nenhuma capacidade de perceber um que tenha sucesso, e quase nenhuma forma testada de se recuperar depois que isso acontece. Isso não é teórico — dois sistemas diferentes já foram comprometidos duas vezes cada um no último ano, ambos descobertos por acidente, não por nenhuma ferramenta de segurança.

**O achado mais crítico, único:** não existe nenhuma capacidade funcional de detecção em lugar nenhum do ambiente. Os logs existem, mas ninguém os revisa, e não há nenhum tipo de alerta. Uma infecção de mineração de criptomoeda rodou sem detecção no nosso servidor de faturamento por pelo menos duas semanas — o mesmo ponto cego que, em três violações reais de hospitais que revisamos, permitiu que atacantes operassem de horas a mais de três semanas antes de alguém perceber.

**As 3 principais ações recomendadas:**
1. Implantar detecção e monitoramento básicos (uma ferramenta SIEM moderna), começando pelos nossos sistemas mais críticos — aproximadamente $30.000.
2. Tirar nossa única cópia de backup da mesma rede dos servidores que ela protege, e adicionar replicação em nuvem offsite — aproximadamente $14.400/ano, já cotado e anteriormente negado só por questão de custo.
3. Isolar nossos dispositivos médicos de maior risco (bombas de infusão) num segmento de rede protegido próprio — aproximadamente $30.000.

**Implicação de orçamento:** Essas e outras quatro correções prioritárias cabem dentro de **$80.400 do nosso orçamento anual de $120.000** de segurança, deixando capacidade de reserva para o próximo nível de melhorias.

## 2. Escopo e Metodologia

**O que foi avaliado:** Os três sites da MedDefense (Hospital Central, Westside Clinic, Corporate HQ), cobrindo servidores, endpoints, infraestrutura de rede, dispositivos médicos IoT, aplicações, e os dados que eles guardam.

**Fontes usadas:** O pacote de documentação de integração; seis meses de histórico de incidentes; uma volta física pelas instalações do Central; artefatos de configuração do firewall, servidores e endpoints; uma varredura de rede interna completa; três relatórios reais de violações no setor de saúde usados para validar nossos achados; e uma avaliação parcialmente concluída deixada pelo analista de segurança anterior.

**Limitações e suposições:** Os endpoints individuais da Corporate HQ estão cobertos pela varredura de rede, mas não foram detalhados no registro de ativos com a mesma profundidade que o Central. Alguns achados (ex: se as interfaces de gerenciamento de dispositivos médicos ainda usam credenciais padrão) estão sinalizados como precisando de verificação direta, não como fato confirmado. Todos os valores financeiros são estimativas de ordem de grandeza, não cotações de fornecedor, exceto onde uma cotação específica é citada.

## 3. Panorama de Ativos

**Resumo do inventário:** 27 ativos distintos documentados em 7 categorias: 13 servidores, 4 grupos de dispositivos médicos IoT (~200 dispositivos individuais), 3 aplicações, 2 dispositivos de rede, 2 repositórios de dados, 2 grupos de endpoints (~450+ dispositivos individuais), e 1 zona de infraestrutura física. Três desses 27 são **Shadow IT** confirmado — sistemas operando sem nenhuma supervisão oficial.

**Os 5 Ativos Mais Críticos:**
1. **`ehr-db-01`** — o banco de dados que guarda informação de saúde protegida de mais de 50.000 pacientes.
2. **`ad-dc-01`** — o controlador de domínio que ancora quase todo login da organização.
3. **`NAS-01`** — a única cópia de backup de todo sistema crítico, sem cópia offsite.
4. **FortiGate 100F** — o único dispositivo de perímetro de todo o site Central.
5. **Frota de bombas de infusão BD Alaris** — dispositivos que controlam diretamente a dosagem de medicamentos de pacientes, com uma vulnerabilidade conhecida e não mitigada.

**Resumo de classificação de dados:** Das 8 principais categorias de dado identificadas, 5 são classificadas como **Restrito** (prontuários, imagem médica, dados clínicos em tempo real, credenciais de sistema, dados de pesquisa) e 3 como **Confidencial** (dados financeiros, registros de RH, logs de auditoria). A fragilidade de proteção mais significativa está no nível Restrito: credenciais de sistema, incluindo uma senha de switch de rede fisicamente colada numa parede.

## 4. Controles de Segurança Atuais

**Inventário de controles:** 16 controles documentados — 10 Técnicos, 3 Administrativos, 3 Físicos. Por função: 10 Preventivos, 3 Detectivos, 1 Corretivo, 2 Compensatórios (ambos ainda propostos, não implementados), 0 Dissuasórios.

**Avaliação de maturidade:** A MedDefense é **moderadamente madura em prevenção** (regras de firewall, política de senha, antivírus, bloqueio de acesso) e **criticamente imatura em tudo mais**. A detecção existe no papel mas não na prática. Só existe um controle corretivo (backup noturno), e ele nunca foi testado em escala completa. Nenhuma categoria de controle tem qualquer função dissuasória.

**Principais achados de efetividade:** Dos 16 controles, só 3 são classificados totalmente como "Forte". O antivírus exclui todo servidor do ambiente. O serviço de guarda cobre uma entrada, um turno, em um site. A cobertura de câmeras exclui inteiramente a sala de servidores, o armário de rede e a ala administrativa.

## 5. Análise de Lacunas

19 lacunas foram identificadas e validadas, incluindo 3 confirmadas contra padrões reais de violação em outros hospitais. **Distribuição: 9 Críticas, 8 Altas, 1 Média, 1 Baixa.**

| Lacuna | Nível | Descrição | Ativos Afetados | Impacto Potencial | Tratamento Recomendado |
|---|---|---|---|---|---|
| GAP-002 | Crítica | Sem detecção ou resposta a incidentes funcional | Rede inteira | Repetição do minerador de 2 semanas sem detecção | Mitigar: implantar SIEM + plano de RI |
| GAP-003 | Crítica | Único backup compartilha rede/sala com a produção | `NAS-01` | Perda simultânea de produção e dado de recuperação | Mitigar: replicação de backup em nuvem |
| GAP-004 | Crítica | Bombas de infusão com zero controles | Frota BD Alaris | Dano direto ao paciente via manipulação de dosagem | Mitigar: VLAN dedicada |
| GAP-006 | Crítica | Armário de rede destrancado, credenciais expostas | Núcleo de Rede | Comprometimento total da rede, sem detecção | Mitigar: fechadura + rotação de credencial |
| GAP-007 | Crítica | Rede plana em toda a frota de IoT médico | Todo IoT médico | Igual ao GAP-004, escopo mais amplo | Mitigar: implantação de VLAN em fases |
| GAP-010 | Crítica | Login compartilhado do PACS, sem responsabilização | `pacs-srv-01` | Acesso não autorizado a imagens, sem rastreio | Mitigar: autenticação por crachá |
| GAP-014 | Crítica | Sem MFA em lugar nenhum (elevado após o Task 13) | Toda a organização | Padrão comprovado: já causou uma violação real por insider em outro lugar | Mitigar: MFA via licenciamento O365 existente |
| GAP-017 | Crítica | Sem escalonamento de acesso privilegiado no AD | `ad-dc-01/02` | Uma conta admin comprometida = ransomware em todo o domínio | Mitigar: modelo de admin em camadas |
| GAP-019 | Crítica | Credenciais padrão de dispositivo médico não verificadas | IoT médico | Padrão comprovado: converteu uma violação em exposição de dados de paciente | Mitigar: auditar e trocar credenciais |
| GAP-001, 005, 008, 009, 011, 015, 016, 018 | Alta | Cobertura incompleta em acesso ao EHR, antivírus, faturamento, compartilhamento de RH, shadow IT, site da Westside, gestão de mudanças, desligamento | Múltiplos | Varia — ver Tasks 12/13/15 para detalhes | Majoritariamente Mitigar; ver Task 14 |

**Análise de distribuição de lacunas:** As lacunas se concentram esmagadoramente em funções **Detectivas e Corretivas**, não Preventivas — a MedDefense nunca careceu de vontade de bloquear ameaças conhecidas, ela carece da capacidade de perceber ou se recuperar das que passam mesmo assim.

## 6. Recomendações de Tratamento de Risco

As 7 recomendações prioritárias (detalhe completo no Task 14):

| Prioridade | Lacuna | Estratégia | Custo | Cronograma |
|---|---|---|---|---|
| 1 | GAP-006 (fechadura/credenciais do armário) | Mitigar | $0-1K | Vitória Rápida (<1 sem) |
| 2 | GAP-001 (regra de firewall do BD do EHR) | Mitigar | $0-1K | Vitória Rápida (<1 sem) |
| 3 | GAP-010 (autenticação por crachá no PACS) | Mitigar | $1-10K | Curto Prazo (<1 mês) |
| 4 | GAP-003 (backup em nuvem) | Mitigar | ~$14.400/ano | Curto Prazo (<1 mês) |
| 5 | GAP-002 (SIEM + plano de RI, Fase 1) | Mitigar | $10-50K | Curto Prazo (<1 mês) |
| 6 | GAP-004 (VLAN de bombas, Fase 1) | Mitigar | $10-50K | Longo Prazo (>1 mês) |
| 7 | GAP-007 (restante da VLAN de IoT) | Mitigar | $10-50K | **Adiado pro próximo ano fiscal** |

**Alocação de orçamento:** ~$80.400 dos $120.000 comprometidos este ano fiscal; ~$39.600 reservados, recomendado para o GAP-005 (cobertura de antivírus em servidores) como o próximo item de maior valor.

- **Vitórias rápidas (<1 semana):** GAP-006, GAP-001 — ambas de custo quase zero, deveriam começar imediatamente independente do tempo de aprovação do orçamento.
- **Curto prazo (<1 mês):** GAP-010, GAP-003, GAP-002 Fase 1.
- **Roadmap de longo prazo:** GAP-004 este ano; GAP-007 Fase 2, GAP-017 (escalonamento de acesso no AD), e GAP-019 (auditoria de credencial de dispositivo) propostos para o próximo ano fiscal.

## 7. Conclusão e Próximos Passos

Em termos de negócio: a MedDefense atualmente gasta seu esforço de segurança quase inteiramente em trancar portas, com muito pouco gasto em perceber quando uma porta foi forçada ou em se recuperar depois. Três violações reais de hospitais revisadas nesta avaliação foram causadas por exatamente essa combinação — não ataques sofisticados, mas lacunas comuns como essas, deixadas sem resposta. Se essas recomendações não forem implementadas, o resultado mais provável não é um risco futuro hipotético, mas uma repetição do que já aconteceu duas vezes no nosso próprio servidor de faturamento, numa escala que poderia afetar operações clínicas diretamente, como já aconteceu uma vez (Task 1, Incidente E).

Esta avaliação responde à pergunta interna — o que temos, e onde estão as lacunas. Ela ainda não responde à pergunta externa que o analista anterior, Marcus Webb, havia começado mas nunca terminado: **quem está de fato mirando organizações como a MedDefense, e como.** A próxima fase deste programa deveria ser uma Avaliação formal de Panorama de Ameaças Externas, mapeando nossas lacunas já documentadas contra técnicas reais de atacantes (como o Marcus começou a esboçar usando o MITRE ATT&CK e os avisos de saúde da CISA) — transformando "aqui está o que está errado" em "aqui está quem exploraria isso, e como saberíamos."
