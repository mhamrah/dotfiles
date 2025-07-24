
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


# History settings
HISTSIZE=50000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase



# History options
setopt appendhistory          # Append history to the history file (no overwriting)
setopt sharehistory          # Share history across terminals
setopt hist_ignore_space     # Ignore commands that start with space
setopt hist_ignore_all_dups  # Ignore duplicate commands
setopt hist_save_no_dups     # Don't save duplicate commands
setopt hist_ignore_dups      # Don't record an entry that was just recorded again
setopt hist_find_no_dups     # Don't display a line previously found
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history
# Directory options
setopt auto_cd               # Auto change to a directory without typing cd
setopt auto_pushd           # Push the old directory onto the stack on cd
setopt pushd_ignore_dups    # Don't push multiple copies of the same directory
setopt pushd_minus          # This reverts the +/- operators


# Completion options
setopt complete_in_word     # Complete from both ends of a word
setopt always_to_end        # Move cursor to the end of a completed word
setopt path_dirs            # Perform path search even on command names with slashes
setopt auto_menu            # Show completion menu on successive tab press
setopt auto_list            # Automatically list choices on ambiguous completion
setopt auto_param_slash     # If completed parameter is a directory, add a trailing slash
setopt extended_glob        # Enable extended globbing
unsetopt menu_complete      # Don't autoselect the first completion entry
unsetopt flowcontrol        # Disable start/stop characters in shell editor


# Other useful options
#setopt correct              # Try to correct the spelling of commands
setopt interactivecomments  # Allow comments in interactive shells



# =============================================================================
# ZINIT PLUGIN LOADING (Performance Optimized Order)
# =============================================================================


# fzf integration (use existing fzf installation)
zinit load Aloxaf/fzf-tab


# Load important completion enhancements first
zinit load zsh-users/zsh-completions


# Load fast syntax highlighting (faster than zsh-syntax-highlighting)
zinit load zdharma-continuum/fast-syntax-highlighting


# Load autosuggestions
zinit load zsh-users/zsh-autosuggestions


# Load history substring search (must be after syntax highlighting)
zinit load zsh-users/zsh-history-substring-search


# Git enhancements
zinit load wfxr/forgit    # Interactive git commands with fzf


# Tool-specific aliases and configurations
zinit has"eza" for \
  atinit"alias ls='eza --icons --group-directories-first'; 
         alias ll='eza -l --icons --group-directories-first --git'; 
         alias la='eza -la --icons --group-directories-first --git'; 
         alias tree='eza --tree --icons'
         alias lt='eza --tree --level=2 --icons'" \
  zdharma-continuum/null


zinit has"bat" for \
  atinit"alias cat='bat --paging=never'
         alias bathelp='bat --plain --language=help'
         help() { \"\$@\" --help 2>&1 | bathelp }
         alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'" \
  zdharma-continuum/null


zinit has"rg" for \
  atinit"alias grep='rg'
         alias rgg='rg --no-ignore --hidden'" \
  zdharma-continuum/null


# Load useful utilities
zinit load djui/alias-tips           # Reminds you of your aliases
zinit load hlissner/zsh-autopair     # Auto-pair brackets, quotes, etc.


# =============================================================================
# Starship Prompt
# =============================================================================
zinit light starship/starship
# Starship prompt (modern, fast, customizable)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    # Fallback to a simple prompt if starship isn't available
    PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f%# '
fi



# =============================================================================
# VERSION MANAGERS INITIALIZATION
# =============================================================================


# rbenv initialization (lazy loading for performance)
lazy_load_rbenv() {
    if command -v rbenv >/dev/null 2>&1; then
        eval "$(rbenv init - zsh)"
        # Remove the lazy loading functions after first use
        unset -f ruby gem bundle rbenv
    fi
}


if command -v rbenv >/dev/null 2>&1; then
    # Create wrapper functions for lazy loading
    ruby() { lazy_load_rbenv; ruby "$@"; }
    gem() { lazy_load_rbenv; gem "$@"; }
    bundle() { lazy_load_rbenv; bundle "$@"; }
    rbenv() { lazy_load_rbenv; rbenv "$@"; }
fi

#load nvm lazily via zinit
zinit ice wait lucid
zinit load lukechilds/zsh-nvm

# =============================================================================
# FZF CONFIGURATION
# =============================================================================


# Initialize fzf if available
if command -v fzf >/dev/null 2>&1; then
    # Source fzf key bindings and completion
    if [[ -f ~/.fzf.zsh ]]; then
        source ~/.fzf.zsh
    elif [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
        source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
        source /opt/homebrew/opt/fzf/shell/completion.zsh
    elif [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
        source /usr/local/opt/fzf/shell/key-bindings.zsh
        source /usr/local/opt/fzf/shell/completion.zsh
    fi


    # FZF configuration
    export FZF_DEFAULT_OPTS='
      --height 50%
      --layout=reverse
      --border
      --preview-window=right:60%
      --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down
      --bind ctrl-/:toggle-preview
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6ac,pointer:#f5e0dc
      --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6ac,hl+:#f38ba8
    '


    # Use rg for FZF if available
    if command -v rg >/dev/null 2>&1; then
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi


    # Enhanced fzf functions
    # fe - Edit file with fzf
    fe() {
        local files
        IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
        [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
    }


    # fcd - Change directory with fzf
    fcd() {
        local dir
        dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
    }
fi


# =============================================================================
# ZOXIDE CONFIGURATION
# =============================================================================


# Initialize zoxide if available
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    # Add useful aliases for zoxide
    alias zz='z -'              # Go to previous directory
    alias zi='z -i'             # Interactive selection
    alias zq='z -'              # Query mode
    alias cd='z'
fi


# =============================================================================
# PLUGIN CONFIGURATION
# =============================================================================


# ZSH Autosuggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1


# History substring search configuration
bindkey '^[[A' history-substring-search-up    # Up arrow
bindkey '^[[B' history-substring-search-down  # Down arrow
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# fzf-tab configuration
zstyle ':fzf-tab:complete:*:*' fzf-preview ''
zstyle ':fzf-tab:*' fzf-flags --height=50% --layout=reverse
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


# =============================================================================
# COMPLETION SYSTEM
# =============================================================================


# Initialize completion system
autoload -Uz compinit


# Speed up compinit by checking cache once per day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi


# Enable history completion
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes select


# Add history-words to the list of completers
zstyle ':completion:*' completer _expand _complete _history _ignored _approximate


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Colored completion
zstyle ':completion:*' menu select  # Selectable menu
zstyle ':completion:*' group-name ''  # Group matches and describe


# Advanced completion for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"


# Disable hostname completion (speeds up completion)
zstyle ':completion:*' hosts off


# Homebrew completion
if command -v brew >/dev/null 2>&1; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi


# =============================================================================
# KEY BINDINGS
# =============================================================================


# Use emacs-style key bindings
bindkey -e


# Enhanced navigation
bindkey '^[[1;5C' forward-word      # Ctrl+Right
bindkey '^[[1;5D' backward-word     # Ctrl+Left
bindkey '^[[3~' delete-char         # Delete key
bindkey '^[^?' backward-kill-word   # Alt+Backspace


# Edit command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


# =============================================================================
# ALIASES
# =============================================================================


alias ..="cd .."
alias ...="cd ../.."
alias g="git"
alias gst="git status"
alias gco="git checkout"
alias gcam="git add . && git commit -am"
alias gl="git pull"
alias gp="git push"
alias grhh="git reset HEAD --hard"
alias gcm="git checkout main"


# =============================================================================
# FUNCTIONS
# =============================================================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================


# Editor
export EDITOR='vim'
export VISUAL='vim'


# Pager
export PAGER='less'
export LESS='-R'

# =============================================================================
# FINAL SETUP
# =============================================================================


# Refresh completions for newly installed tools
if command -v brew >/dev/null 2>&1; then
    autoload -Uz compinit
    compinit
fi
