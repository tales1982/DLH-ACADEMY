<#
    Script Name : 11-firewall_hardening.ps1
    Purpose     : Enforce default-deny inbound on all three Windows Firewall
                  profiles and replace broad legacy allow rules with narrow,
                  subnet-scoped rules for the services DC01 actually needs to
                  expose - endpoint-level network segmentation (2x01 Task 11).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-06
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$MgmtSubnet   = "10.10.3.0/24"
$ServerSubnet = "10.10.1.0/24"

# --- Current firewall state -----------------------------------------------------
Write-Host "[*] Current Firewall State..."
$profilesBefore = Get-NetFirewallProfile -All
foreach ($p in $profilesBefore) {
    $enabledText = if ($p.Enabled) { "ON" } else { "OFF" }
    $inboundText = if ($p.Enabled) { ", DefaultInbound: $($p.DefaultInboundAction)" } else { "" }
    $flag = if (-not $p.Enabled -or $p.DefaultInboundAction -eq "Allow") { "[!]" } else { "" }
    Write-Host "    $($p.Name): $enabledText$inboundText       $flag"
}

# --- Default-deny inbound on all three profiles -----------------------------------
Write-Host "[*] Setting default-deny on all profiles..." -NoNewline
Set-NetFirewallProfile -All -Enabled True -DefaultInboundAction Block -DefaultOutboundAction Allow
Write-Host " [SET]"

# --- Allow rules for required services only ----------------------------------------
# Each "service" is a logical group (-Group) that may need more than one
# underlying rule object (TCP and UDP are always separate NetFirewallRule
# objects) - grouping lets verification count 6 logical services, not 8 raw
# rule objects.
$services = @(
    @{ Group = "MedDef-RDP-Mgmt"; Label = "MedDef-RDP-Mgmt:  TCP 3389 from $MgmtSubnet";           Specs = @(
        @{ Name = "MedDef-RDP-Mgmt-TCP"; Protocol = "TCP"; Port = "3389"; Remote = $MgmtSubnet }
    )}
    @{ Group = "MedDef-DNS"; Label = "MedDef-DNS:        TCP/UDP 53";                                Specs = @(
        @{ Name = "MedDef-DNS-TCP"; Protocol = "TCP"; Port = "53"; Remote = "Any" }
        @{ Name = "MedDef-DNS-UDP"; Protocol = "UDP"; Port = "53"; Remote = "Any" }
    )}
    @{ Group = "MedDef-LDAP"; Label = "MedDef-LDAP:       TCP 389";                                  Specs = @(
        @{ Name = "MedDef-LDAP-TCP"; Protocol = "TCP"; Port = "389"; Remote = "Any" }
    )}
    @{ Group = "MedDef-Kerberos"; Label = "MedDef-Kerberos:   TCP/UDP 88";                           Specs = @(
        @{ Name = "MedDef-Kerberos-TCP"; Protocol = "TCP"; Port = "88"; Remote = "Any" }
        @{ Name = "MedDef-Kerberos-UDP"; Protocol = "UDP"; Port = "88"; Remote = "Any" }
    )}
    @{ Group = "MedDef-SMB"; Label = "MedDef-SMB:        TCP 445 from $ServerSubnet";                Specs = @(
        @{ Name = "MedDef-SMB-TCP"; Protocol = "TCP"; Port = "445"; Remote = $ServerSubnet }
    )}
    @{ Group = "MedDef-WinRM"; Label = "MedDef-WinRM:      TCP 5985-5986 from $MgmtSubnet";          Specs = @(
        @{ Name = "MedDef-WinRM-TCP"; Protocol = "TCP"; Port = "5985-5986"; Remote = $MgmtSubnet }
    )}
)

Write-Host "[*] Creating allow rules..."
foreach ($svc in $services) {
    foreach ($spec in $svc.Specs) {
        $existing = Get-NetFirewallRule -DisplayName $spec.Name -ErrorAction SilentlyContinue
        if ($existing) {
            $existing | Set-NetFirewallRule -Enabled True -Action Allow -RemoteAddress $spec.Remote
        } else {
            New-NetFirewallRule -DisplayName $spec.Name -Group $svc.Group -Direction Inbound `
                -Protocol $spec.Protocol -LocalPort $spec.Port -RemoteAddress $spec.Remote `
                -Action Allow -Profile Domain | Out-Null
        }
    }
    Write-Host "    $($svc.Label)     [CREATED]"
}

# --- Dropped packet logging ------------------------------------------------------
Write-Host "[*] Enabling dropped packet logging..." -NoNewline
$logDir = "$env:SystemRoot\System32\LogFiles\Firewall"
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
Set-NetFirewallProfile -All -LogBlocked True -LogAllowed False `
    -LogFileName "$logDir\pfirewall.log" -LogMaxSizeKilobytes 16384
Write-Host "     [SET]"

# --- Disable legacy allow rules that conflict with the new policy ------------------
Write-Host "[*] Disabling legacy allow rules..." -NoNewline
$legacyRules = @(Get-NetFirewallRule -Direction Inbound -Action Allow -Enabled True -ErrorAction SilentlyContinue |
    Where-Object { $_.Group -notlike "MedDef-*" -and $_.DisplayName -notlike "MedDef-*" })
foreach ($rule in $legacyRules) {
    Disable-NetFirewallRule -Name $rule.Name -ErrorAction SilentlyContinue
}
Write-Host " (found $($legacyRules.Count))    [DONE]"

# --- Verification -------------------------------------------------------------------
Write-Host "[*] Verification..."
$profilesAfter = Get-NetFirewallProfile -All
$allBlocking = -not (@($profilesAfter | Where-Object { -not $_.Enabled -or $_.DefaultInboundAction -ne "Block" })).Count
$profileStatus = if ($allBlocking) { "[VERIFIED]" } else { "[FAILED]" }
Write-Host "    All 3 profiles: ON, DefaultInbound: Block  $profileStatus"

$activeGroups = @(Get-NetFirewallRule -Enabled True -ErrorAction SilentlyContinue |
    Where-Object { $_.Group -like "MedDef-*" } |
    Select-Object -ExpandProperty Group -Unique)
$ruleStatus = if ($activeGroups.Count -eq $services.Count) { "[VERIFIED]" } else { "[FAILED]" }
Write-Host "    Custom rules: $($activeGroups.Count) active                     $ruleStatus"
