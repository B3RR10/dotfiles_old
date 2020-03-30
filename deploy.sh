#!/usr/bin/env bash

# Set the ssh key and config for github and then run:
# bash <(curl sL https://raw.githubusercontent.com/B3RR10/dotfiles/master/deploy.sh)

export DOTREPO="$HOME/.dotfiles"

# TODO: Eval hostname...

# Install yay
if ! command -v yay > /dev/null; then
    read -r -p "Install yay? [Y/n] " -i "y" IYAY
    if [ "$(tr '[:upper:]' ':lower:' "$IYAY")" = "y" ]; then
        print "Installing yay"
    fi
    sudo pacman -Syu --needed --noconfirm git wget base-devel
    cd "$(mktemp -d)" || exit 1
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin || exit 1
    makepkg -si --noconfirm
    cd ..
    rm -rf yay*
fi

# clone dotfiles
if [[ ! -d "$DOTREPO" ]]; then
    git clone git@github.com:B3RR10/dotfiles.git "$DOTREPO"
fi
cd "$DOTREPO" || exit 1

# Install packages with yay

# Install rust toolchains and progs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -q --profile complete
rustup set profile default
rustup toolchain add nightly

# cargo install rust-progs
# TODO: install rust.packages

RUSTANALYZER="$HOME/src/rust-analyzer"
if [[ ! -d "$RUSTANALYZER" ]]; then
    [ -d "$HOME/src" ] || mkdir "$HOME/src"
    git clone https://github.com/rust-analyzer/rust-analyzer.git "$RUSTANALYZER"
    cd "$RUSTANALYZER" || exit 1
    cargo install-ra --server
fi

# Install npm packages
sudo npm install -g neovim

# Install pip packages
pip2 install --user pynvim

LOCALBIN="$HOME/.local/bin"
[ -d "$LOCALBIN" ] || mkdir -p "$LOCALBIN"
[ -f "$LOCALBIN/pfetch" ] || {
    curl -L https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch > "$LOCALBIN/pfetch"
    chmod +x "$LOCALBIN/pfetch"
}

# Deploy dotfiles
git submodule init
git submodule update
pip install --user -r "$DOTREPO/dotdrop/requirements.txt"
"$DOTREPO/dotdrop/dotdrop.sh" --cfg="$DOTREPO/config-home.yaml" install
chsh -s /usr/bin/zsh
