# 23. O Plano de Validação

**Objetivo:** Projetar uma estratégia de validação pós-remediação e monitoramento contínuo.

## Contexto

Aplicar o patch não é o fim. A verificação é o fim. Um patch que foi implantado mas falhou silenciosamente é pior do que nenhum patch, porque todo mundo acha que o problema está resolvido.

## Instruções

Projete um Plano de Validação para a MedDefense cobrindo:

1. **Verificação Pós-Patch:** Para cada uma das 3 remediações "Imediatas" da T20, descreva o teste ou verificação específica que confirma que o patch foi aplicado corretamente. (Exemplo: reescanear a porta/serviço específico, verificar se a string de versão mudou, confirmar que o exploit não funciona mais.)
2. **Validação de Controle Compensatório:** Para os controles compensatórios (ressonância, IoT médico), descreva como verificar se eles estão funcionando como pretendido.
3. **Cronograma de Rescan:** Que frequência de scan de vulnerabilidades a MedDefense deveria adotar? Justifique sua recomendação.
4. **Inteligência Contínua:** Como a MedDefense deveria integrar alertas do CISA KEV, avisos de fornecedores e atualizações de feeds de ameaça ao seu ciclo de gestão de vulnerabilidades?
5. **Diagrama de Ciclo de Vida:** Descreva (em texto) o ciclo de vida contínuo de gestão de vulnerabilidades da MedDefense: Scan → Triagem → Priorização → Remediação → Validação → Repetição. Para cada etapa, identifique quem é responsável (Analista de Segurança, Operações de TI, Fornecedor, Gestão).

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `23-validation_plan.md`
