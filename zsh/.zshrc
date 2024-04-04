# Path to oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Bat theme
export BAT_THEME="Visual Studio Dark+"

# Zsh theme
fpath+="${HOME}/.zsh/pure"
autoload -U promptinit; promptinit
prompt pure
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_CURSOR="block"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  git
  rails
  rbenv
  ruby
  # vi-mode
)

# Preferred editor
export EDITOR="nvim"

# Load oh-my-zsh
source "${ZSH}/oh-my-zsh.sh"

# Turn off annoying beep sound
unsetopt BEEP

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

# go
export PATH="${PATH}:/usr/local/go/bin"
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# virtualenv
export PATH="${PATH}:${HOME}/.local/bin"

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="${PATH}:${PNPM_HOME}"

# nnn
alias nnn="nnn -e -H -A -d -o"
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# Deno
export DENO_INSTALL="${HOME}/.deno"
export PATH="${PATH}:${DENO_INSTALL}/bin"

# Deno completion
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

# rbenv
eval "$(~/.rbenv/bin/rbenv init - zsh)"

# diff-so-fancy
export PATH="${PATH}:${HOME}/diff-so-fancy"

# terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# nvim
export PATH="${PATH}:${HOME}/nvim-linux64/bin"
