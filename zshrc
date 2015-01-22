source $HOME/.dotfiles/antigen/antigen.zsh


#antigen use oh-my-zsh
#
antigen use prezto
antigen bundles <<EOBUNDLES

#git
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

EOBUNDLES

#antigen theme fox
antigen apply

ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"

PROMPT='%{$fg[cyan]%}%~${fg[white]%} $(git_super_status) %# '

#source $HOME/.dotfiles/bash/env.sh
#source $HOME/.dotfiles/bash/aliases.sh
#source $HOME/.dotfiles/bash/path.sh


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
