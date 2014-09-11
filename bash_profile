
source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/completion.sh

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/prompt.sh

if [ -f ~/Dropbox/Trunk/alias.sh ]; then
  source ~/Dropbox/Trunk/alias.sh
fi

#set vi mode
set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
source '/Users/mhamrah/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/mhamrah/google-cloud-sdk/completion.bash.inc'
