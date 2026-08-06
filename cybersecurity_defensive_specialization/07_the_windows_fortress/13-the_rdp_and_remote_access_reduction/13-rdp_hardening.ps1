<#
    Script Name : 13-rdp_hardening.ps1
    Purpose     : Harden RDP - NLA, membership-restricted access, session
                  limits, encryption, and disabled clipboard/drive
                  redirection - closing the exact lateral-movement entry
                  point Crimson Tide used in Phase 3 (2x01 Task 13).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-06
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$RdpTcpPath      = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
$TsPoliciesPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$RemAssistPath   = "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance"

function Set-RegDword {
    param([string]$Path, [string]$Name, [int]$Value)
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type DWord -Force
}

# --- Network Level Authentication -------------------------------------------------
Write-Host "[*] Enabling NLA..." -NoNewline
Set-RegDword -Path $RdpTcpPath -Name "UserAuthentication" -Value 1
Write-Host " UserAuthentication = 1       [SET]"

# --- Restrict RDP access to G_IT_Admins only ---------------------------------------
# On a domain controller, RDP eligibility is governed by membership in the
# built-in AD domain-local group "Remote Desktop Users" (DCs have no
# meaningful local SAM group of their own) - not local group membership as
# on a member server or workstation.
Write-Host "[*] Restricting to G_IT_Admins..."
$rdpGroup = "Remote Desktop Users"
$domainUsers = Get-ADGroup -Identity "Domain Users"
$currentMembers = Get-ADGroupMember -Identity $rdpGroup -ErrorAction SilentlyContinue

if ($currentMembers | Where-Object { $_.SID -eq $domainUsers.SID }) {
    Remove-ADGroupMember -Identity $rdpGroup -Members $domainUsers -Confirm:$false
    Write-Host "    Removed: Domain Users from Remote Desktop Users"
}

try {
    Add-ADGroupMember -Identity $rdpGroup -Members "G_IT_Admins" -ErrorAction Stop
} catch {
    # Already a member - fine, this step is idempotent.
}
Write-Host "    Added: G_IT_Admins                           [SET]"

# --- Session limits -----------------------------------------------------------------
Write-Host "[*] Session limits..."
Set-RegDword -Path $RdpTcpPath -Name "MaxIdleTime" -Value (15 * 60 * 1000)
Write-Host "    Idle timeout: 15 min                         [SET]"
Set-RegDword -Path $RdpTcpPath -Name "MaxConnectionTime" -Value (8 * 60 * 60 * 1000)
Write-Host "    Max session: 8 hours                         [SET]"

# --- Encryption ------------------------------------------------------------------------
# MinEncryptionLevel=3 (High), SecurityLayer=2 (SSL/TLS) - together this is
# the "High/SSL" setting exposed in the RDP-Tcp connection properties GUI.
Write-Host "[*] Encryption: High/SSL..." -NoNewline
Set-RegDword -Path $RdpTcpPath -Name "MinEncryptionLevel" -Value 3
Set-RegDword -Path $RdpTcpPath -Name "SecurityLayer" -Value 2
Write-Host "                        [SET]"

# --- Clipboard and drive redirection (exfiltration risk) -----------------------------
Write-Host "[*] Clipboard: Disabled..." -NoNewline
Set-RegDword -Path $TsPoliciesPath -Name "fDisableClip" -Value 1
Write-Host "                          [SET]"

Write-Host "[*] Drive redirection: Disabled..." -NoNewline
Set-RegDword -Path $TsPoliciesPath -Name "fDisableCdm" -Value 1
Write-Host "                  [SET]"

# --- Remote Assistance ------------------------------------------------------------------
Write-Host "[*] Remote Assistance: Disabled..." -NoNewline
Set-RegDword -Path $RemAssistPath -Name "fAllowToGetHelp" -Value 0
Write-Host "                  [SET]"

# --- Verification -------------------------------------------------------------------------
Write-Host "[*] Verification..."
$nlaVerify = (Get-ItemProperty -Path $RdpTcpPath -Name "UserAuthentication").UserAuthentication
$nlaStatus = if ($nlaVerify -eq 1) { "[VERIFIED]" } else { "[FAILED]" }
Write-Host "    NLA: Required                                $nlaStatus"

$finalMembers = @(Get-ADGroupMember -Identity $rdpGroup -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name)
$onlyItAdmins = ($finalMembers.Count -gt 0) -and (-not ($finalMembers | Where-Object { $_ -eq "Domain Users" }))
$accessStatus = if ($onlyItAdmins) { "[VERIFIED]" } else { "[FAILED]" }
Write-Host "    Access: G_IT_Admins only                     $accessStatus"
