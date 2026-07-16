# Análise de Lacunas de Controle — MedDefense Health Systems

## Lacunas

### G-001
- **Descrição da Lacuna:** Não existe nenhum controle Compensatório em toda a categoria Técnica — sistemas que não podem ser totalmente protegidos por controles preventivos/detectivos padrão não têm nenhuma proteção alternativa documentada.
- **Categoria x Função Ausente:** Técnico Compensatório
- **Ativo(s) ou Zona Afetada:** Qualquer sistema legado ou que não possa ser corrigido (patched)
- **Risco se Não Corrigido:** Integridade e Disponibilidade — um sistema que não pode ser protegido normalmente e não tem proteção alternativa é um caminho aberto para um atacante explorar uma fraqueza conhecida.
- **Evidência:** Matriz Resumo de Controles do Task 4 — a coluna inteira de Técnico/Compensatório está vazia.

### G-002
- **Descrição da Lacuna:** Logs detectivos existem (tráfego do firewall, logs de autenticação SSH), mas nada revisa ou alerta ativamente sobre eles; os logs só são checados manualmente "quando algo quebra."
- **Categoria x Função Ausente:** Técnico Detectivo (o registro existe, o alerta não)
- **Ativo(s) ou Zona Afetada:** Toda a rede — firewall, servidores Windows, Active Directory
- **Risco se Não Corrigido:** Confidencialidade e Integridade — um atacante pode operar sem ser detectado por muito tempo, já que a descoberta depende de alguém perceber um sintoma visível, não de um alerta automático (foi exatamente o que aconteceu com o minerador de criptomoeda no Task 2).
- **Evidência:** Artefato 8 — "No automated alerting on security events"; "We check manually if something breaks."

### G-003
- **Descrição da Lacuna:** Existe um backup noturno, mas um teste completo de recuperação de desastres nunca foi realizado; o único teste parcial levou 6 horas para restaurar um único servidor.
- **Categoria x Função Ausente:** Técnico Corretivo (o controle existe, mas não foi validado)
- **Ativo(s) ou Zona Afetada:** `ehr-srv-01`, `ehr-db-01`, `billing-srv-01`, `ad-dc-01`, `file-srv-01`, `web-srv-01`
- **Risco se Não Corrigido:** Disponibilidade — num desastre real, não há garantia de que o processo de restauração funciona em escala ou dentro de um tempo aceitável, então as operações clínicas poderiam ficar fora do ar por muito mais tempo do que o esperado.
- **Evidência:** Artefato 5 — "Full DR test: Never performed"; James Chen: "temos um processo de backup, mas nenhum procedimento de recuperação testado."

### G-004
- **Descrição da Lacuna:** O antivírus (Sophos) só cobre estações Windows; servidores Windows e todos os servidores Linux estão explicitamente excluídos da cobertura.
- **Categoria x Função Ausente:** Técnico Preventivo (cobertura parcial — servidores críticos excluídos)
- **Ativo(s) ou Zona Afetada:** `ehr-srv-01`, `ehr-db-01`, `billing-srv-01`, `ad-dc-01`, `ad-dc-02`, `file-srv-01`, `web-srv-01`, `backup-srv-01`
- **Risco se Não Corrigido:** Confidencialidade, Integridade e Disponibilidade — os servidores que guardam os dados mais sensíveis não têm nenhuma defesa ativa contra malware, exatamente como o minerador de criptomoeda passou despercebido no `billing-srv-01` no Task 2.
- **Evidência:** Artefato 4 — "Windows servers: 15 (NOT covered)... Linux servers: 0 (NOT covered)."

### G-005
- **Descrição da Lacuna:** Todo controle Administrativo identificado é Preventivo (política de senha, treinamento); não existe processo documentado para detectar violações de política, nenhum plano formal de resposta a incidentes, e nenhuma política disciplinar/dissuasória registrada.
- **Categoria x Função Ausente:** Administrativo Detectivo, Corretivo, Compensatório e Dissuasório (os quatro)
- **Ativo(s) ou Zona Afetada:** A organização inteira (camada de pessoas e processos)
- **Risco se Não Corrigido:** Integridade e Disponibilidade — quando um incidente acontece, não existe processo documentado a seguir, então a resposta é improvisada em vez de estruturada, prolongando a indisponibilidade e aumentando a chance de erros.
- **Evidência:** Matriz do Task 4 — a linha Administrativo só está preenchida na coluna Preventivo.

### G-006
- **Descrição da Lacuna:** As câmeras cobrem só as entradas do prédio e a garagem; não há cobertura do corredor da sala de servidores, dos armários de rede, ou da ala administrativa, e não existe procedimento corretivo documentado depois que uma invasão física é descoberta.
- **Categoria x Função Ausente:** Físico Detectivo (cobertura incompleta) e Físico Corretivo (totalmente ausente)
- **Ativo(s) ou Zona Afetada:** Sala de servidores, armário de rede, ala administrativa (Central)
- **Risco se Não Corrigido:** Confidencialidade e Integridade — invasões físicas nessas zonas (ver Task 3, Observações 1, 2 e 5) passariam completamente despercebidas e sem resposta.
- **Evidência:** Artefato 6 — "No cameras in server room area, network closets or administrative wing"; observações da volta pelas instalações no Task 3.

## Análise de Padrão

A postura da MedDefense é fortemente orientada à prevenção: quase todo controle identificado no Task 4 bloqueia algo antes de acontecer, enquanto a cobertura detectiva é fraca e não monitorada, e os controles corretivos, compensatórios e dissuasórios estão quase totalmente ausentes. Isso significa que, assim que um atacante consegue passar por um controle preventivo — o que já aconteceu duas vezes no `billing-srv-01` — a MedDefense tem pouquíssima capacidade de perceber, conter ou se recuperar rapidamente; os incidentes são descobertos por acaso, não por design, e a resposta é improvisada em vez de seguir um plano testado.
