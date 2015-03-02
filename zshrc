#source $HOME/.dotfiles/antigen/antigen.zsh

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


#antigen use oh-my-zsh
#
#antigen use prezto
#antigen bundles <<EOBUNDLES

#git
#gitfast
#zsh-users/zsh-syntax-highlighting

#brew
#brew-cask
#gem
#osx

#node
#npm
#bower
#bundler
#common-aliases
#docker
#git-extras
#github
#jump
#redis-cli
#sbt
#scala
#tmux
#vagrant

#olivierverdier/zsh-git-prompt
#zsh-users/zsh-completions

#EOBUNDLES

#antigen theme sorin
#antigen apply

#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=" ⚑"
#ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
GIT_PS1_SHOWUPSTREAM="verbose"
#setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
#PROMPT='%{$fg[cyan]%}%~${fg[white]%} $(git_super_status) %# '

export EDITOR='vim'
export VISUAL='vim'
source $HOME/.dotfiles/bash/env.sh
source $HOME/.dotfiles/bash/aliases.sh
source $HOME/.dotfiles/bash/path.sh

if [ -f ~/Dropbox/Trunk/alias.sh ]; then
  source ~/Dropbox/Trunk/alias.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
function o {
  open ${@:-'.'}
}

function mcd {
  mkdir -p "$1" && cd "$1"
}


