if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

GIT_PS1_SHOWUPSTREAM="verbose"

export EDITOR='vim'
export VISUAL='vim'
source $HOME/.dotfiles/bash/env.sh
source $HOME/.dotfiles/bash/aliases.sh
source $HOME/.dotfiles/bash/path.sh

if [ -f ~/Dropbox/Trunk/alias.sh ]; then
  source ~/Dropbox/Trunk/alias.sh
fi

source /usr/local/share/zsh/site-functions/_aws

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
function ox {
  open ${@:-'.'}
}
alias o=ox

function mcd {
  mkdir -p "$1" && cd "$1"
}

unsetopt correct_all

alias curl='noglob curl'

