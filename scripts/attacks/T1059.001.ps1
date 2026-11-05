# PowerShell encodé : simulation des 3 variantes
$cmd = 'Write-Host "Detection lab test"; Get-Process | Select-Object -First 3'
$enc = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($cmd))

# Variante 1 : paramètre complet
powershell.exe -NoProfile -EncodedCommand $enc
# Variante 2 : abréviations + fenêtre cachée
Start-Process powershell.exe -ArgumentList "-NoP -NonI -W Hidden -enc $enc" -Wait
# Variante 3 : lancé depuis cmd.exe (chaîne type macro Office)
cmd.exe /c "powershell.exe -ec $enc"