#!/bin/zsh
setopt extendedglob

ANTIGEN_FILE="$HOME/.config/antigen.zsh"

if ! [ -f "$ANTIGEN_FILE" ]; then
  curl -L 'git.io/antigen' > "$ANTIGEN_FILE"
fi
source "$ANTIGEN_FILE"
antigen reset
antigen use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
THEME=romkatv/powerlevel10k
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function gi() { curl -sLw "\n" https://www.gitignore.io/api/$@ ;}
function fm() { pcmanfm-qt $@ > /dev/null 2>&1 &; sleep 1; disown }

alias ls=lsd
alias l='ls -lF'
alias la='ls -AF'
alias ll='ls -lF --total-size'
alias lla='ls -lAF --total-size'
alias lt='ls --tree'
alias llt='l --tree'
alias rm=trash
alias mt='sudo mount'
alias ut='sudo umount'
alias rt='python $HOME/projects/rescuetime/main.py -w 250 --multiplier 1.33'

# Pacman aliases
alias pi='sudo pacman -S'
alias pis='yay -Ss'
alias yi='yay -S'
