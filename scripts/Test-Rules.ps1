# Applique toutes les règles du dépôt sur un dossier d'EVTX
param([Parameter(Mandatory = $true)][string]$EvtxPath) # ex : Z:\evtx\attack\T1105
$cs = "C:\Lab\tools\chainsaw"
& "$cs\chainsaw.exe" hunt $EvtxPath `
 -s "Z:\rules" `
 --mapping "$cs\mappings\sigma-event-logs-all.yml" 