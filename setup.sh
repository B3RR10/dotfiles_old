#!/bin/bash

set -euo pipefail

export PATH=$PATH:$HOME/.local/bin

git_email=${GIT_EMAIL:-mail@berrio.dev}
echo "Git email: $git_email"

# starship
command -v starship &> /dev/null || mkdir -p $HOME/.local/bin && curl -sS https://starship.rs/install.sh | sudo -E sh -s -- --yes --bin-dir $HOME/.local/bin

# pfetch
command -v pfetch &> /dev/null || curl -L https://github.com/Gobidev/pfetch-rs/releases/latest/download/pfetch-linux-gnu-x86_64.tar.gz | sudo tar -xvz -C $HOME/.local/bin

[[ -d $HOME/.config ]] || mkdir -p $HOME/.config

# Git
cp -r ./home/config/git $HOME/.config/
sed -i "s/<GIT_EMAIL>/$git_email/" $HOME/.config/git/config

# Nvim
cp -r ./home/config/nvim $HOME/.config/

# Tmux
cp -r ./home/config/tmux $HOME/.config/

# ZSH
cp ./home/zshrc $HOME/.zshrc
cp -r ./home/config/zsh $HOME/.config/

# Dotnet
curl -L https://dot.net/v1/dotnet-install.sh | bash
curl -L https://aka.ms/install-artifacts-credprovider.sh | bash
