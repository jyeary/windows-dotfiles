# Check to see if we are currently running "as Administrator"
#Requires -RunAsAdministrator

# Chocolatey
#Write-Host "Installing Chocolatey" -ForegroundColor "Yellow"
#Set-ExecutionPolicy Bypass -Scope Process -Force
#[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
#iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation

Write-Host "Installing applications" -ForegroundColor "Yellow"

# Base Applications
choco install powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1"'
choco install  git.install --params "/GitAndUnixToolsOnPath /NoAutoCrlf"
choco install cmder
choco install vscode

# Applications
choco install zulu11
choco install apache-netbeans.portable
choco install maven
choco install 7zip
choco install steam
choco install discord
choco install postman
#choco install notepadplusplus
#choco install neovim --params "/NoNeovimOnPath"

Write-Host "Finished installing applications" -ForegroundColor "Yellow"

choco feature disable -n allowGlobalConfirmation
