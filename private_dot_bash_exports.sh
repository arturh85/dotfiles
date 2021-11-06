export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/snap/bin:$PATH"
export EXA_COLORS="da=1;34"
export EDITOR="nvim"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
