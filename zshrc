################################
# Exported Environment Variables
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="mlh@uber.com"
export UBER_LDAP_UID="mlh"
export GOPATH=~/go2

################################
# Path
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/bin
################################
# Startup Scripts
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

autoload -Uz compinit && compinit
autoload -Uz vcs_info

export _ANTIGEN_CACHE_ENABLED=true
source ~/antigen/antigen.zsh
antigen init ~/dotfiles/antigen/antigen.rc


################################
# Options
setopt AUTO_CD
setopt SHARE_HISTORY
setopt PROMPT_SUBST

export SAVEHIST=5000
export HISTSIZE=10000
export HISTFILE=~/.zhistory
export EDITOR=nvim


################################
# Config
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

################################
# Aliases
alias vim="nvim"
alias s="source ~/.zshrc"
alias startup="/usr/bin/time /usr/local/bin/zsh -i -c exit"
alias cfg="vim ~/.zshrc"
alias g="git"
alias gc="git add . && git commit -am"

################################
# Git prompt
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{218}%b%f %m%F{228}%u%f%F{128}%c%f "
zstyle ':vcs_info:*' actionformats "%b (%a) %m%u%c "
zstyle ':vcs_info:*' patch-format '%10>...>%p%<< (%n applied)'
zstyle ':vcs_info:*' check-for-changes true

precmd() { vcs_info }
################################
# Prompt
PROMPT="%F{117}%~%f %F{104}$%f "
RPROMPT='${vcs_info_msg_0_}%F{187}%*%f %F{110}%m'

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/mhamrah/bin/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/mhamrah/bin/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/mhamrah/bin/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/mhamrah/bin/google-cloud-sdk/completion.zsh.inc'
fi

lox() {
 sudo ifconfig lo0 alias 127.0.0.3 up && sudo ifconfig lo0 alias 127.0.0.2 up
}

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word