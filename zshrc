################################
autoload -U compinit && compinit
zmodload -i zsh/complist

################################
export GOPATH=~/dev/go
export TILLER_NAMESPACE=default
export PLATFORM=~/dev/platform

################################
# Path
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:~/Library/Python/3.6/bin
PATH=$PATH:/Users/mhamrah/personal-scratch/istio-0.5.1/bin

################################
# Startup Scripts
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

eval "$(fasd --init auto)"

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle Tarrasch/zsh-colors
antibody bundle zsh-users/zsh-completions
antibody bundle caarlos0/ports
antibody bundle junegunn/fzf
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search

################################
# Options
setopt AUTO_CD
#setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt PROMPT_SUBST

export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE=~/.zhistory
export EDITOR=nvim

################################
# Config
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

################################
# Aliases
alias vim="nvim"
alias s="source ~/.zshrc"
alias startup="/usr/bin/time /usr/local/bin/zsh -i -c exit"
alias cfg="vim ~/.zshrc"
alias g="git"
alias gc="git add . && git commit -am"
alias dm="docker-machine"
alias dc="docker-compose"
alias git="hub"
alias kubectl="noglob kubectl"
alias kc="noglob kubectl"
alias cleanup='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

alias kprod="KUBECONFIG=~/.namely-k8s/kube-aws-prod/kubeconfig kubectl"
alias kstage="KUBECONFIG=~/.namely-k8s/kube-aws-staging/kubeconfig kubectl"
alias kint="KUBECONFIG=~/.namely-k8s/kube-aws-int/kubeconfig kubectl"
alias knint="KUBECONFIG=~/.namely-k8s/new-kube-aws-int/kubeconfig kubectl"
alias knstage="KUBECONFIG=~/.namely-k8s/new-kube-aws-stage/kubeconfig kubectl"
alias knprod="KUBECONFIG=~/.namely-k8s/new-kube-aws-prod/kubeconfig kubectl"
alias kops="KUBECONFIG=~/.namely-k8s/kube-aws-ops/kubeconfig kubectl"
alias kctx="kubectl config current-context"
alias tf="noglob terraform"

################################
# Git prompt
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' formats "%F{218}%b%f %m%F{228}%u%f%F{128}%c%f "
# zstyle ':vcs_info:*' actionformats "%b (%a) %m%u%c "
# zstyle ':vcs_info:*' patch-format '%10>...>%p%<< (%n applied)'
# zstyle ':vcs_info:*' check-for-changes true

# precmd() { vcs_info }

################################
# Prompt
# PROMPT="%F{117}%~%f %F{104}$%f "
# RPROMPT='${vcs_info_msg_0_}%F{187}%*%f %F{110}%m'

################################
# Functions
function colors() {
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

function mcd() {
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


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mhamrah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc'; fi
