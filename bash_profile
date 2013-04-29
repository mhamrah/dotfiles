[[ -s "/Users/Michael/.rvm/scripts/rvm" ]] && source "/Users/Michael/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/completion.sh

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/prompt.sh



#function parse_git_dirty {
#  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
#}

#function parse_git_branch {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo " ("${ref#refs/heads/}$(parse_git_dirty)")"
#  }


