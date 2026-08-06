# 12. Política do AppLocker

**Objetivo:** Implantar uma lista de permissões de aplicações via AppLocker para impedir que executáveis não autorizados rodem, bloqueando o mecanismo de implantação de ransomware usado pelo Crimson Tide.

## Contexto

O Crimson Tide implantou ransomware como um executável enviado via GPO. O AppLocker teria bloqueado isso: se só executáveis aprovados podem rodar, um payload malicioso derrubado via GPO falha ao executar. O AppLocker é o controle que teria parado a Fase 6 completamente. Mas o AppLocker tem uma restrição clínica: os médicos usam uma aplicação de imagem médica (`DicomViewer.exe`) assinada por uma pequena empresa de software médico. A política precisa permitir isso enquanto bloqueia tudo o mais.

## Instruções

Escreva um script PowerShell `12-applocker_config.ps1` que:

- Crie uma GPO chamada "MedDefense - AppLocker Policy"
- Configure regras de executáveis (`.exe`, `.com`):
  - Permitir: diretórios de sistema do Windows (`C:\Windows\*`)
  - Permitir: Program Files (`C:\Program Files\*`, `C:\Program Files (x86)\*`)
  - Permitir: aplicações aprovadas pela MedDefense (regra de caminho explícita para o DicomViewer)
  - Negar: todos os outros locais
- Configure regras de script (`.ps1`, `.bat`, `.cmd`, `.vbs`):
  - Permitir: scripts de sistema de `C:\Windows\*`
  - Permitir: scripts administrativos de `C:\MedDefense_Lab\Scripts\*`
  - Negar: todos os outros locais
- Configure o AppLocker em modo Apenas Auditoria (não Aplicar, para não quebrar aplicações durante o período de testes)
- Inicie o serviço Application Identity
- Exporte o XML da política do AppLocker

## Saída Esperada

```
PS> .\12-applocker_config.ps1
[*] Creating GPO: "MedDefense - AppLocker Policy"... CREATED
[*] Starting AppIDSvc... Running           [OK]
[*] Configuring Executable Rules...
    Allow: C:\Windows\*                    [SET]
    Allow: C:\Program Files\*              [SET]
    Allow: C:\Program Files (x86)\*        [SET]
    Allow: DicomViewer.exe (MedImage Corp) [SET]
    Default: DENY                          [SET]
[*] Configuring Script Rules...
    Allow: C:\Windows\*                    [SET]
    Allow: C:\MedDefense_Lab\Scripts\*     [SET]
    Default: DENY                          [SET]
[*] Mode: AUDIT ONLY (not enforcing)
[*] Linking GPO... COMPLETE
[*] Testing...
    notepad.exe from C:\Windows: ALLOWED   [EXPECTED]
    calc.exe from C:\Temp: WOULD BLOCK     [EXPECTED]
Policy exported to: applocker_policy.xml
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `12-applocker_config.ps1`, `applocker_policy.xml`
