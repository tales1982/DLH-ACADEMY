# Decisões de Tratamento de Risco — MedDefense Health Systems

*Selecionadas: as 6 lacunas Críticas do Task 12, mais a lacuna Alta mais bem colocada (GAP-001), como os 7 itens de maior prioridade.*

## GAP-002 — Nenhuma capacidade funcional de detecção ou resposta a incidentes

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar
**Justificativa:** Esta é a lacuna mais sistêmica de todas — é o motivo pelo qual todo incidente anterior (ransomware, minerador) passou semanas sem ser detectado. Nenhuma outra estratégia resolve uma lacuna de capacidade tão fundamental; não dá pra transferir, aceitar ou evitar isso.

- **Controle(s) Proposto(s):** Implantar o Wazuh (SIEM open-source, conforme a própria recomendação M-04 do Marcus) cobrindo primeiro os servidores críticos e o firewall; redigir um Plano formal de Resposta a Incidentes (Administrativo/Corretivo).
- **Custo Estimado:** $10-50K (intensivo em mão de obra/consultoria; o software em si é gratuito)
- **Esforço de Implementação:** Curto Prazo (<1 mês para a Fase 1: servidores críticos + firewall)
- **Redução de Risco Esperada:** Alta — transforma "descoberto por acidente" em "descoberto por design" na maioria das outras lacunas desta lista.

**Trade-offs:** Exige que alguém de fato monitore e responda aos alertas depois de implantado — uma ferramenta sem processo é só mais log que ninguém lê.

---

## GAP-003 — Repositório de backup (NAS-01) sem proteção ou redundância

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar
**Justificativa:** Já existe uma cotação pronta ($14.400/ano para replicação em nuvem), negada anteriormente só por questão de orçamento. É a correção mais barata, por dólar de risco reduzido, de toda a lista.

- **Controle(s) Proposto(s):** Replicação de backup em nuvem com armazenamento imutável (AWS S3 ou Azure Blob) — Técnico/Corretivo.
- **Custo Estimado:** $10-50K (custo anual recorrente de ~$14.400)
- **Esforço de Implementação:** Curto Prazo (<1 mês assim que aprovado)
- **Redução de Risco Esperada:** Alta — elimina o ponto único de falha onde produção e backup podem ser destruídos juntos.

**Trade-offs:** Custo anual recorrente, não pontual; precisa sobreviver a futuros ciclos de orçamento, não só este.

---

## GAP-004 — Frota de bombas de infusão sem controles dedicados

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar
**Justificativa:** Essa é a exposição de segurança do paciente mais direta da lista. Dado o orçamento, é tratada como Fase 1 da segmentação de dispositivos médicos — bombas primeiro, porque manipulação de dosagem é o resultado plausível mais grave.

- **Controle(s) Proposto(s):** VLAN dedicada para bombas de infusão, com regras de firewall restringindo tráfego só a estações clínicas e ao PACS — Técnico/Compensatório (mesmo padrão da estratégia do MRI no Task 6).
- **Custo Estimado:** $10-50K
- **Esforço de Implementação:** Longo Prazo (>1 mês)
- **Redução de Risco Esperada:** Alta especificamente para as bombas; ainda não cobre o resto da frota de IoT médico (ver GAP-007).

**Trade-offs:** Segmentar uma categoria de dispositivo antes do resto cria uma falsa sensação temporária de completude — precisa ser comunicado como Fase 1, não como "concluído".

---

## GAP-006 — Armário de rede: sem fechadura, credenciais expostas, sem câmera

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar
**Justificativa:** O item de melhor custo-benefício de toda a lista — trivialmente explorável, classificado como Crítico, e corrigível quase de graça.

- **Controle(s) Proposto(s):** Instalar uma fechadura física (Físico/Preventivo), remover/substituir a folha de credenciais colada e trocar a senha exposta do switch (Técnico/Preventivo), estender a cobertura de câmera ao armário (Físico/Detectivo).
- **Custo Estimado:** $0-1K
- **Esforço de Implementação:** Vitória Rápida (<1 semana)
- **Redução de Risco Esperada:** Alta em relação ao custo — deveria ser feito imediatamente, independente do resto do ciclo de orçamento.

**Trade-offs:** Nenhum significativo — isso é quase uma vitória pura.

---

## GAP-007 — Dispositivos médicos IoT compartilham rede plana (frota inteira)

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar (em fases)
**Justificativa:** A segmentação completa de IoT é cara e compartilha escopo com o GAP-004. Dado o orçamento, só a VLAN das bombas (GAP-004) é financiada este ano; o resto é adiado.

- **Controle(s) Proposto(s):** Estender o trabalho de VLAN do GAP-004 para monitores, chamada de enfermagem e leitores de crachá — Técnico/Compensatório.
- **Custo Estimado:** $10-50K (adiado para o próximo ano fiscal)
- **Esforço de Implementação:** Longo Prazo (>1 mês)
- **Redução de Risco Esperada:** Média este ano (só bombas, via GAP-004); Alta quando a Fase 2 for concluída.

**Trade-offs:** Monitores e outros dispositivos IoT que não são bombas permanecem expostos na rede plana até o fim deste ano fiscal — um risco residual explícito e documentado, não um descuido.

---

## GAP-010 — Login compartilhado do PACS elimina responsabilização

**Nível de Risco:** Crítico
**Estratégia de Tratamento:** Mitigar
**Justificativa:** A Radiologia já rejeitou logins individuais por serem "lentos demais" — a correção precisa resolver o problema de velocidade, não só reimpor a solução antiga.

- **Controle(s) Proposto(s):** Autenticação por crachá de proximidade ou cartão inteligente para estações PACS (Técnico/Preventivo) — login rápido por aproximação, sem credenciais compartilhadas, conforme a própria recomendação M-07 do Marcus.
- **Custo Estimado:** $1-10K
- **Esforço de Implementação:** Curto Prazo (<1 mês)
- **Redução de Risco Esperada:** Alta — restaura a responsabilização individual sem reintroduzir a reclamação de fluxo de trabalho que bloqueou a correção original.

**Trade-offs:** Exige aceitação da equipe de radiologia; se a adoção for resistida de novo, a correção técnica sozinha não vai funcionar — precisa de aval da chefia do departamento desde o início.

---

## GAP-001 — Banco de dados do EHR acessível pela rede inteira, sem detecção

**Nível de Risco:** Alto
**Estratégia de Tratamento:** Mitigar
**Justificativa:** A metade preventiva dessa correção é quase gratuita (uma mudança de regra de firewall); a metade detectiva vem "de carona" na implantação do SIEM do GAP-002, em vez de exigir orçamento separado.

- **Controle(s) Proposto(s):** Restringir a porta 5432 do `ehr-db-01` só ao `ehr-srv-01` (Técnico/Preventivo); incluir os logs de acesso ao banco no escopo do Wazuh do GAP-002 (Técnico/Detectivo).
- **Custo Estimado:** $0-1K
- **Esforço de Implementação:** Vitória Rápida (<1 semana)
- **Redução de Risco Esperada:** Alta para a parte preventiva imediatamente; a parte detectiva se completa quando o GAP-002 estiver no ar.

**Trade-offs:** Nenhum significativo pra mudança de firewall em si; o benefício de detecção depende do GAP-002 ser de fato financiado e implantado.

---

## Resumo de Orçamento

| Lacuna | Custo Estimado (este ano fiscal) |
|---|---|
| GAP-002 (SIEM + plano de RI) | ~$30.000 |
| GAP-003 (backup em nuvem) | ~$14.400 |
| GAP-004 (VLAN de bombas, Fase 1) | ~$30.000 |
| GAP-006 (fechadura/câmera do armário) | ~$500 |
| GAP-007 (restante da VLAN de IoT) | **$0 este ano — adiado** |
| GAP-010 (autenticação por crachá no PACS) | ~$5.000 |
| GAP-001 (regra de firewall) | ~$500 |
| **Total** | **~$80.400** |

Isso cabe dentro do orçamento anual de **$120.000**, deixando aproximadamente **$39.600** de reserva. Uso recomendado para a margem restante: começar a fechar o GAP-005 (cobertura de antivírus para servidores), a próxima lacuna de maior valor que não entrou nesta lista, em vez de antecipar a Fase 2 do GAP-007 — a segmentação de segurança do paciente (Fase 2) é adiada deliberadamente para o próximo ano fiscal, depois que a Fase 1 provar que a abordagem funciona, enquanto a cobertura de antivírus em servidores é uma vitória menor e mais rápida que reduz risco em vários ativos Críticos imediatamente.
