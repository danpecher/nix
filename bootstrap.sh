#!/bin/zsh

# install nix
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo rm /etc/bashrc /etc/zshrc