################################
autoload -U compinit && compinit
zmodload -i zsh/complist

################################
export GOPATH=~/go
export TILLER_NAMESPACE=default

test -e "$HOME/.zshrc_win" && source "$HOME/.zshrc_win"

################################
# Path
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/bin

################################
# Startup Scripts
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/dotfiles/zsh_plugins.sh

################################
# Options
setopt AUTO_CD
setopt INC_APPEND_HISTORY_TIME
setopt PROMPT_SUBST
unsetopt BG_NICE

export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE=~/.zhistory
export EDITOR=vim

################################
# Config
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

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
#alias git="hub"
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

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh" --no-use

# tabtab source fo#r serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mhamrah/.nvm/versions/node/v6.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mhamrah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc'; fi

test -e "$HOME/.zshrc_win" && source "$HOME/.zshrc_win"