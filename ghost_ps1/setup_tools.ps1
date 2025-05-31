# Description: Setup tools for development and regular use. It always need update for version changing 
# Following packages will be installed
# Git.Git # git
# Notepad++.Notepad++ # notepad++
# Microsoft.PowerShell # updated powershell version
# AnyDesk.AnyDesk # anydesk for remote access
# Microsoft.VisualStudioCode # vscode
# Python.Python.3.12 # python
# Microsoft.WindowsTerminal # terminal for windows to handle mulitple powershell windows.


$pkgs = @(
    'Git.Git', 
    'Notepad++.Notepad++', 
    'Microsoft.PowerShell', 
    'AnyDesk.AnyDesk', 
    'Microsoft.VisualStudioCode', 
    'Python.Python.3.12', 
    'Microsoft.WindowsTerminal'
)


$installedApps = winget list
$cnt = 0
$ncnt = 0

foreach ($pkg in $pkgs) {
    if ($installedApps | Select-String -Pattern $pkg -SimpleMatch) {
        Write-Host "$pkg is installed"
        $cnt += 1
    }
    else {
        winget install $pkg
        $ncnt += 1
    }
}

write-host "$ncnt newly installed and $cnt already installed!"