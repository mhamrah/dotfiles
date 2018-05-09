
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


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"  # Added by n-install (see http://git.io/n-install-repo).
