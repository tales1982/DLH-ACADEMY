# O que você precisa fazer

## Passo 1 — "Use DES encryption types" é um BIT dentro de `userAccountControl`, não uma propriedade separada

`UserAccountControl` é um inteiro onde cada bit liga/desliga uma característica da conta (conta desabilitada, senha nunca expira, etc.). O bit `0x200000` (`ADS_UF_USE_DES_KEY_ONLY`) é o que força aquela conta específica a negociar tickets Kerberos só em DES. Você detecta com uma operação bit a bit: `$conta.UserAccountControl -band 0x200000` — se o resultado não for zero, o bit está ligado. Isso é diferente de checar `msDS-SupportedEncryptionTypes` (usado nas Tarefas 0/1/3 para o tipo de criptografia aceito pelo KDC) — aqui é uma flag específica da CONTA, mais antiga e mais perigosa, porque força DES independentemente de qualquer outra configuração.

## Passo 2 — `Set-ADAccountControl` é o cmdlet certo, não `Set-ADUser`

Existe um cmdlet dedicado, `Set-ADAccountControl`, especificamente para ligar/desligar os bits de `userAccountControl` de forma legível (`-UseDESKeyOnly`, `-TrustedForDelegation`, `-PasswordNeverExpires`, etc.) em vez de você ter que calcular a máscara de bits manualmente. Isso evita um erro clássico: manipular o inteiro `userAccountControl` diretamente com operações bit a bit via `Set-ADUser -Replace` é arriscado porque um erro de cálculo pode acidentalmente desabilitar a conta inteira ou ligar uma flag que você não queria tocar.

## Passo 3 — Todo SPN é, por definição, kerberoastável — não é uma vulnerabilidade nova, é a natureza do protocolo

Qualquer conta com um Service Principal Name (SPN) registrado permite que QUALQUER usuário autenticado no domínio solicite um ticket de serviço Kerberos para aquela conta — e esse ticket vem criptografado com o hash da senha da conta de serviço. Se essa senha for fraca ou a criptografia for RC4 (rápida de quebrar offline), o Kerberoasting funciona. É por isso que a defesa real não é "remover os SPNs" (eles são necessários para a aplicação funcionar) — é (1) usar senhas longas/aleatórias nas contas de serviço, (2) forçar AES em vez de RC4, e idealmente (3) migrar para gMSA (Group Managed Service Accounts), que geram e trocam a própria senha automaticamente.

## Passo 4 — `SupportedEncryptionTypes = 0x18` é uma máscara de bits, não um valor mágico

`0x08` (AES128) `OR` `0x10` (AES256) = `0x18` (24 em decimal). Esse valor de registro em `HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters` é exatamente o que a configuração de GPO "Network security: Configure encryption types allowed for Kerberos" escreve por baixo dos panos — setar esse valor diretamente por script tem o mesmo efeito de marcar as caixinhas "AES128" e "AES256" (e deixar "DES" e "RC4" desmarcados) na interface gráfica.

## Passo 5 — Credential Guard normalmente NÃO funciona em VMs aninhadas, e está tudo bem reportar isso

Credential Guard exige Virtualization-Based Security (VBS), que por sua vez exige UEFI, Secure Boot e extensões de virtualização de hardware expostas à VM — coisas que um laboratório rodando dentro de outro hipervisor frequentemente não tem. O script consulta o estado e REPORTA a situação como um controle compensatório documentado, em vez de tentar forçar a ativação (o que poderia deixar o controlador de domínio sem inicializar). Isso segue o mesmo princípio do módulo 2x00: "justifique todo desvio," não finja que está tudo pronto quando não está.

## Onde entregar

O arquivo final vai como `7-auth_hardening.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
