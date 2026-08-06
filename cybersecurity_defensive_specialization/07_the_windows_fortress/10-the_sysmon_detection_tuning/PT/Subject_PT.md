# 10. Ajuste de Detecção do Sysmon

**Objetivo:** Escrever regras de detecção personalizadas do Sysmon direcionadas a ameaças específicas da MedDefense, e depois validar cada regra com um gatilho controlado.

## Contexto

A configuração da SwiftOnSecurity é uma baseline sólida, mas é genérica. A MedDefense tem ameaças específicas: o Crimson Tide usa Rclone para exfiltração (Fase 4), PsExec para movimento lateral (Fase 3), e PowerShell codificado para execução (Fase 3). Regras personalizadas que detectam ESSAS ferramentas são mais valiosas do que cobertura genérica. Adicionar regras para criação de processo a partir de caminhos incomuns, conexões de rede para IPs externos a partir de processos de servidor, criação de arquivo em diretórios de inicialização e modificações de registro em chaves de persistência torna a instrumentação específica para o modelo de ameaça da MedDefense.

## Instruções

Escreva um script PowerShell `10-sysmon_tune.ps1` que:

- Carregue a configuração atual do Sysmon
- Adicione 5 regras de detecção personalizadas direcionadas às ameaças da MedDefense:
  - Regra 1: Detectar a execução do `rclone.exe` (ferramenta de exfiltração)
  - Regra 2: Detectar a instalação do serviço PsExec (modificação de registro)
  - Regra 3: Detectar a execução de PowerShell codificado (`-enc` na linha de comando)
  - Regra 4: Detectar `vssadmin.exe delete shadows` (pré-criptografia de ransomware)
  - Regra 5: Detectar a criação de nova tarefa agendada (persistência)
- Atualize a configuração do Sysmon
- Dispare-e-verifique cada regra: execute um gatilho seguro, verifique o log do Sysmon, reporte PASS/FAIL

Produza o `sysmonconfig.xml` atualizado como um entregável.

## Saída Esperada

```
PS> .\10-sysmon_tune.ps1
[*] Loading Sysmon config... OK
[*] Adding custom rules...
    Rule 1: Rclone detection                [ADDED]
    Rule 2: PsExec service installation     [ADDED]
    Rule 3: Encoded PowerShell              [ADDED]
    Rule 4: Shadow deletion (vssadmin)      [ADDED]
    Rule 5: Scheduled task persistence      [ADDED]
[*] Updating Sysmon config... OK
[*] Trigger-and-Verify...
    Rule 1: rclone.exe detection            [PASS]
    Rule 2: PsExec registry key             [PASS]
    Rule 3: Encoded PowerShell              [PASS]
    Rule 4: vssadmin execution              [PASS]
    Rule 5: schtasks /create                [PASS]
Custom rules: 5 added | Tests: 5/5 PASS
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `10-sysmon_tune.ps1`, `sysmonconfig.xml`
