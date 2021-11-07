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
}
