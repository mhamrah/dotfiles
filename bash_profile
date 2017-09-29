source ~/dotfiles/bash/prompt.sh

if [ -f ~/Dropbox/Trunk/alias.sh ]; then
  source ~/Dropbox/Trunk/alias.sh
fi

#set vi mode
set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
  source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi

# The next line enables bash completion for gcloud.
if [ -f /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ]; then
  source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

