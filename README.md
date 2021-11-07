My personal dotfiles managed by [chezmoi](https://www.chezmoi.io/) with similar [oh-my-posh prompt](https://ohmyposh.dev/docs/linux) & aliases for Windows & Linux.

![Screenshot with Windows Terminal](screenshot.png?raw=true "Screenshot with Windows Terminal")

Prerequisites
-------------

### Coding Font

My favorite font is [CascadiaCode](https://www.nerdfonts.com/font-downloads) which should be set as the terminal font for everything to look right.

Install for Linux
-------------------

- `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply arturh85`

Install for Windows
-------------------

- `Set-ExecutionPolicy AllSigned or Set-ExecutionPolicy Bypass -Scope Process`
- `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
- `choco install chezmoi`
- `chezmoi init --apply arturh85`

Credits
-------

- [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

