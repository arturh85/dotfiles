. $PSScriptRoot\functions.ps1

# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}

### Update Help for Modules
Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force


### Package Providers
Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null
# Chocolatey Provider is not ready yet. Use normal Chocolatey
#Get-PackageProvider Chocolatey -Force
#Set-PackageSource -Name chocolatey -Trusted


### Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module PSReadLine -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force


### Chocolatey
Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"
if ((which cinst) -eq $null) {
    iex (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
    Refresh-Environment
    choco feature enable -n=allowGlobalConfirmation
}

# system and cli
choco install 7zip.install        --limit-output
choco install awscli              --limit-output
choco install chezmoi             --limit-output
choco install curl                --limit-output
choco install cmake               --limit-output
choco install llvm                --limit-output
choco install composer            --limit-output
choco install coretemp            --limit-output
choco install cpu-z               --limit-output
choco install cuda                --limit-output
choco install ditto               --limit-output
choco install everything          --limit-output
choco install ferdi               --limit-output
choco install nuget.commandline   --limit-output
choco install webpi               --limit-output
choco install git.install         --limit-output -params '"/GitAndUnixToolsOnPath /NoShellIntegration"'
choco install nodejs              --limit-output
choco install python3             --limit-output
choco install neovim              --limit-output
choco install neovide             --limit-output
choco install php                 --limit-output
choco install sysinternals        --limit-output
choco install teamviewer          --limit-output
choco install vlc                 --limit-output
choco install jq                  --limit-output
choco install vscode.install      --limit-output
choco install wget                --limit-output

# browsers
choco install GoogleChrome        --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output
choco install Firefox             --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output


Refresh-Environment

### Windows Features
Write-Host "Installing Windows Features..." -ForegroundColor "Yellow"
# WSL  Configuration
Enable-WindowsOptionalFeature -Online -All -FeatureName `
    "Containers", `
    "Microsoft-Windows-Subsystem-Linux" `
    -NoRestart | Out-Null


# IIS Base Configuration
# Enable-WindowsOptionalFeature -Online -All -FeatureName `
#     "IIS-BasicAuthentication", `
#     "IIS-DefaultDocument", `
#     "IIS-DirectoryBrowsing", `
#     "IIS-HttpCompressionDynamic", `
#     "IIS-HttpCompressionStatic", `
#     "IIS-HttpErrors", `
#     "IIS-HttpLogging", `
#     "IIS-ISAPIExtensions", `
#     "IIS-ISAPIFilter", `
#     "IIS-ManagementConsole", `
#     "IIS-RequestFiltering", `
#     "IIS-StaticContent", `
#     "IIS-WebSockets", `
#     "IIS-WindowsAuthentication" `
#     -NoRestart | Out-Null

# # ASP.NET Base Configuration
# Enable-WindowsOptionalFeature -Online -All -FeatureName `
#     "NetFx3", `
#     "NetFx4-AdvSrvs", `
#     "NetFx4Extended-ASPNET45", `
#     "IIS-NetFxExtensibility", `
#     "IIS-NetFxExtensibility45", `
#     "IIS-ASPNET", `
#     "IIS-ASPNET45" `
#     -NoRestart | Out-Null

# Web Platform Installer for remaining Windows features
# webpicmd /Install /AcceptEula /Products:"UrlRewrite2"

### Node Packages
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
if (which npm) {
    npm update npm
    npm install -g npm-check-updates
}

