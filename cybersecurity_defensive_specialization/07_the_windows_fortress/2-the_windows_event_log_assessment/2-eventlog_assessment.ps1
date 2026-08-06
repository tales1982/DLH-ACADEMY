<#
    Script Name : 2-eventlog_assessment.ps1
    Purpose     : Assess the domain's current event-generation capability by
                  cross-referencing live audit policy configuration against
                  what the Security log has actually produced in the last 24
                  hours, for every critical Event ID this project depends on
                  (2x01 Task 2).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# --- Critical Event ID reference table ---------------------------------------
# "Audit Subcategory" here is the display label the team uses in runbooks;
# "AdvancedSubcategory" is the exact name auditpol.exe expects, which is what
# actually drives whether the event CAN be generated.
$Events = @(
    [PSCustomObject]@{ Id = 4624; Description = "Successful Logon";     DisplaySubcategory = "Logon";               AdvancedSubcategory = "Logon" }
    [PSCustomObject]@{ Id = 4625; Description = "Failed Logon";         DisplaySubcategory = "Logon";               AdvancedSubcategory = "Logon" }
    [PSCustomObject]@{ Id = 4648; Description = "Explicit Credentials"; DisplaySubcategory = "Logon";               AdvancedSubcategory = "Logon" }
    [PSCustomObject]@{ Id = 4688; Description = "Process Creation";     DisplaySubcategory = "Process Tracking";    AdvancedSubcategory = "Process Creation" }
    [PSCustomObject]@{ Id = 4720; Description = "Account Created";      DisplaySubcategory = "Account Management";  AdvancedSubcategory = "User Account Management" }
    [PSCustomObject]@{ Id = 4726; Description = "Account Deleted";      DisplaySubcategory = "Account Management";  AdvancedSubcategory = "User Account Management" }
    [PSCustomObject]@{ Id = 4732; Description = "Member Added to Group";DisplaySubcategory = "Account Management";  AdvancedSubcategory = "Security Group Management" }
    [PSCustomObject]@{ Id = 4672; Description = "Special Logon";       DisplaySubcategory = "Special Logon";       AdvancedSubcategory = "Special Logon" }
    [PSCustomObject]@{ Id = 1102; Description = "Audit Log Cleared";    DisplaySubcategory = "System Integrity";    AdvancedSubcategory = "Security State Change" }
)

# --- Live audit policy configuration -------------------------------------------
$subcatEnabled = @{}
try {
    $auditRows = auditpol /get /category:* /r 2>$null | ConvertFrom-Csv
    foreach ($row in $auditRows) {
        $subcatEnabled[$row.Subcategory] = ($row.'Inclusion Setting' -and $row.'Inclusion Setting' -ne "No Auditing")
    }
} catch {
    Write-Warning "auditpol query failed: $($_.Exception.Message)"
}

# --- Actual generation in the last 24 hours ------------------------------------
# This is the ground truth: a subcategory can be "enabled" on paper and still
# never fire if the triggering activity never happens (Explicit Credentials is
# the classic example - nobody ran a runas/explicit-credential logon today).
$since = (Get-Date).AddHours(-24)
$generatingIds = @{}
$notYetObserved = [System.Collections.Generic.List[string]]::new()

foreach ($evt in $Events) {
    $found = $false
    try {
        $result = Get-WinEvent -FilterHashtable @{ LogName = "Security"; Id = $evt.Id; StartTime = $since } `
            -MaxEvents 1 -ErrorAction SilentlyContinue
        $found = [bool]$result
    } catch {
        $found = $false
    }
    $generatingIds[$evt.Id] = $found

    if (-not $found -and $subcatEnabled.ContainsKey($evt.AdvancedSubcategory) -and $subcatEnabled[$evt.AdvancedSubcategory]) {
        $notYetObserved.Add("$($evt.Id) ($($evt.Description))")
    }
}

# --- Report --------------------------------------------------------------------
"{0,-9} {1,-25} {2,-21} {3}" -f "Event ID", "Description", "Audit Subcategory", "Status"
"{0,-9} {1,-25} {2,-21} {3}" -f "--------", "-----------", "-----------------", "------"

foreach ($evt in $Events) {
    $status = if ($generatingIds[$evt.Id]) { "[GENERATING]" } else { "[NOT CONFIGURED]" }
    "{0,-9} {1,-25} {2,-21} {3}" -f $evt.Id, $evt.Description, $evt.DisplaySubcategory, $status
}

if ($notYetObserved.Count -gt 0) {
    Write-Output ""
    Write-Output "Note: subcategory enabled but no matching event observed in the last 24h: $($notYetObserved -join ', ')"
}
