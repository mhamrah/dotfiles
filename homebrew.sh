#!/bin/zsh

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

# Install packages
PACKAGES=(
    starship
    zoxide
    gh
    ripgrep
    fzf
    neovim
)

echo "Installing packages..."
brew install "${PACKAGES[@]}"

# Set up fzf
if [ -f "$(brew --prefix)/opt/fzf/install" ]; then
    echo "Setting up fzf..."
    "$(brew --prefix)/opt/fzf/install" --all
fi

echo "Installation complete!"

