#!/bin/bash

# Variables
DOTFILES_REPO="https://github.com/crfearnworks/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
DEPENDENCIES=(zsh curl wget)

# Update packages
sudo apt-get update

# Install dependencies
for pkg in "${DEPENDENCIES[@]}"; do
    if dpkg -l | grep -q "$pkg"; then
        echo "$pkg already installed"
    else
        sudo apt-get install -y "$pkg"
    fi
done

# Make zsh your default
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    sudo chsh -s "$(which zsh)" "$(whoami)"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Nerd Fonts - Hack font
if [ ! -d "$HOME/nerd-fonts" ]; then
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
    cd nerd-fonts
    ./install.sh Hack
    cd ..
fi

# Clone your dotfiles repo
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# Set up symlinks
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# Inform the user to start a new shell
echo "Setup completed. Please start a new Zsh session to load the new settings."