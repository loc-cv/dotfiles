# sourced from $HOME/.zshrc
# ==========

# path to oh-my-zsh installation.
# ----------
export ZSH=$HOME/.oh-my-zsh

# bat theme
# ----------
export BAT_THEME="TwoDark"

# disable auto-setting terminal title.
# ----------
DISABLE_AUTO_TITLE="true"

# enable command auto-correction.
# ----------
ENABLE_CORRECTION="true"

# plugins
# ----------
plugins=(
    git
    # vi-mode
)

# zsh theme
# ----------
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_CURSOR="block"

# load oh-my-zsh
# ----------
source $ZSH/oh-my-zsh.sh

# preferred editor for local and remote sessions
# ----------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# nvm
# ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
# ----------
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# virtualenv
# ----------
export PATH=$PATH:/home/colcv/.local/bin
