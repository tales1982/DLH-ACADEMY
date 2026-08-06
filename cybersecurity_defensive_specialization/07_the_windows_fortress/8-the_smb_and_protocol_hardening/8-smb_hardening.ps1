<#
    Script Name : 8-smb_hardening.ps1
    Purpose     : Disable SMBv1, enforce SMB signing and encryption, and turn
                  off NetBIOS/LLMNR - closing the EternalBlue-class protocol
                  surface and the two most common local-network credential
                  relay/poisoning vectors (2x01 Task 8).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-SmbState {
    $cfg = Get-SmbServerConfiguration
    [PSCustomObject]@{
        Smb1Enabled       = [bool]$cfg.EnableSMB1Protocol
        SigningRequired   = [bool]$cfg.RequireSecuritySignature
        EncryptionEnabled = [bool]$cfg.EncryptData
    }
}

# --- Current SMB configuration ------------------------------------------------
$before = Get-SmbState
Write-Host "[*] Current SMB Configuration..."
Write-Host "    SMBv1: $(if ($before.Smb1Enabled) { 'Enabled' } else { 'Disabled' })                         $(if ($before.Smb1Enabled) { '[!]' })"
Write-Host "    Signing Required: $($before.SigningRequired)                $(if (-not $before.SigningRequired) { '[!]' })"
Write-Host "    Encryption: $($before.EncryptionEnabled)                $(if (-not $before.EncryptionEnabled) { '[!]' })"

# --- Disable SMBv1 (server + client) -------------------------------------------
Write-Host "[*] Disabling SMBv1 (server + client)..." -NoNewline
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
try {
    Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -NoRestart -ErrorAction Stop | Out-Null
} catch {
    # Some SKUs expose SMB1 as three separate sub-features instead of one.
    foreach ($feature in @("SMB1Protocol-Client", "SMB1Protocol-Server", "SMB1Protocol-Deprecation")) {
        try { Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart -ErrorAction Stop | Out-Null } catch { }
    }
}
Write-Host "   [DONE]"

# --- Enforce SMB signing (required, not merely enabled) -------------------------
Write-Host "[*] Enforcing SMB Signing..." -NoNewline
Set-SmbServerConfiguration -RequireSecuritySignature $true -EnableSecuritySignature $true -Force
Set-SmbClientConfiguration -RequireSecuritySignature $true -EnableSecuritySignature $true -Force
Write-Host "               [SET]"

# --- Enable SMB encryption -------------------------------------------------------
Write-Host "[*] Enabling SMB Encryption..." -NoNewline
Set-SmbServerConfiguration -EncryptData $true -RejectUnencryptedAccess $true -Force
Write-Host "             [SET]"

# --- Disable NetBIOS over TCP/IP on every IP-enabled adapter --------------------
Write-Host "[*] Disabling NetBIOS over TCP/IP..." -NoNewline
# TcpipNetbiosOptions: 0 = default (use DHCP), 1 = enable, 2 = disable.
$adapters = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled = True"
foreach ($adapter in $adapters) {
    Invoke-CimMethod -InputObject $adapter -MethodName SetTcpipNetbios -Arguments @{ TcpipNetbiosOptions = 2 } | Out-Null
}
Write-Host "      [SET]"

# --- Disable LLMNR --------------------------------------------------------------
# EnableMulticast=0 under the Policies hive is exactly the registry value the
# "Turn off multicast name resolution" Administrative Template setting
# writes - applying it directly here has the same effect a domain-linked GPO
# would have once it processes on this host.
Write-Host "[*] Disabling LLMNR via GPO..." -NoNewline
$dnsClientPolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
if (-not (Test-Path $dnsClientPolicyPath)) {
    New-Item -Path $dnsClientPolicyPath -Force | Out-Null
}
Set-ItemProperty -Path $dnsClientPolicyPath -Name "EnableMulticast" -Value 0 -Type DWord -Force
Write-Host "               [SET]"

# --- Verification: before/after comparison --------------------------------------
$after = Get-SmbState
$llmnrDisabled = (Get-ItemProperty -Path $dnsClientPolicyPath -Name "EnableMulticast").EnableMulticast -eq 0

Write-Host "[*] Verification..."
Write-Host "    SMBv1: $(if (-not $after.Smb1Enabled) { 'Disabled                        [VERIFIED]' } else { 'Still Enabled                   [FAILED]' })"
Write-Host "    Signing: $(if ($after.SigningRequired) { 'Required                      [VERIFIED]' } else { 'Not Required                  [FAILED]' })"
Write-Host "    Encryption: $(if ($after.EncryptionEnabled) { 'Enabled                    [VERIFIED]' } else { 'Disabled                   [FAILED]' })"
Write-Host "    LLMNR: $(if ($llmnrDisabled) { 'Disabled                        [VERIFIED]' } else { 'Still Enabled                   [FAILED]' })"
