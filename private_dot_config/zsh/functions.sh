g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}


update() {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo npm install npm -g --loglevel error
    sudo npm update -g --loglevel error
    rustup update
    cargo install-update --all
}
