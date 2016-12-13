################################
# Exported Environment Variables
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="mlh@uber.com"
export UBER_LDAP_UID="mlh"
export GOPATH=~/go2

################################
# Startup Scripts
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
#_ANTIGEN_CACHE_ENABLED=true
source ~/.antigen.zsh
antigen init .antigenrc
#antigen bundle zsh-users/zsh-syntax-highlighting

################################
# Options
setopt INC_APPEND_HISTORY
setopt AUTO_CD
setopt SHARE_HISTORY

export HISTFILE=~/.zhistory


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

################################
# Prompt
PROMPT="%F{117}%~%f %F{104}$%f "
RPROMPT="%F{187}%*%f %F{110}%m"

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

