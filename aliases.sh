
################################
# Aliases
alias la="ls -lahF"
alias lf="ls -lhF"
alias t="tail -f"
alias fd='find . -type d -name'
alias ff='find . -type f -name'

#alias vim="nvim"
alias startup="/usr/bin/time /usr/local/bin/zsh -i -c exit"
alias cfg="vim ~/.zshrc"
alias g="git"
alias gc="git add . && git commit -am"
alias dm="docker-machine"
alias dc="docker-compose"
alias ...="cd ../.."
alias ....="cd ../../.."
alias curl="noglob curl"
alias hey="noglob hey"
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
