if status is-interactive
  set fish_greeting
  
  set -gx PATH "$HOME/.cargo/bin:$PATH"
  set -gx PATH "/snap/bin:$PATH"
  set -gx EXA_COLORS "da=1;34"
  set -gx EDITOR "nvim"

  source ~/.bash_aliases.sh
  if test -f ~/.bash_aliases_local.sh
    source ~/.bash_aliases_local.sh
  end
  oh-my-posh --init --shell fish --config ~/.ohmyposh.json | source
end
