#!/bin/zsh
setopt extendedglob

ANTIGEN_FILE="$HOME/.config/antigen.zsh"

if ! [ -f "$ANTIGEN_FILE" ]; then
  echo '# Downloading antigen...'
  curl -sL 'git.io/antigen' > "$ANTIGEN_FILE"
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
#THEME=denysdovhan/spaceship-prompt
THEME=dst
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function gi() { curl -sLw "\n" https://www.gitignore.io/api/$@ ;}
function fm() { pcmanfm-qt $@ > /dev/null 2>&1 &; sleep 1; disown }
function get_color() {
  [[ "$1" =~ '^[0-9]+$' ]] \
    && export SEARCH="\\*color$1" \
    || export SEARCH="$1"
  xrdb -query | grep -iPo "$SEARCH:\\s*\\K\\#[[:alnum:]]*" | head -n1
}

#alias ls=lsd
alias ls='ls --color -hF'
alias l='ls -lF'
alias la='ls -AF'
alias ll='ls -lF'
alias lla='ls -lAF'
alias lt='tree'
alias rm=trash
alias mt='sudo mount'
alias ut='sudo umount'
alias rt='python3 $HOME/source/rescuetime/main.py -w 250 --multiplier 1.33'
[ "$(lsb_release -i 2 > /dev/null | grep -i 'debian')" ] && alias fd='fdfind'

# BSPWM aliases
alias bspcfg='nvim $HOME/.config/bspwm/bspwmrc'
alias sxkcfg='nvim $HOME/.config/sxhkd/sxhkdrc'

# Pacman aliases
alias pi='sudo pacman -S'
alias pis='yay -Ss'
alias yi='yay -S'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
