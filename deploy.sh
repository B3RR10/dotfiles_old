#!/usr/bin/env bash

# Set the ssh key and config for github and then run:
# PROFILE="<PROFILE>" bash <(curl sL https://raw.githubusercontent.com/B3RR10/dotfiles/master/deploy.sh)

: "${PROFILE:?Set PROFILE with the wished profile for the dotfiles.
    (See https://github.com/B3RR10/dotfiles/blob/fb43dbc6f03532b99263c1536ed4b925d580984f/config-home.yaml).
    Aborting.}"

DOTREPO="${DOTREPO:-$HOME/.dotfiles}"

# Check if .ssh key for github exists
if ! grep -q "github.com" ~/.ssh/config; then
    echo "Please set up your ssh key for Github."
    exit 1
fi

echo "Installing the basics..."
sudo pacman -Syu --needed --noconfirm base-devel
sudo pacman -Syu --needed --noconfirm \
    bat \
    exa \
    fzf \
    git git-delta \
    neovim \
    python python-pip python-neovim \
    reflector \
    starship \
    tmux \
    wget \
    zsh
echo "Done."

if ! command -v paru > /dev/null; then
    echo "Installing an AUR helper (paru)"
    git clone https://aur.archlinux.org/paru-bin.git
    pushd paru-bin || exit 1
    makepkg -si --noconfirm
    popd
    rm -rf paru*
    echo "Done."
fi

# Clone dotfiles
echo "Cloning dotfiles repo to $DOTREPO"
if [[ ! -d "$DOTREPO" ]]; then
    git clone git@github.com:B3RR10/dotfiles.git "$DOTREPO"
fi
cd "$DOTREPO" || exit 1
echo "Done."

# Install packages with paru
echo "Installing packages..."
if [[ -f "$DOTREPO/$PROFILE.packages" ]]; then
    paru -S --needed --noconfirm - < "$DOTREPO/$PROFILE.packages"
else
    echo "There is no packages file for this profile."
fi
echo "Done."

# Install rust
echo "Installing rust and its base packages..."
paru -S --needed --noconfirm rustup
rustup set profile default
rustup toolchain install stable

# Install cargo packages
cargo install cargo-update topgrade
echo "Done"

echo "Setting a bin directory and adding pfetch..."
LOCALBIN="$HOME/.local/bin"
[ -d "$LOCALBIN" ] || mkdir -p "$LOCALBIN"
[ -f "$LOCALBIN/pfetch" ] || {
    curl -L https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch > "$LOCALBIN/pfetch"
    chmod +x "$LOCALBIN/pfetch"
}
echo "Done"

# Deploy dotfiles
git submodule init
git submodule update
pip install -r "$DOTREPO/dotdrop/requirements.txt"
"$DOTREPO/dotdrop/dotdrop.sh" --cfg="$DOTREPO/config-home.yaml" --profile="$PROFILE" install
chsh -s /usr/bin/zsh
