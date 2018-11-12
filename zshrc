if [[ -z "$TMUX" ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
    tmux new-session -A -s "$USER"
fi

which gexpr &> /dev/null
if [[ $? -eq 0 ]]; then
  alias stat="gstat"
  alias expr="gexpr"
fi

################################
autoload -Uz compinit
if [[ $(expr  $(date '+%s') - $(stat -c '%Z' ~/.zcompdump)) -gt 86400 ]]
then
  rm ~/.zcompdump
  compinit -C
else
  compinit -u -d ~/.zcompdump
fi

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   source ~/dotfiles/zsh_plugins.sh
   alias ls="ls --color=auto"
   eval $( dircolors -b ~/dotfiles/LS_COLORS )
   ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
elif [[ "$unamestr" == 'Darwin' ]]; then
   source ~/dotfiles/zsh_plugins_osx.sh
   alias ls="ls -G"
   PATH=$PATH:/Users/mhamrah/Library/Python/2.7/bin
   export GOPATH=~/go
fi

test -e "$HOME/dotfiles/zcustom.sh" && source "$HOME/dotfiles/zcustom.sh"

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"

 zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
 zstyle ':completion:*' list-colors ''
 zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
 zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mhamrah/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mhamrah/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mhamrah/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mhamrah/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mhamrah/.sdkman"
[[ -s "/home/mhamrah/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mhamrah/.sdkman/bin/sdkman-init.sh"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

#export LIBGL_ALWAYS_INDIRECT=1
#export DISPLAY=:0.0

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mhamrah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mhamrah/google-cloud-sdk/completion.zsh.inc'; fi

# Keychain
eval `/usr/bin/keychain -q --eval --agents ssh id_rsa `
#source $HOME/.keychain/$HOST-sh

export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
