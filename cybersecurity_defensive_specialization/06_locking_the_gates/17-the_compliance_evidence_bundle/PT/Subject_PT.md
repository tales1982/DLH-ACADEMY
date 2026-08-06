# 17. Pacote de Evidências de Conformidade Legível por Máquina

**Objetivo:** Gerar o artefato final de conformidade que comprova o que foi selecionado, remediado, validado e intencionalmente deixado sem resolver.

## Contexto

Isso não deve ser um relatório narrativo. É um artefato JSON pronto para auditor, montado a partir das saídas criadas ao longo do projeto.

## Instruções

Escreva `17-compliance_bundle.sh`.

O script precisa ler:

- `cis_profile.json`
- `gap_analysis.json`
- `remediation_queue.json`
- `audit_validation.json`
- `validation_results.json`
- `hardening_improvement.json`

O script precisa produzir `compliance_report.json` com identidade do sistema, data do hardening, controles selecionados/remediados/verificados/não resolvidos, desvios, controles compensatórios, achados residuais do Lynis, percentual final de conformidade, e arquivos de evidência usados.

Todo desvio precisa incluir ID do controle, motivo, risco aceito, controle compensatório e responsável.

## Saída Esperada

```
$ ./17-compliance_bundle.sh
Evidence files loaded: 6
Controls selected: 15
Controls remediated: 13
Controls verified: 13
Deviations documented: 2
Overall compliance: 86.7%
Residual findings: 22
Report saved to: compliance_report.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `17-compliance_bundle.sh`
