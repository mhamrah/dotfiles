#!/bin/zsh
# Homebrew bootstrap for macOS dev environment.
# - Ensures Homebrew is installed
# - Updates Homebrew
# - Installs a curated set of formulae useful for your stack (Cloudflare, GCP, TS/Go/Rust/Swift)
# - Keeps inline comments for documentation, but strips them when installing
# - Runs optional post-install steps (fzf keybindings)

set -euo pipefail

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Ensure brew is on PATH for this session and future shells
  if [[ -x /opt/homebrew/bin/brew ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

echo "Updating Homebrew..."
brew update

# Curated packages (name followed by an inline comment).
# Comments are for humans; we strip them when installing.
PACKAGES=(
  "starship            # Fast, cross-shell prompt (configured via dotfiles)"
  "zoxide              # Smarter cd (frecency-based directory jumping)"
  "eza                 # Modern replacement for ls with icons/git"
  "bat                 # Modern cat with syntax highlighting"
  "ripgrep             # Fast grep-compatible search (rg)"
  "fd                  # Fast find-compatible file search"
  "fzf                 # Fuzzy finder (keybindings/completions enabled post-install)"
  "neovim              # Modern Vim (LSP-capable editor)"
  "procs               # Modern ps replacement"
  "delta               # Git pager with syntax highlighting"
  "jq                  # JSON CLI swiss army knife"
  "yq                  # YAML processor (jq-like syntax)"
  "stow                # Dotfile symlink manager (used for this repo)"
  "gh                  # GitHub CLI"
  "docker              # Docker CLI/engine integration"
  "docker-compose      # Compose V2 CLI"
  "docker-completion   # Docker zsh completions"
  "kubernetes-cli      # kubectl (Kubernetes CLI)"
  "kubectx             # Fast kubectx/kubens (Go-based)"
  "google-cloud-sdk    # gcloud CLI (GCP)"
  "wrangler            # Cloudflare Workers/Pages CLI"
  "mise                # Universal version/tool manager"
  "direnv              # Per-directory env loader (.envrc)"
  "uv                  # Ultra-fast Python package manager & Python installer"
  "pnpm                # Fast Node package manager (optional if managed by mise)"
)

echo "Installing packages..."
# Strip comments from each element and accumulate names for a single brew install
TO_INSTALL=()
for entry in "${PACKAGES[@]}"; do
  name="${entry%%#*}"                         # cut off everything from '#' to end
  name="${name##[[:space:]]##}"               # trim leading whitespace (zsh pattern)
  name="${name%%[[:space:]]##}"               # trim trailing whitespace
  [[ -n "$name" ]] && TO_INSTALL+=("$name")
done

if (( ${#TO_INSTALL[@]} )); then
  brew install "${TO_INSTALL[@]}"
fi

# Optional post-install steps
# fzf key bindings and completion
if [[ -f "$(brew --prefix)/opt/fzf/install" ]]; then
  echo "Setting up fzf key bindings and completion..."
  "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish
fi

echo "Installation complete!"
