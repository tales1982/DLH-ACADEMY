# Classificação de Incidentes — MedDefense Health Systems

## Metodologia

Cada incidente do registro do Marcus Webb foi avaliado contra a Tríade CIA. O pilar primário reflete o impacto direto descrito no relato. Um pilar secundário só é listado quando o próprio texto oferece suporte explícito para ele — impactos secundários especulativos ou hipotéticos foram propositalmente descartados.

## Tabela de Classificação de Incidentes

| ID | Data | Pilar Primário | Pilar Secundário |
|----|--------|-----------------|-------------------|
| A  | 15 jan | Disponibilidade | Integridade       |
| B  | 2 fev  | Confidencialidade | Nenhum identificado |
| C  | 18 mar | Integridade | Nenhum identificado |
| D  | 5 abr  | Integridade | Nenhum identificado |
| E  | 22 mai | Disponibilidade | Nenhum identificado |
| F  | 10 jun | Confidencialidade | Disponibilidade |

## Justificativa por Incidente

**A — Ransomware criptografou o `billing-srv-01` (15 jan)**
Primário — Disponibilidade: o servidor ficou inacessível por 4 dias, bloqueando o processamento de reembolsos.
Secundário — Integridade: criptografar já é, por definição, uma alteração não autorizada do dado original.

**B — Portal do paciente expôs resultados de outros pacientes via manipulação de URL (2 fev)**
Primário — Confidencialidade: um controle de acesso quebrado (IDOR) permitia que um paciente autenticado visse resultados de outro paciente.
Secundário — Nenhum identificado: nenhum dado foi alterado nem ficou indisponível — foi apenas exposição por visualização.

**C — Script de banco de dados sobrescreveu valores de dosagem (18 mar)**
Primário — Integridade: um bug em script de atualização sobrescreveu dosagens corretas por incorretas.
Secundário — Nenhum identificado: o sistema permaneceu acessível durante todo o incidente, e não há relato de visualização não autorizada.

**D — Site público do Central foi desfigurado / defacement (5 abr)**
Primário — Integridade: o conteúdo da página inicial foi substituído por conteúdo não autorizado.
Secundário — Nenhum identificado: o site não contém dados de pacientes (descarta confidencialidade) e continuou acessível — apenas alterado — até ser restaurado.

**E — Sistema de EHR ficou fora do ar por 9 horas durante migração (22 mai)**
Primário — Disponibilidade: o EHR ficou inacessível por 9 horas, forçando o uso de registros em papel.
Secundário — Nenhum identificado: não há relato de alteração de dado ou acesso não autorizado neste incidente.

**F — Notebook pessoal não gerenciado ficou na rede interna por 3 semanas (10 jun)**
Primário — Confidencialidade: o notebook contornou a segmentação de rede e tinha alcance até o mesmo segmento do compartilhamento de arquivos do RH.
Secundário — Disponibilidade: um cliente de torrent gera tráfego pesado e constante de upload/download; rodando sem detecção na rede interna por 3 semanas, pode degradar a performance da rede para os sistemas clínicos e administrativos que compartilham essa mesma rede.
