
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
alias curl=" curl"
alias hey=" hey"
alias kubectl=" kubectl"
alias kc=" kubectl"
alias cleanup='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'


#alias kctx="kubectl config current-context"
alias tf=" terraform"
