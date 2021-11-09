. $PSScriptRoot\functions.ps1
. $PSScriptRoot\ssh-autocomplete.ps1
. $PSScriptRoot\aliases.ps1
. $PSScriptRoot\exports.ps1

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
if ($host.Name -eq 'ConsoleHost')
{
    Set-PSReadLineOption -Colors @{ InlinePrediction = '#000055'}
    Set-PSReadLineKeyHandler -chord Ctrl+o -function {ViForwardChar}
    Import-Module PSReadLine

    Import-Module -Name Terminal-Icons
    Import-Module -Name PSWindowsUpdate
}

Set-PoshPrompt -Theme $HOME\.config\ohmyposh\config.json
Clear-Host # prompt looks broken initially without cls
