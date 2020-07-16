# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1

Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null

###############################################################################
### Privacy                                                                   #
###############################################################################
Write-Host "Configuring Privacy..." -ForegroundColor "Yellow"

# General: Don't let apps use advertising ID for experiences across apps: Allow: 1, Disallow: 0
if (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Type Folder | Out-Null}
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Id" -ErrorAction SilentlyContinue


# General: Disable suggested content in settings app: Enable: 1, Disable: 0

# Show "Suggestions Occasionally in Start in Windows 10
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338388Enabled" 0
# Show "Get Even More Out of Windows"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338389Enabled" 0



###############################################################################
### Explorer, Taskbar, and System Tray                                        #
###############################################################################
Write-Host "Configuring Explorer, Taskbar, and System Tray..." -ForegroundColor "Yellow"

# Explorer: Show hidden files by default: Show Files: 1, Hide Files: 2
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1

# Explorer: Show file extensions by default
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

# Explorer: Show path in title bar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath" 1

# Taskbar: Don't show Windows Store Apps on Taskbar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "StoreAppsOnTaskbar" 0

# Taskbar: Disable Cortana
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0

###############################################################################
### Uninstall Default Applications                                            #
###############################################################################

# The files can be listed with the following command  Get-AppxPackage -AllUsers | Select Name, PackageFullName

# Uninstall Candy Crush Friends
Get-AppxPackage "king.com.CandyCrushFriends" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "king.com.CandyCrushFriends" | Remove-AppxProvisionedPackage -Online

# Uninstall Farm Heros Saga
Get-AppxPackage "king.com.FarmHeroesSaga" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "king.com.FarmHeroesSaga" | Remove-AppxProvisionedPackage -Online

# Uninstall Booking.com
Get-AppxPackage "PricelinePartnerNetwork.Booking.comUSABigsavingson" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "PricelinePartnerNetwork.Booking.comUSABigsavingson" | Remove-AppxProvisionedPackage -Online

# Unistall Simple Solitare
Get-AppxPackage "26720RandomSaladGamesLLC.SimpleSolitaire" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "26720RandomSaladGamesLLC.SimpleSolitaire" | Remove-AppxProvisionedPackage -Online

# Uninstall NetFlix
Get-AppxPackage "4DF9E0F8.Netflix" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "4DF9E0F8.Netflix" | Remove-AppxProvisionedPackage -Online

# Uninstall McAfee Security
Get-AppxPackage "5A894077.McAfeeSecurity" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "5A894077.McAfeeSecurity" | Remove-AppxProvisionedPackage -Online

# Uninstall Wild Tangent Games
Get-AppxPackage "WildTangentGames.63435CFB65F55" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "WildTangentGames.63435CFB65F55" | Remove-AppxProvisionedPackage -Online

# Uninstall Amazon
Get-AppxPackage "Amazon.com.Amazon" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Amazon.com.Amazon" | Remove-AppxProvisionedPackage -Online

# Uninstall Dropbox Promotion
Get-AppxPackage "C27EB4BA.DropboxOEM" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "C27EB4BA.DropboxOEM" | Remove-AppxProvisionedPackage -Online

# Uninstall Spotify
Get-AppxPackage "SpotifyAB.SpotifyMusic" -AllUsers | Remove-AppxPackage
Get-AppXProvisionedPackage -Online | Where DisplayName -like "SpotifyAB.SpotifyMusic" | Remove-AppxProvisionedPackage -Online

