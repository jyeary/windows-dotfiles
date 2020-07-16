# windows-dotfiles
My personal dotfiles for Windows

**NOTE:** Use at your own risk if you don't understand what the files are doing. This is a Work In Progress (WIP)

## Installation
1. Open an Administrative PowerShell

2. You must set the following in Powershell to execute scripts.
    ```
    Set-ExecutionPolicy Bypass -Scope Process -Force
    ```
3. Run `bootstrap.ps1` script.

## Add Applications with Chocolatey

Run `choco-install-apps.ps1` script.

## Set Windows Defaults

Run `windows.ps1` script.

## Git Credentials

I am using a script as shown below called `git-crendentials.ps1` to set up my git configuration. It is not included in files because I don't want people checking in code with my information. Please modify it to suit your needs.

```powershell
# Git credentials
$env:GIT_AUTHOR_NAME="jyeary"
$env:GIT_COMMITTER_NAME=$env:GIT_AUTHOR_NAME
git config --global user.name $env:GIT_AUTHOR_NAME
$env:GIT_AUTHOR_EMAIL="johnyeary@gmail.com"
$env:GIT_COMMITTER_EMAIL=$env:GIT_AUTHOR_EMAIL
git config --global user.email $env:GIT_AUTHOR_EMAIL
```