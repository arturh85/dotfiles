#!/bin/bash

mkdir -p ~/bin

# oh-my-posh
if [ ! -f ~/bin/oh-my-posh ]; then
	echo "Installing oh-my-posh..."
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/bin/oh-my-posh
	chmod +x ~/bin/oh-my-posh 
fi

# rust
if ! command -v cargo ; then
	echo "Installing Rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source ~/.cargo/env
fi

# cli tools
if ! command -v zenith ; then
	echo "Installing zenith..."
	cargo install zenith -q
fi
if ! command -v exa ; then
	echo "Installing exa..."
	cargo install exa -q
fi
if ! command -v bat ; then
	echo "Installing bat..."
	cargo install bat -q
fi
if ! command -v fd ; then
	echo "Installing fd..."
	cargo install fd-find -q
fi
if ! command -v procs ; then
	echo "Installing procs..."
	cargo install procs -q
fi
if ! command -v dust; then
	echo "Installing dust..."
	cargo install du-dust -q
fi
if ! command -v sd; then
	echo "Installing sd..."
	cargo install sd -q
fi
if ! command -v ripgrep; then
	echo "Installing ripgrep..."
	cargo install ripgrep -q
fi
