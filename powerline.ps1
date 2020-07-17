$tempDir = Join-Path $env:TEMP "fonts"
git clone https://github.com/powerline/fonts.git  --depth=1 $tempDir
& $tempDir"\install.ps1"
Remove-Variable tempDir