### ============================================================================
### ZSH CONFIGURATION — Organized, pragmatic, and fast
### - Vi key bindings
### - Exports and PATH grouped
### - Homebrew completions before compinit
### - mise + direnv, Ghostty OSC7
### - Docker/Compose helpers + completion
### - Kubernetes (kubectl completion, kubectx/kubens aliases)
### - Cloud CLI hooks (gcloud, wrangler), no terraform
### - Language ergonomics (Node/TS, Go, Rust)
### - FZF (fd/bat), editor/AI aliases, timing & safety
### - Starship config from repo (stow), zinit autoupdate
### ============================================================================

# ----------------------------------------------------------------------------
# History
# ----------------------------------------------------------------------------
HISTSIZE=50000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase

# History options
setopt appendhistory           # Append history (no overwrite)
setopt sharehistory            # Share history across sessions
setopt hist_ignore_space       # Ignore commands that start with a space
setopt hist_ignore_all_dups    # Ignore duplicates
setopt hist_save_no_dups       # Don't save duplicates
setopt hist_ignore_dups        # Don't record an entry if it's a repeat
setopt hist_find_no_dups       # Don't display a line previously found
setopt hist_expire_dups_first  # Expire duplicates first when trimming

# ----------------------------------------------------------------------------
# General shell options
# ----------------------------------------------------------------------------
setopt auto_cd                 # `cd` is implied when path is given
setopt auto_pushd              # Push old dir to stack on cd
setopt pushd_ignore_dups       # No duplicate entries in dir stack
setopt pushd_minus             # Use -/+ to traverse dir stack

# Completion options
setopt complete_in_word        # Complete from both ends of a word
setopt always_to_end           # Cursor to end on completion
setopt path_dirs               # Search path also for commands with slashes
setopt auto_menu               # Show menu on second Tab
setopt auto_list               # List choices on ambiguity
setopt auto_param_slash        # Add trailing slash for directories
setopt extended_glob           # Richer globbing
unsetopt menu_complete         # Don't autoselect first entry

# Other useful options
unsetopt flowcontrol           # Disable XON/XOFF in editor
setopt interactivecomments     # Allow comments in interactive shells

# ----------------------------------------------------------------------------
# Environment variables and PATH
# ----------------------------------------------------------------------------
# Editor
export EDITOR='vim'
export VISUAL='vim'

# Pager
export PAGER='less'
export LESS='-R'

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go (defaults)
export GOPATH="${GOPATH:-$HOME/go}"
export GOBIN="${GOBIN:-$GOPATH/bin}"
path=("$GOBIN" $path)

# ----------------------------------------------------------------------------
# Homebrew completions (ensure FPATH before compinit)
# ----------------------------------------------------------------------------
if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# ----------------------------------------------------------------------------
# Zinit bootstrap (plugin manager)
# ----------------------------------------------------------------------------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Plugin Manager (%F{33}zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Ensure zinit completion cache directory exists to avoid tee errors
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zinit/completions" 2>/dev/null

# Load important annexes (no Turbo)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

# Periodic zinit update (weekly) without using deprecated/unknown subcommands
# Runs quietly in the background if the last update was >= 7 days ago.
{
  local mark="${XDG_CACHE_HOME:-$HOME/.cache}/zinit.last-update"
  mkdir -p "${mark:h}" 2>/dev/null
  if [[ ! -e $mark || -n $mark(#qN.mh+168) ]]; then
    zinit update --all >/dev/null 2>&1 || true
    : >| "$mark"
  fi
} &!

# ----------------------------------------------------------------------------
# Plugin configuration (variables set before loading plugins)
# ----------------------------------------------------------------------------
# Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a9a9a9"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1

# ----------------------------------------------------------------------------
# Plugins (order matters)
# ----------------------------------------------------------------------------
# Completions should be available before compinit
zinit load zsh-users/zsh-completions

# Completion system (after zsh-completions is in $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Periodic compinit cache refresh (hourly); rebuild cache if older than 24h
PERIOD=3600
periodic() {
  if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi
}

# Completion styles
# - General
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
# - History words
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes select
# - Completers and processes
zstyle ':completion:*' completer _expand _complete _history _ignored _approximate
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# - Hosts
zstyle ':completion:*' hosts off

# Completion helpers and UI
zinit ice wait lucid depth=1
zinit load Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:*:*' fzf-preview ''
zstyle ':fzf-tab:*' fzf-flags --height=50% --layout=reverse
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# UI/UX
zinit ice wait lucid depth=1
zinit load zsh-users/zsh-autosuggestions
zinit ice wait"1" lucid depth=1
zinit load zsh-users/zsh-history-substring-search
zinit ice wait lucid depth=1
zinit load djui/alias-tips
zinit ice wait lucid depth=1
zinit load hlissner/zsh-autopair
zinit ice wait lucid depth=1
zinit load wfxr/forgit
zinit ice wait"1" lucid depth=1
zinit load zdharma-continuum/fast-syntax-highlighting

# OMZ plugins (git, docker, docker-compose, kubectl)
zi snippet OMZP::git
zi snippet OMZP::docker
zi snippet OMZP::docker-compose
zi snippet OMZP::kubectl

# Version managers & per-project env
# - mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
# - direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# rbenv: lazy init (kept for Ruby projects)
lazy_load_rbenv() {
  if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - zsh)"
    unset -f ruby gem bundle rbenv
  fi
}
if command -v rbenv >/dev/null 2>&1; then
  ruby()   { lazy_load_rbenv; ruby   "$@"; }
  gem()    { lazy_load_rbenv; gem    "$@"; }
  bundle() { lazy_load_rbenv; bundle "$@"; }
  rbenv()  { lazy_load_rbenv; rbenv  "$@"; }
fi

# nvm via zinit (lazy)
zinit ice wait lucid depth=1
zinit load lukechilds/zsh-nvm

# ----------------------------------------------------------------------------
# Prompt (Starship)
# ----------------------------------------------------------------------------


zinit light starship/starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f%# '
fi

# ----------------------------------------------------------------------------
# Key bindings (Vi mode)
# ----------------------------------------------------------------------------
bindkey -v                            # Use vi key bindings
# Useful navigation in both modes
bindkey '^[[1;5C' forward-word        # Ctrl+Right
bindkey '^[[1;5D' backward-word       # Ctrl+Left
bindkey '^[[3~' delete-char           # Delete key
bindkey '^[^?' backward-kill-word     # Alt+Backspace
# History substring search (after plugin is loaded)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Edit command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# ----------------------------------------------------------------------------
# Ghostty nicety: OSC 7 on directory change (helps file dialogs)
# ----------------------------------------------------------------------------
function chpwd() {
  emulate -L zsh
  print -Pn "\e]7;file://%m$PWD\a"
}
# Emit once at shell start as well
print -Pn "\e]7;file://%m$PWD\a"

# ----------------------------------------------------------------------------
# FZF configuration (prefer fd, bat)
# ----------------------------------------------------------------------------
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

  # Base options
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

  # Prefer fd (fast) for listing files
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  elif command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  # Preview with bat
  if command -v bat >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --style=numbers --color=always --line-range :500 {}'"
  fi

  # fe - edit file(s) selected with fzf
  fe() {
    local files
    IFS=$'\n' files=($(fzf --query="${1:-}" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  }

  # fcd - cd into selected directory
  fcd() {
    local dir
    dir=$(find "${1:-.}" -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m) && cd "$dir"
  }
fi

# ----------------------------------------------------------------------------
# Docker & Docker Compose (handled by OMZ plugins above)
# ----------------------------------------------------------------------------
# Custom docker ps format (supplement to OMZ aliases)
alias dpsf='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

# ----------------------------------------------------------------------------
# Kubernetes (handled by OMZ plugin above)
# ----------------------------------------------------------------------------
# Prefer compiled kubectx/kubens if installed
if command -v kubectx >/dev/null 2>&1; then
  alias kctx='kubectx'
fi
if command -v kubens >/dev/null 2>&1; then
  alias kns='kubens'
fi

# ----------------------------------------------------------------------------
# Cloud CLIs (autoload hooks)
# ----------------------------------------------------------------------------
# Google Cloud SDK (path and completion)
if [[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Cloudflare Wrangler completion
# Disabled: wrangler completion is unreliable and outputs invalid zsh syntax
# if command -v wrangler >/dev/null 2>&1; then
#   eval "$(wrangler completions zsh 2>/dev/null)" || eval "$(wrangler completion zsh 2>/dev/null)" || true
# fi

# ----------------------------------------------------------------------------
# Language ergonomics
# ----------------------------------------------------------------------------
# Node/TypeScript
export NVM_AUTO_USE=true
# Guard pnpm completion until both pnpm and node are available
if command -v pnpm >/dev/null 2>&1 && command -v node >/dev/null 2>&1; then
  eval "$(pnpm completion zsh)"
fi

# Go: add common linters completion if installed
if command -v golangci-lint >/dev/null 2>&1; then
  eval "$(golangci-lint completion zsh)"
fi

# Rust: generate cargo completion on-demand to ~/.zfunc and add to fpath
if command -v rustup >/dev/null 2>&1; then
  if [[ ! -f "$HOME/.zfunc/_cargo" ]]; then
    mkdir -p "$HOME/.zfunc"
    rustup completions zsh cargo >| "$HOME/.zfunc/_cargo" 2>/dev/null || true
  fi
  fpath=("$HOME/.zfunc" $fpath)
fi

# ----------------------------------------------------------------------------
# zoxide (fast directory jumping)
# ----------------------------------------------------------------------------
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias zz='z -'
  alias zi='z -i'
fi

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------
# General
alias ..="cd .."
alias ...="cd ../.."

# Git Supplemental (handled by OMZ plugin above)
alias gac='git add -A && git commit -m'

# Editors / tools
alias z.='zed .'
alias c.='cursor .'

# AI helper (prefers ollama)
ai() {
  local prompt="$*"
  if command -v ollama >/dev/null 2>&1; then
    ollama run "${AI_MODEL:-llama3}" -p "${prompt}"
  else
    print "No AI CLI found. Install 'ollama' or set up your preferred CLI."
  fi
}

# Alias discovery helpers
ghelp() { alias | grep '^g' | grep -v '^grep' | sort }
dhelp() { alias | grep '^d' | sort }
khelp() { alias | grep '^k' | sort }
ahelp() {
  if [[ -z "$1" ]]; then
    echo "Usage: ahelp <search-term>"
    echo "Example: ahelp commit"
  else
    alias | grep -i "$1"
  fi
}

# Conditional tool-based aliases via zinit
zinit has"eza" for \
  atinit"alias ls='eza --icons --group-directories-first';
         alias ll='eza -l --icons --group-directories-first';
         alias la='eza -la --icons --group-directories-first';
         alias tree='eza --tree --icons';
         alias lt='eza --tree --level=2 --icons'" \
  zdharma-continuum/null

zinit has"bat" for \
  atinit"alias cat='bat --paging=never';
         alias bathelp='bat --plain --language=help';
         help() { \"\$@\" --help 2>&1 | bathelp };
         alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'" \
  zdharma-continuum/null

zinit has"rg" for \
  atinit"alias grep='rg';
         alias rgg='rg --no-ignore --hidden'" \
  zdharma-continuum/null

# ----------------------------------------------------------------------------
# Timing and safety
# ----------------------------------------------------------------------------
# Show elapsed time for commands that take >2s
REPORTTIME=2
TIMEFMT=$'\n↳ Time: %*E  User: %*U  Sys: %*S  CPU: %P\n'

# Prevent terminal "freezes"
[[ -t 1 ]] && stty -ixon -ixoff

# Safer redirection and pipes (interactive)
set -o noclobber
set -o pipefail

# ----------------------------------------------------------------------------
# Done
# ----------------------------------------------------------------------------
# Everything initialized once; no redundant compinit below.

# ----------------------------------------------------------------------------
# Work overlay (optional)
# ----------------------------------------------------------------------------
# If a work overlay file exists (on work laptop), source additional settings.
if [[ -f "$HOME/dotfiles-work/includes/zsh/work.zsh" ]]; then
  source "$HOME/dotfiles-work/includes/zsh/work.zsh"
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mhamrah/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH=/Users/mhamrah/.local/bin:$PATH

# Added by Antigravity
export PATH="/Users/mhamrah/.antigravity/antigravity/bin:$PATH"
