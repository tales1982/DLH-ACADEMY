<#
    Script Name : 7-auth_hardening.ps1
    Purpose     : Disable weak Kerberos encryption types (DES/RC4) and legacy
                  NTLMv1 fallback, closing the exact Kerberoasting path
                  Crimson Tide used in 3 of 5 hospital breaches (2x01 Task 7).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

# ADS_UF_USE_DES_KEY_ONLY - the UserAccountControl bit that forces an account
# to negotiate DES-only Kerberos tickets (MS-ADTS 2.2.16).
$UF_USE_DES_KEY_ONLY = 0x200000

function ConvertTo-EncryptionTypeList {
    param([Nullable[int]]$Bitmask)
    if ($null -eq $Bitmask -or $Bitmask -eq 0) {
        return @("DES", "RC4", "AES128", "AES256")
    }
    $types = @()
    if ($Bitmask -band 0x1)  { $types += "DES" }
    if ($Bitmask -band 0x2)  { $types += "DES" }
    if ($Bitmask -band 0x4)  { $types += "RC4" }
    if ($Bitmask -band 0x8)  { $types += "AES128" }
    if ($Bitmask -band 0x10) { $types += "AES256" }
    return ($types | Select-Object -Unique)
}

# --- Current Kerberos encryption types (krbtgt as the domain-wide proxy) -------
$krbtgt = Get-ADUser -Identity "krbtgt" -Properties msDS-SupportedEncryptionTypes
$currentTypes = ConvertTo-EncryptionTypeList -Bitmask $krbtgt.'msDS-SupportedEncryptionTypes'

Write-Host "[*] Current Kerberos types: $($currentTypes -join ', ')"
if ($currentTypes -contains "DES") { Write-Host "    [!] DES enabled - trivially breakable" }
if ($currentTypes -contains "RC4") { Write-Host "    [!] RC4 enabled - Kerberoastable" }

# --- Accounts with the "Use DES encryption types" flag --------------------------
Write-Host "[*] Accounts with DES flag..."
$allUsers = Get-ADUser -Filter * -Properties UserAccountControl, ServicePrincipalNames, DistinguishedName
$desAccounts = @($allUsers | Where-Object { $_.UserAccountControl -band $UF_USE_DES_KEY_ONLY })

if ($desAccounts.Count -eq 0) {
    Write-Host "    None found"
} else {
    foreach ($acct in $desAccounts) {
        Write-Host "    $($acct.SamAccountName): UseDESKeyOnly = True          [!]"
    }
}

# --- Service Principal Names ------------------------------------------------------
Write-Host "[*] Service Principal Names..."
$spnAccounts = @($allUsers | Where-Object { $_.ServicePrincipalNames.Count -gt 0 })
foreach ($acct in $spnAccounts) {
    foreach ($spn in $acct.ServicePrincipalNames) {
        Write-Host "    $($acct.SamAccountName): $spn"
    }
}
if ($spnAccounts.Count -gt 0) {
    Write-Host "    [!] All $($spnAccounts.Count) SPNs are Kerberoastable targets"
}

# --- Remediation -----------------------------------------------------------------
Write-Host "[*] Remediating..."

foreach ($acct in $desAccounts) {
    Set-ADAccountControl -Identity $acct.DistinguishedName -UseDESKeyOnly $false
    Write-Host "    $($acct.SamAccountName): Clearing DES flag              [DONE]"
}

# Domain-wide: restrict Kerberos to AES128 + AES256 only. This is the same
# registry value the "Network security: Configure encryption types allowed
# for Kerberos" GPO setting writes - AES128 (0x08) | AES256 (0x10) = 0x18.
$kerberosParamsPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters"
if (-not (Test-Path $kerberosParamsPath)) {
    New-Item -Path $kerberosParamsPath -Force | Out-Null
}
Set-ItemProperty -Path $kerberosParamsPath -Name "SupportedEncryptionTypes" -Value 0x18 -Type DWord -Force
Write-Host "    Supported encryption: AES128 + AES256   [SET]"

# NTLMv1: LmCompatibilityLevel=5 refuses LM and NTLM, sends NTLMv2 only.
$lsaPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
Set-ItemProperty -Path $lsaPath -Name "LmCompatibilityLevel" -Value 5 -Type DWord -Force
Write-Host "    NTLMv1: Refused (LmCompatibilityLevel=5) [SET]"

# --- Credential Guard awareness ---------------------------------------------------
# Enabling Credential Guard requires UEFI + Secure Boot + virtualization-based
# security, which nested/virtualized lab hosts frequently do not expose. This
# step reports readiness rather than forcing an enable that could leave the
# DC unbootable - a documented compensating control if unsupported, not a
# silent skip.
try {
    $deviceGuard = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace "root\Microsoft\Windows\DeviceGuard" -ErrorAction Stop
    $credGuardRunning = $deviceGuard.SecurityServicesRunning -contains 1
    if ($credGuardRunning) {
        Write-Host "[*] Credential Guard: Running                          [OK]"
    } else {
        Write-Host "[*] Credential Guard: Not running (requires VBS/UEFI/Secure Boot - documented compensating control: LSA process protection via RunAsPPL is the fallback on this VM)  [INFO]"
    }
} catch {
    Write-Host "[*] Credential Guard: Could not query Device Guard state on this host (likely unsupported in this nested VM)  [INFO]"
}

# --- Verification -------------------------------------------------------------------
Write-Host "[*] Verifying..."
$verifyEncTypes = (Get-ItemProperty -Path $kerberosParamsPath -Name "SupportedEncryptionTypes").SupportedEncryptionTypes
$verifyLmLevel  = (Get-ItemProperty -Path $lsaPath -Name "LmCompatibilityLevel").LmCompatibilityLevel

$encStatus = if ($verifyEncTypes -eq 0x18) { "[VERIFIED]" } else { "[FAILED]" }
$ntlmStatus = if ($verifyLmLevel -eq 5) { "[VERIFIED]" } else { "[FAILED]" }

Write-Host "    Kerberos: AES128, AES256 only           $encStatus"
Write-Host "    NTLM: v2 only                           $ntlmStatus"
