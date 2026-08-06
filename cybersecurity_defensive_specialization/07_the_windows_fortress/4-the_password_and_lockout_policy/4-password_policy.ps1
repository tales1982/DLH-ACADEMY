<#
    Script Name : 4-password_policy.ps1
    Purpose     : Deploy a CIS-aligned password and account lockout policy for
                  meddefense.local, closing FND-001 and FND-002 from Task 1 -
                  the single highest-impact change in this project (2x01
                  Task 4). Idempotent: safe to re-run, every step checks
                  current state before changing it.
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$GpoName = "MedDefense - Password and Lockout Policy"
$Domain  = Get-ADDomain
$DomainDN = $Domain.DistinguishedName

# Target values - FND-001/FND-002 from 1-domain_findings.ps1.
$MinLength        = 14
$Complexity       = $true
$HistoryCount     = 24
$MaxAge           = (New-TimeSpan -Days 0)     # 0 = does not expire (NIST 800-63B: length over forced rotation)
$MinAge           = (New-TimeSpan -Days 1)
$LockoutThreshold = 5
$LockoutDuration  = (New-TimeSpan -Minutes 15)
$LockoutWindow    = (New-TimeSpan -Minutes 15)

# --- Create the GPO (idempotent) ----------------------------------------------
Write-Host "[*] Creating GPO: `"$GpoName`"..." -NoNewline
$gpo = Get-GPO -Name $GpoName -ErrorAction SilentlyContinue
if ($gpo) {
    Write-Host " EXISTS"
} else {
    $gpo = New-GPO -Name $GpoName -Comment "MedDefense hardening: password/lockout policy. Addresses 2x01 Task 1 findings FND-001 and FND-002 (Crimson Tide advisory 1x05 - weak credentials enabled brute force in all 5 hospital breaches)."
    Write-Host " CREATED"
}

# --- Password policy ------------------------------------------------------------
# Account Policies (password/lockout/Kerberos) are domain-wide attributes on the
# domain object itself - they take effect only from GPOs linked at the domain
# root, and Set-ADDefaultDomainPasswordPolicy is the direct, idempotent way to
# write them (this is exactly what the Default Domain Policy GPO's Account
# Policies section edits under the hood). The GPO created above documents and
# tracks this change through normal Group Policy management; the cmdlet below
# is what actually enforces it.
Write-Host "[*] Configuring Password Policy..."

Set-ADDefaultDomainPasswordPolicy -Identity $Domain `
    -MinPasswordLength $MinLength `
    -ComplexityEnabled $Complexity `
    -PasswordHistoryCount $HistoryCount `
    -MaxPasswordAge $MaxAge `
    -MinPasswordAge $MinAge

$verify = Get-ADDefaultDomainPasswordPolicy -Identity $Domain

function Show-Setting {
    param([string]$Label, $Expected, $Actual)
    $status = if ($Actual -eq $Expected) { "[SET]" } else { "[FAILED]" }
    "    {0,-30}{1}" -f $Label, $status
}

Show-Setting -Label "Minimum Length: $MinLength" -Expected $MinLength -Actual $verify.MinPasswordLength
Show-Setting -Label "Complexity: Enabled" -Expected $Complexity -Actual $verify.ComplexityEnabled
Show-Setting -Label "History: $HistoryCount" -Expected $HistoryCount -Actual $verify.PasswordHistoryCount
Show-Setting -Label "Maximum Age: 0" -Expected $MaxAge -Actual $verify.MaxPasswordAge
Show-Setting -Label "Minimum Age: 1 day" -Expected $MinAge -Actual $verify.MinPasswordAge

# --- Account lockout policy -------------------------------------------------------
Write-Host "[*] Configuring Account Lockout..."

Set-ADDefaultDomainPasswordPolicy -Identity $Domain `
    -LockoutThreshold $LockoutThreshold `
    -LockoutDuration $LockoutDuration `
    -LockoutObservationWindow $LockoutWindow

$verify = Get-ADDefaultDomainPasswordPolicy -Identity $Domain

Show-Setting -Label "Threshold: $LockoutThreshold attempts" -Expected $LockoutThreshold -Actual $verify.LockoutThreshold
Show-Setting -Label "Duration: 15 minutes" -Expected $LockoutDuration -Actual $verify.LockoutDuration
Show-Setting -Label "Reset Counter: 15 minutes" -Expected $LockoutWindow -Actual $verify.LockoutObservationWindow

# --- Link the GPO to the domain root (idempotent) ---------------------------------
Write-Host "[*] Linking GPO to domain root..." -NoNewline
$existingLink = (Get-GPInheritance -Target $DomainDN).GpoLinks |
    Where-Object { $_.DisplayName -eq $GpoName }
if ($existingLink) {
    Write-Host " ALREADY LINKED"
} else {
    New-GPLink -Guid $gpo.Id -Target $DomainDN -LinkEnabled Yes | Out-Null
    Write-Host " LINKED"
}

# --- Force a Group Policy update ---------------------------------------------------
Write-Host "[*] Forcing Group Policy update..." -NoNewline
try {
    Invoke-GPUpdate -Computer $env:COMPUTERNAME -Force -RandomDelayInMinutes 0 | Out-Null
    Write-Host " COMPLETE"
} catch {
    Write-Host " FAILED: $($_.Exception.Message)"
}
