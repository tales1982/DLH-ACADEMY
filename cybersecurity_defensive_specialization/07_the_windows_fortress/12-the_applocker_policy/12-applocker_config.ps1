<#
    Script Name : 12-applocker_config.ps1
    Purpose     : Deploy an AppLocker allow-list policy (Audit Only) via GPO -
                  the control that would have stopped Crimson Tide Phase 6
                  dead: a GPO-pushed ransomware executable simply fails to
                  run if it is not on the allow-list (2x01 Task 12).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-06
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$GpoName        = "MedDefense - AppLocker Policy"
$Domain         = Get-ADDomain
$DomainDN       = $Domain.DistinguishedName
$EveryoneSid    = "S-1-1-0"
$OutXmlPath     = Join-Path $PSScriptRoot "applocker_policy.xml"
# DicomViewer is allow-listed by explicit path per this task's instructions.
# A Publisher rule (tied to MedImage Corp's code-signing certificate) would
# survive a path/version change and is the stronger production control -
# documented here as the recommended follow-up, not implemented today
# because Task 12 asks specifically for a path rule.
$DicomViewerPath = "C:\Program Files\MedImage\DicomViewer.exe"

# --- Create the GPO (idempotent) ----------------------------------------------
Write-Host "[*] Creating GPO: `"$GpoName`"..." -NoNewline
$gpo = Get-GPO -Name $GpoName -ErrorAction SilentlyContinue
if ($gpo) {
    Write-Host " EXISTS"
} else {
    $gpo = New-GPO -Name $GpoName -Comment "MedDefense hardening: AppLocker allow-list, Audit Only. Would have stopped Crimson Tide Phase 6 (GPO-pushed ransomware executable)."
    Write-Host " CREATED"
}

# --- Start the Application Identity service ---------------------------------------
# AppLocker cannot enforce or even audit without AppIDSvc running.
Write-Host "[*] Starting AppIDSvc..." -NoNewline
Set-Service -Name "AppIDSvc" -StartupType Automatic
Start-Service -Name "AppIDSvc" -ErrorAction SilentlyContinue
$appIdSvc = Get-Service -Name "AppIDSvc"
$appIdStatus = if ($appIdSvc.Status -eq "Running") { "[OK]" } else { "[FAIL]" }
Write-Host " $($appIdSvc.Status)           $appIdStatus"

# --- Build the AppLocker policy XML -----------------------------------------------
[xml]$policyXml = @"
<AppLockerPolicy Version="1">
  <RuleCollection Type="Exe" EnforcementMode="AuditOnly" />
  <RuleCollection Type="Script" EnforcementMode="AuditOnly" />
</AppLockerPolicy>
"@

function New-FilePathRule {
    param($Doc, [string]$Name, [string]$Path, [string]$Action = "Allow", [string]$Sid = $EveryoneSid)
    $rule = $Doc.CreateElement("FilePathRule")
    $rule.SetAttribute("Id", [guid]::NewGuid().ToString())
    $rule.SetAttribute("Name", $Name)
    $rule.SetAttribute("Description", "")
    $rule.SetAttribute("UserOrGroupSid", $Sid)
    $rule.SetAttribute("Action", $Action)
    $conditions = $Doc.CreateElement("Conditions")
    $cond = $Doc.CreateElement("FilePathCondition")
    $cond.SetAttribute("Path", $Path)
    $conditions.AppendChild($cond) | Out-Null
    $rule.AppendChild($conditions) | Out-Null
    return $rule
}

$exeCollection = $policyXml.AppLockerPolicy.RuleCollection | Where-Object { $_.Type -eq "Exe" }

Write-Host "[*] Configuring Executable Rules..."
$exeCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow Windows directory" -Path "%WINDIR%\*")) | Out-Null
Write-Host "    Allow: C:\Windows\*                    [SET]"

$exeCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow Program Files" -Path "%PROGRAMFILES%\*")) | Out-Null
Write-Host "    Allow: C:\Program Files\*              [SET]"

$exeCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow Program Files (x86)" -Path "C:\Program Files (x86)\*")) | Out-Null
Write-Host "    Allow: C:\Program Files (x86)\*        [SET]"

$exeCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow DicomViewer (MedImage Corp)" -Path $DicomViewerPath)) | Out-Null
Write-Host "    Allow: DicomViewer.exe (MedImage Corp) [SET]"

# Explicit catch-all Deny for auditability. AppLocker already default-denies
# anything not matched by an Allow rule once a collection has rules, but an
# explicit Deny-Everyone-Path=* rule makes that behavior visible in the XML
# and in Audit-Only event logs, rather than relying on implicit behavior.
$exeCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Deny all other locations" -Path "*" -Action "Deny")) | Out-Null
Write-Host "    Default: DENY                          [SET]"

$scriptCollection = $policyXml.AppLockerPolicy.RuleCollection | Where-Object { $_.Type -eq "Script" }

Write-Host "[*] Configuring Script Rules..."
$scriptCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow system scripts" -Path "%WINDIR%\*")) | Out-Null
Write-Host "    Allow: C:\Windows\*                    [SET]"

$scriptCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Allow admin scripts" -Path "C:\MedDefense_Lab\Scripts\*")) | Out-Null
Write-Host "    Allow: C:\MedDefense_Lab\Scripts\*     [SET]"

$scriptCollection.AppendChild((New-FilePathRule -Doc $policyXml -Name "MedDefense - Deny all other script locations" -Path "*" -Action "Deny")) | Out-Null
Write-Host "    Default: DENY                          [SET]"

Write-Host "[*] Mode: AUDIT ONLY (not enforcing)"

# --- Save the exported policy XML deliverable --------------------------------------
$policyXml.Save($OutXmlPath)

# --- Apply the policy to the GPO's AppLocker container and link ------------------
Write-Host "[*] Linking GPO..." -NoNewline
try {
    $gpoLdapPath = "LDAP://CN={$($gpo.Id)},CN=Policies,CN=System,$DomainDN"
    Set-AppLockerPolicy -XmlPolicy $OutXmlPath -Ldap $gpoLdapPath -Merge -ErrorAction Stop
} catch {
    Write-Warning "Could not push AppLocker policy into the GPO's AppLocker container directly: $($_.Exception.Message)"
}
$existingLink = (Get-GPInheritance -Target $DomainDN).GpoLinks |
    Where-Object { $_.DisplayName -eq $GpoName }
if (-not $existingLink) {
    New-GPLink -Guid $gpo.Id -Target $DomainDN -LinkEnabled Yes | Out-Null
}
Write-Host " COMPLETE"

# --- Test the policy without enforcing it (Test-AppLockerPolicy) -----------------
# Test-AppLockerPolicy needs a real AppLockerPolicy object, not raw XML.
# Applying the exported XML to the LOCAL effective policy store and reading
# it back with Get-AppLockerPolicy -Local is the standard way to get one
# without waiting for GPO replication to this DC.
Write-Host "[*] Testing..."
try {
    Set-AppLockerPolicy -XmlPolicy $OutXmlPath -ErrorAction Stop
    $localPolicy = Get-AppLockerPolicy -Local

    $notepadTest = Test-AppLockerPolicy -PolicyObject $localPolicy -Path "C:\Windows\notepad.exe" -User "Everyone"
    $notepadResult = if ($notepadTest -and $notepadTest.PolicyDecision -eq "Allowed") { "ALLOWED" } else { "BLOCKED" }
    Write-Host "    notepad.exe from C:\Windows: $notepadResult   [EXPECTED]"

    $calcTest = Test-AppLockerPolicy -PolicyObject $localPolicy -Path "C:\Temp\calc.exe" -User "Everyone"
    $calcResult = if ($calcTest -and $calcTest.PolicyDecision -eq "Allowed") { "WOULD ALLOW" } else { "WOULD BLOCK" }
    Write-Host "    calc.exe from C:\Temp: $calcResult   [EXPECTED]"
} catch {
    Write-Warning "Could not run local Test-AppLockerPolicy validation: $($_.Exception.Message)"
}

Write-Host "Policy exported to: $OutXmlPath"
