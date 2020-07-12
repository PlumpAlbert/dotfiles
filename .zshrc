#!/bin/zsh
setopt extendedglob

ANTIGEN_FILE="$HOME/.config/antigen.zsh"

if [ -f "$ANTIGEN_FILE" ]; then
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
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function gi() { curl -sLw "\n" https://www.gitignore.io/api/$@ ;}
function fm() { pcmanfm-qt $@ > /dev/null 2>&1 &; sleep 1; disown }

