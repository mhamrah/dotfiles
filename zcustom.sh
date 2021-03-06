
################################
export TILLER_NAMESPACE=default

source ~/dotfiles/aliases.sh

#
# Opts
setopt AUTO_CD
setopt INC_APPEND_HISTORY_TIME
setopt PROMPT_SUBST
unsetopt BG_NICE

export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE=~/.zhistory
export EDITOR=vim


################################
# Path
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$PATH:$HOME/bin

################################
# Config
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

################################
# Functions
 colors() {
	for COLOR in {0..255}
	do
	    for STYLE in "38;5"
	    do
		TAG="\033[${STYLE};${COLOR}m"
		STR="${STYLE};${COLOR}"
		echo -ne "${TAG}${STR}${NONE}  "
	    done
	    echo
	done
}

mcd() {
  command mkdir $1 && cd $1
}

lox() {
 sudo ifconfig lo0 alias 127.0.0.3 up && sudo ifconfig lo0 alias 127.0.0.2 up
}

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=red'

test -e "$HOME/.zshrc_win" && source "$HOME/.zshrc_win"
PATH=$PATH:$GOPATH/bin
PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

if [ $commands[kubectl] ]; then
      #source <(kubectl completion zsh)
fi

export KUBECONFIG=$( ls -1 ~/.k8s/**/kubeconfig | awk 'ORS=":"' )

namelyconfig() {
     k8s-configurator generate manifests/config.yml production > manifests/cm-production.yml
     k8s-configurator generate manifests/config.yml stage > manifests/cm-stage.yml
     k8s-configurator generate manifests/config.yml int > manifests/cm-int.yml
}
