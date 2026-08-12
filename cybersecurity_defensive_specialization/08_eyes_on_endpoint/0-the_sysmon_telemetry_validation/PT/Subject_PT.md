# 0. Validação da Telemetria do Sysmon

**Objetivo:** Validar que o Sysmon está capturando corretamente eventos relevantes de segurança, disparando ações específicas e verificando se cada uma produz o Event ID esperado.

## Contexto

Você implantou o Sysmon, com uma linha de base da SwiftOnSecurity mais 5 regras customizadas. Mas implantação não é o mesmo que cobertura. Um erro de configuração, um tipo de evento faltando ou uma exclusão agressiva demais podem criar pontos cegos silenciosos. Essa tarefa prova que cada tipo de evento crítico do Sysmon está realmente disparando, executando uma sequência de testes controlada e checando os resultados.

## Instruções

Escreva um script PowerShell `0-sysmon_validation.ps1` que dispare ações específicas e verifique se o Sysmon captura cada uma delas:

- Criação de processo (Event ID 1): Execute `cmd.exe /c whoami` e verifique se o evento inclui a linha de comando completa
- Conexão de rede (Event ID 3): Inicie uma conexão de saída (por exemplo, `Test-NetConnection` para um IP conhecido) e verifique se o IP de destino, a porta e o processo estão registrados
- Criação de arquivo (Event ID 11): Crie um arquivo em `C:\Windows\Temp\` e verifique se o evento inclui o nome do arquivo alvo e o processo que o criou
- Modificação de registro (Event ID 13): Grave um valor de registro de teste e verifique se o evento inclui o caminho da chave, o nome do valor e o tipo de operação
- Consulta DNS (Event ID 22): Resolva um nome de domínio e verifique se a consulta e o resultado estão registrados

Para cada ação: registre o timestamp, procure no log de eventos do Sysmon pelo evento correspondente, registre se ele foi capturado com o Event ID correto e o nível de detalhe adequado.

## Saída Esperada

```
PS> .\0-sysmon_validation.ps1
[*] Running Sysmon telemetry validation...
    [1/5] Process creation (Event ID 1)...
          cmd.exe /c whoami -> Sysmon EID 1 captured, cmdline present   [PASS]
    [2/5] Network connection (Event ID 3)...
          Outbound TCP -> Sysmon EID 3 captured, dest IP/port present   [PASS]
    [3/5] File creation (Event ID 11)...
          C:\Windows\Temp\test.txt -> Sysmon EID 11 captured            [PASS]
    [4/5] Registry modification (Event ID 13)...
          HKCU\...\SysmonTest -> Sysmon EID 13 captured                 [PASS]
    [5/5] DNS query (Event ID 22)...
          nslookup example.com -> Sysmon EID 22 captured                [PASS]
[*] Cleanup: removing test artifacts...
Actions tested: 5 | Captured: 5 | Missed: 0
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `0-sysmon_validation.ps1`
