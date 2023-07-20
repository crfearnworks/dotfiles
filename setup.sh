#!/bin/bash

# This is a script to set up an Ubuntu 22.04 WSL environment
# to use the dotfiles in this repo.

# Update packages
sudo apt-get update

# Install dependencies
sudo apt-get install -y zsh curl wget

# Make zsh your default
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Nerd Fonts - Hack font
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh CascadiaCode