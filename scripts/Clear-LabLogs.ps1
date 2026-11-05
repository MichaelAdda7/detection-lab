# Vide les journaux utilisés par le lab
$channels = @(
 "Microsoft-Windows-Sysmon/Operational",
 "Security",
 "Microsoft-Windows-PowerShell/Operational",
 "Windows PowerShell",
 "Microsoft-Windows-TaskScheduler/Operational",
 "Microsoft-Windows-Windows Defender/Operational"
)
foreach ($c in $channels) {
 wevtutil cl $c
 Write-Host "[+] Journal vidé : $c" -ForegroundColor Green
}
