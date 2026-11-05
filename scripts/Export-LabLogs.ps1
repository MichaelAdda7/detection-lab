# Exporte les journaux du lab dans le dépôt
param(
 [Parameter(Mandatory = $true)][string]$Name, # ex : T1105
 [ValidateSet("attack", "benign")][string]$Type = "attack"
)
$channels = [ordered]@{
 "sysmon" = "Microsoft-Windows-Sysmon/Operational"
 "security" = "Security"
 "powershell" = "Microsoft-Windows-PowerShell/Operational"
 "taskscheduler" = "Microsoft-Windows-TaskScheduler/Operational"
 "defender" = "Microsoft-Windows-Windows Defender/Operational"
}
$local = "C:\Lab\export\$Name"
$dest = "Z:\evtx\$Type\$Name"
New-Item -ItemType Directory -Force -Path $local, $dest | Out-Null
foreach ($k in $channels.Keys) {
 $file = "$local\$k.evtx"
 wevtutil epl $channels[$k] $file /ow:true
 Write-Host "[+] $($channels[$k]) -> $file" -ForegroundColor Green
}
Copy-Item "$local\*.evtx" $dest -Force
Write-Host "[+] Copié dans $dest" -ForegroundColor Cyan
