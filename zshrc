#zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/go/bin:$HOME/.local/bin:$PATH

ZSH_THEME="robbyrussell"
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  common-aliases
  docker
  docker-compose
  encode64
  history
  sudo
  kubectl
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  golang
  gcloud
  terraform
  fzf
  alias-tips
)

# TMUX Settings
#ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_FIXTERM=true

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=red'

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tf="terraform"
alias mk="microk8s.kubectl"
alias mi="microk8s.kubectl"
alias kctx="kubectx"
alias k="kubectl"
alias kns="kubens"
alias vim="TERM=xterm-256color vim"
alias gcca="gcloud config configurations activate"
alias gccc="gcloud config configurations create"
alias gccl="gcloud config configurations list"
alias gc="gcloud"
alias gk8sl="gcloud container clusters list"
alias gk8sgc="gcloud container clusters get-credentials --region us-central1"

export LESS="-F -X $LESS"

#export KUBECONFIG=$( ls -1 ~/Dropbox/k8s/**/kubeconfig | awk 'ORS=":"' ):~/.kube/config

# colors() {
#	for COLOR in {0..255}
# 	do
# 	    for STYLE in "38;5"
# 	    do
# 		TAG="\033[${STYLE};${COLOR}m"
# 		STR="${STYLE};${COLOR}"
# 		echo -ne "${TAG}${STR}${NONE}  "
# 	    done
# 	    echo
# 	done
# }

mcd() {
  command mkdir $1 && cd $1
}

#source ~/Dropbox/env
#source ~/Dropbox/aliases.sh

#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)

#    export SSH_AUTH_SOCK
#fi

function nlog() {
    kubectl -n applications get po -l app=$1 -o name | xargs -I {} sh -c "kubectl -n applications log {} -c $1;"
}

[ -s "$HOME/.zshrc-local" ] && source ~/.zshrc-local

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mhamrah/.gcloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mhamrah/.gcloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
#zprof
