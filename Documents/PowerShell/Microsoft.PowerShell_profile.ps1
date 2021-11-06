. $PSScriptRoot\functions.ps1
. $PSScriptRoot\ssh-autocomplete.ps1
. $PSScriptRoot\aliases.ps1
. $PSScriptRoot\exports.ps1

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Import-Module -Name Terminal-Icons
    Import-Module -Name PSWindowsUpdate
}

oh-my-posh --init --shell pwsh --config $HOME\.config\ohmyposh\config.json | Invoke-Expression
Clear-Host # prompt looks broken initially without cls
