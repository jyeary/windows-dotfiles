# Check to see if we are currently running "as Administrator"
#Requires -RunAsAdministrator

# Chocolatey
if ($null -eq (which cinst)) {
    Write-Host "Installing Chocolatey" -ForegroundColor "Yellow"
    Invoke-Expression (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
}

choco feature enable -n allowGlobalConfirmation

Write-Host "Installing applications" -ForegroundColor "Yellow"

# Applications
choco install 7zip --limit-output
choco install apache-netbeans.portable --limit-output
choco install cmder --limit-output
choco install dashlane --limit-output
choco install discord --limit-output
choco install firefox-dev --pre --limit-output
choco install git.install --params "/GitAndUnixToolsOnPath /NoAutoCrlf" --limit-output
choco install gradle --limit-output
choco install maven --limit-output
#choco install neovim --params "/NoNeovimOnPath" --limit-output
#choco install notepadplusplus --limit-output
choco install postman --limit-output
choco install powershell-core --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 REGISTER_MANIFEST=1"' --limit-output
choco install steam --limit-output
choco install vscode --limit-output
choco install zulu11 --limit-output

# TODO Move to an environment script?
# Set JAVA_HOME and PATH
[System.Environment]::SetEnvironmentVariable('JAVA_HOME','C:\Program Files\Zulu\zulu-11',[System.EnvironmentVariableTarget]::Machine)

RefreshEnv

Write-Host "Finished installing applications" -ForegroundColor "Yellow"

choco feature disable -n allowGlobalConfirmation
