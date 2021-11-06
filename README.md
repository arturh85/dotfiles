Prerequisites
-------------

## [oh-my-posh](https://ohmyposh.dev/docs/linux)

```
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/bin/oh-my-posh
chmod +x ~/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```

## Rust commandline tools

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install zenith exa bat fd-find procs du-dust sd ripgrep
```

Install
-------

`$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply arturh85`


Credits
-------

- [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

