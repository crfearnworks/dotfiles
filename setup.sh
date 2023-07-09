#!/bin/bash

# This is a script to set up an Ubuntu 22.04 WSL environment
# to use the dotfiles in this repo.

# Update packages
sudo apt-get update

# Install dependencies
sudo apt-get install -y zsh curl wget

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlightingc

#Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Nerd Fonts - Hack font
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh CascadiaCode