# Windows Detection Engineering Lab
 
Projet de detection engineering sur Windows : simulation de techniques d'attaque MITRE ATT&CK dans une machine virtuelle, puis écriture de règles **Sigma** pour les détecter à partir des journaux Windows.
 
## Techniques couvertes
 
| Technique ATT&CK | Description |
|---|---|
| [T1059.001](https://attack.mitre.org/techniques/T1059/001/) | Exécution de PowerShell avec une commande encodée en Base64 |
| [T1105](https://attack.mitre.org/techniques/T1105/) | Téléchargement de fichier avec `certutil.exe` |
| [T1562.001](https://attack.mitre.org/techniques/T1562/001/) | Désactivation de Microsoft Defender |
| [T1053.005](https://attack.mitre.org/techniques/T1053/005/) | Persistance par tâche planifiée |
| [T1003.001](https://attack.mitre.org/techniques/T1003/001/) | Dump de la mémoire du processus LSASS |
 
## Contenu du dépôt
 
```
detection-lab/
├── rules/windows/        Règles de détection au format Sigma
├── evtx/
│   ├── attack/           Journaux Windows enregistrés pendant les attaques
│   └── benign/           Journaux d'activité légitime, pour tester les faux positifs
├── docs/
│   ├── detections/       Une fiche par technique : télémétrie, logique de la règle, limites
│   └── img/              Captures d'écran
├── scripts/
│   ├── Clear-LabLogs.ps1     Vide les journaux avant un test
│   ├── Export-LabLogs.ps1    Exporte les journaux au format .evtx
│   ├── Test-Rules.ps1        Applique les règles Sigma sur des fichiers .evtx
│   └── attacks/              Scripts de simulation des attaques
└── .github/workflows/    Validation automatique des règles
```
 
## Environnement
 
- **VirtualBox** avec une VM **Windows 11 Enterprise** (version d'évaluation)
- **Sysmon**, avec la configuration [sysmon-modular](https://github.com/olafhartong/sysmon-modular)
- **PowerShell Script Block Logging** et stratégie d'audit Windows
- **[Atomic Red Team](https://github.com/redcanaryco/atomic-red-team)** pour simuler les attaques
- **[Chainsaw](https://github.com/WithSecureLabs/chainsaw)** pour appliquer les règles Sigma sur les journaux
- **[sigma-cli](https://github.com/SigmaHQ/sigma-cli)** pour valider et convertir les règles
## Utilisation
 
Appliquer les règles sur les journaux d'une technique :
 
```powershell
chainsaw hunt evtx/attack/T1105 -s rules --mapping mappings/sigma-event-logs-all.yml
```
 
Valider la syntaxe des règles :
 
```bash
pip install sigma-cli
sigma check rules/
```
 
**Auteur** : [Michaël Adda](https://www.linkedin.com/in/michaël-adda) · Étudiant en dernière année, à la recherche d'un stage de fin d'études en cybersécurité défensive.
 
