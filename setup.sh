#!/bin/bash

set -euo pipefail

LOCAL_BIN=$HOME/.local/bin
export PATH=$PATH:$LOCAL_BIN

mkdir -p $LOCAL_BIN

git_email=${GIT_EMAIL:-mail@berrio.dev}

echo "Git email: $git_email"
echo "Install dotnet: $INSTALL_DOTNET"

# starship
[[ -f $LOCAL_BIN/starship ]] || \
    curl -sS https://starship.rs/install.sh | \
        sh -s -- --yes --bin-dir $LOCAL_BIN

# pfetch
[[ -f $LOCAL_BIN/pfetch ]] || \
    curl -L https://github.com/Gobidev/pfetch-rs/releases/latest/download/pfetch-linux-gnu-x86_64.tar.gz | \
        tar -xvz -C $LOCAL_BIN

# lazygit
[[ -f $LOCAL_BIN/lazygit ]] || {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -L "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" | \
        tar -xvz -C $LOCAL_BIN lazygit
}

[[ ! -d $HOME/.config ]] && mkdir -p $HOME/.config

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
[[ -f $HOME/.dotnet/dotnet ]] || {
    [[ $INSTALL_DOTNET == "true" ]] && {
        curl -L https://dot.net/v1/dotnet-install.sh | bash -s -- --channel LTS
        curl -L https://dot.net/v1/dotnet-install.sh | bash -s -- --channel STS
        curl -L https://aka.ms/install-artifacts-credprovider.sh | bash

        $HOME/.dotnet/dotnet tool install --global dotnet-ef
        $HOME/.dotnet/dotnet tool install --global csharp-ls
    }
}