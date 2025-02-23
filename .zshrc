### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Optimize compinit and zcompile for faster startup
zinit wait'0' lucid for \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search

# Docker
zinit ice wait'0' lucid
zinit light zsh-users/zsh-docker

# Node.js and npm enhancements
zinit ice wait'0' lucid
zinit light lukechilds/zsh-nvm

#fzf 
zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ====== Aliases ======
alias ll='ls -lah --color=auto'
alias la='ls -la --color=auto'
alias l='ls -l --color=auto'
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'
alias gcam='git commit -am'
alias ga='git add .'
alias gp='git push'
alias gl='git pull'
alias gst='git status'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dps='docker ps'
alias dpsa='docker ps -a'

# Functions
# --------
# Create directory and cd into it
mcd() {
  mkdir -p "$1" && cd "$1"
}

# Load direnv if installed
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Starship
zinit ice lucid wait'!0'
zinit load starship/starship
eval "$(starship init zsh)"
