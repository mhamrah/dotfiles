if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#GIT_PS1_SHOWUPSTREAM="verbose"
#PURE_GIT_PULL=0
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
unsetopt correct
setopt clobber
#DISABLE_CORRECTION="true" 
alias curl='noglob curl'


# added by newengsetup
export EDITOR=vim
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="mlh@uber.com"
export VAGRANT_DEFAULT_PROVIDER=aws
[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
[ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

cdsync () {
    cd $(boxer sync_dir $@)
}
editsync () {
    $EDITOR $(boxer sync_dir $@)
}
opensync () {
    open $(boxer sync_dir $@)
}

