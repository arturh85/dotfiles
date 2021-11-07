My personal dotfiles managed by [chezmoi](https://www.chezmoi.io/) with similar [oh-my-posh prompt](https://ohmyposh.dev/docs/linux) & aliases for Windows & Linux.

![Screenshot with Windows Terminal](screenshot.png?raw=true "Screenshot with Windows Terminal")

Prerequisites
-------------

### Coding Font

My favorite font is [CascadiaCode](https://www.nerdfonts.com/font-downloads) which should be set as the terminal font for everything to look right.


### oh-my-posh

```
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/bin/oh-my-posh
chmod +x ~/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```

### Rust commandline tools

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install zenith exa bat fd-find procs du-dust sd ripgrep
```

### Chocolatey (Windows only)

see [install instructions](https://chocolatey.org/install)

Install
-------

`$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply arturh85`


Credits
-------

- [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

