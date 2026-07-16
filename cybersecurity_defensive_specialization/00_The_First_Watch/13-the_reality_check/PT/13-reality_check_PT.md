# Teste de Realidade — MedDefense Health Systems

## Violação 1: "Regional Hospital Alpha" — Ransomware via VPN

**Identificação do Vetor de Ataque:** A entrada inicial foi um appliance de VPN não corrigido, com uma CVE conhecida (patch disponível havia 4 meses). A partir daí, a rede plana permitiu que o atacante alcançasse o controlador de domínio em 3 horas, e uma conta de domain admin comprometida foi usada para distribuir ransomware a todo sistema Windows simultaneamente via Group Policy.

**Correlação com a MedDefense:**
- Rede plana com movimento lateral irrestrito → **GAP-004/GAP-007** (IoT médico/rede plana) e o achado M-01 subjacente — exatamente a mesma arquitetura.
- Zero monitoramento de rede, horas de permanência invisível → **GAP-002**.
- NAS de backup na mesma rede, criptografado junto com a produção, cópia viável mais recente com 5 semanas → **GAP-003**, quase idêntico à situação do `NAS-01`, incluindo o detalhe de "mesma rede que a produção".
- Nenhum plano de resposta a incidentes, resposta improvisada de 11 dias → parte da lacuna corretiva da **GAP-002**.
- Dispositivo de perímetro voltado à internet, não corrigido, como ponto de entrada → paralelo à **GAP-008** (Apache 2.4.29 não corrigido no `billing-srv-01`, já explorado duas vezes).

**Checagem de Ponto Cego:** Sim. A credencial de domain admin ser utilizável para distribuir ransomware pra organização inteira via GPO revela uma lacuna não documentada em lugar nenhum do Task 12: a MedDefense não tem um modelo de acesso em camadas/privilegiado pro AD — qualquer credencial de admin comprometida pode agir com autoridade total sobre o domínio. Adicionada como **GAP-017** abaixo.

## Violação 2: "Health Network Beta" — Insider + Abuso de Credenciais

**Identificação do Vetor de Ataque:** As credenciais de VPN e EHR de um funcionário demitido continuaram ativas por 47 dias porque o desligamento dependia inteiramente de um gestor lembrar de abrir um chamado. Sem MFA, a senha original sozinha já era suficiente; o acesso acontecia em horários incomuns, a partir de um IP novo, sem gerar nenhum alerta.

**Correlação com a MedDefense:**
- Sem MFA no acesso remoto/clínico → **GAP-014** (adicionada no Task 15 a partir do M-05 do Marcus) — essa violação é quase uma demonstração direta dessa exata lacuna causando um incidente real e notificável.
- Logs de auditoria existiam mas nunca foram revisados até depois do fato → **GAP-002**.
- Sem DLP na exportação de dados (3.211 registros baixados sem disparar nada) → sinalizado como válido-mas-não-documentado no Task 15, a partir da Seção 2 do Marcus.

**Checagem de Ponto Cego:** Sim. Nada na análise de lacunas trata da gestão do ciclo de vida de contas — se o acesso é desativado automaticamente quando alguém sai. A MedDefense nunca documentou um processo de desligamento entre RH e TI. Adicionada como **GAP-018** abaixo.

## Violação 3: "Community Hospital Gamma" — Pivô por Dispositivo Médico

**Identificação do Vetor de Ataque:** Um portal do paciente voltado à internet, não corrigido (patch disponível havia 2 meses), foi comprometido; uma má configuração da DMZ permitia conexões de saída de volta para a rede interna. A partir daí, os atacantes acharam dispositivos médicos IoT alcançáveis na mesma rede, descobriram que interfaces de gerenciamento de bombas de infusão ainda usavam **credenciais padrão de fábrica**, e acessaram nome de pacientes e dados de dosagem através delas. A detecção levou 23 dias e veio de um humano notando tráfego incomum, não de um sistema de monitoramento.

**Correlação com a MedDefense:**
- Mineração de criptomoeda implantada num servidor web voltado à internet, não corrigido → uma correspondência estrutural quase exata com o Task 2 (`billing-srv-01`, Apache 2.4.29, sem detecção por duas semanas).
- IoT médico alcançável pela rede geral, CVE de firmware com isolamento recomendado pelo fabricante nunca implementado → **GAP-004**, batendo detalhe por detalhe com a situação das bombas BD Alaris (CVE conhecida, boletim do fabricante, isolamento não feito).
- 23 dias de permanência, detectado por acaso em vez de por design → **GAP-002**.

**Checagem de Ponto Cego:** Sim, e esse é concreto e acionável. Nada na avaliação da MedDefense verificou se os monitores Philips ou as interfaces de gerenciamento das bombas BD Alaris ainda usam credenciais padrão de fábrica — essa violação mostra que é exatamente esse tipo de detalhe que transforma um comprometimento contido numa exposição de dados de paciente. Adicionada como **GAP-019** abaixo.

## Novas Lacunas Identificadas

**GAP-017 — Sem escalonamento de acesso privilegiado no Active Directory.** Qualquer credencial de nível administrativo comprometida pode empurrar mudanças (incluindo software malicioso) pra todo o domínio via Group Policy, sem nenhuma separação entre acesso rotineiro de sysadmin e autoridade real de domain admin. Categoria/Função ausente: Técnico Preventivo. Nível de Risco: **Crítico** — habilita diretamente o padrão de ransomware de evento único e organização inteira da Violação 1, contra `ad-dc-01`/`ad-dc-02`, a própria infraestrutura de identidade classificada Crítica da MedDefense.

**GAP-018 — Sem desprovisionamento automático de conta atrelado ao desligamento pelo RH.** O ciclo de vida da conta depende inteiramente de ação manual de um gestor, exatamente como na Violação 2. Categoria/Função ausente: Administrativo Preventivo. Nível de Risco: **Alto** — a MedDefense já tem a mesma cultura de credencial compartilhada/pouca responsabilização já anotada na GAP-010, tornando plausível um cenário parecido de conta adormecida.

**GAP-019 — Interfaces de gerenciamento de dispositivos médicos não verificadas contra credenciais padrão.** Nenhuma evidência em nenhuma task anterior confirma se as interfaces de gerenciamento dos monitores Philips ou bombas BD Alaris tiveram suas credenciais padrão de fábrica trocadas. Categoria/Função ausente: Técnico Preventivo. Nível de Risco: **Crítico** — a Violação 3 mostra que exatamente essa suposição não verificada é o que converteu um comprometimento contido de servidor web em exposição de dados de paciente através de dispositivos médicos.

## Reavaliação de Prioridade

**A GAP-014 (Sem MFA em lugar nenhum) é elevada de Alto para Crítico.** A Violação 2 é quase uma demonstração direta dessa lacuna única, sozinha, produzindo uma violação notificável completa, investigação do HHS e ação coletiva — a evidência do mundo real mostra que essa lacuna sozinha é suficiente para causar dano de nível Crítico, não apenas contribuir para ele.

**A GAP-003 (NAS-01 desprotegido) e a GAP-002 (sem detecção) são confirmadas em Crítico, sem mudança.** A Violação 1 se desenrola quase exatamente como a GAP-003 descreve (backup na mesma rede destruído junto com a produção, ponto de recuperação com semanas de atraso), e as três violações citam falha de detecção como um habilitador raiz — forte validação independente das classificações existentes, não informação nova que exija mudança.

**A GAP-010 (credenciais compartilhadas do PACS) é confirmada em Crítico, reforçando a discordância anterior com o Marcus (Task 15).** Tanto o caso de insider (Violação 2) quanto o caso de credencial padrão (Violação 3) mostram lacunas de responsabilização baseadas em credencial causando violações reais, independente de o acesso ser remoto ou local — sustentando a classificação Crítica sobre o Médio do Marcus.

## Análise de Padrão

As três violações, apesar de estilos de ataque muito diferentes (ransomware externo, abuso por insider, pivô por IoT), compartilham os mesmos quatro ingredientes: uma vulnerabilidade conhecida-mas-não-corrigida ou credencial padrão como ponto de entrada, uma rede plana que deixou o atacante ir a qualquer lugar uma vez lá dentro, uma ausência efetiva de monitoramento que deixou o comprometimento rodar por horas a semanas sem ser percebido, e uma fragilidade relacionada a credencial (sem MFA, sem desligamento, padrões nunca trocados) como causa primária ou secundária. Nenhum desses é exótico — são as mesmas quatro lacunas fundamentais que a MedDefense já carrega. Isso sugere fortemente que o orçamento limitado de segurança deveria priorizar essas correções estruturais "sem graça" (cadência de correção, segmentação, detecção, higiene de credenciais) em vez de qualquer solução pontual isolada, já que foi exatamente essa combinação, não uma técnica sofisticada ou inédita, que derrubou três organizações de saúde de resto muito diferentes entre si.
