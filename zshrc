source $HOME/.dotfiles/antigen/antigen.zsh


antigen bundle olivierverdier/zsh-git-prompt

#antigen use oh-my-zsh
#antigen bundle sorin-ionescu/prezto
antigen bundle git
#antigen bundle zsh-users/zsh-syntax-highlighting

#antigen bundle brew
#antigen bundle brew-cask
#antigen bundle gem
#antigen bundle osx

#antigen bundle node
#antigen bundle npm
#antigen bundle bower
#antigen bundle bundler
#antigen bundle common-aliases
#antigen bundle docker
#antigen bundle git-extras
#antigen bundle git_remote_branch
#antigen bundle github
antigen bundle jump
#antigen bundle redis-cli
#antigen bundle sbt
#antigen bundle scala
#antigen bundle tmux
#antigen bundle vagrant

#antigen theme fox
antigen apply

#source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-olivierverdier-SLASH-zsh-git-prompt.git/zshrc.sh

ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"

PROMPT='%{$fg[cyan]%}%~${fg[white]%} $(git_super_status) %# '

source $HOME/.dotfiles/bash/env.sh
source $HOME/.dotfiles/bash/aliases.sh
source $HOME/.dotfiles/bash/path.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
