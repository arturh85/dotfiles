# Autocomplete ssh config, https://gist.github.com/backerman/2c91d31d7a805460f93fe10bdfa0ffb0
using namespace System.Management.Automation
Register-ArgumentCompleter -CommandName ssh,scp,sftp -Native -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    $hosts = Get-Content $(Get-ChildItem -Path ${Env:HOMEPATH}\.ssh -Filter *config -Recurse).FullName `
    | Select-String -Pattern "^Host " `
    | ForEach-Object { $_ -replace "host ", "" -split " " } `
    | Sort-Object -Unique

    # For now just assume it's a hostname.
    $textToComplete = $wordToComplete
    $generateCompletionText = {
        param($x)
        $x
    }
    if ($wordToComplete -match "^(?<user>[-\w/\\]+)@(?<host>[-.\w]+)$") {
        $textToComplete = $Matches["host"]
        $generateCompletionText = {
            param($hostname)
            $Matches["user"] + "@" + $hostname
        }
    }

    $hosts `
    | Where-Object { $_ -like "${textToComplete}*" } `
    | ForEach-Object { [CompletionResult]::new((&$generateCompletionText($_)), $_, [CompletionResultType]::ParameterValue, $_) }
}