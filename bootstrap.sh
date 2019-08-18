#!/usr/bin/env bash

DOTFILES=${DOTFILES:-$HOME/.dotfiles}
WORKDIR=${WORKDIR:-$HOME}
PACKAGE_LIST=${PACKAGE_LIST:-"package_list.txt"}

git=$(command -v git)
makepkg=$(command -v makepkg)
sudo=$(command -v sudo)

cd "$DOTFILES" || exit 1

function main() {
    # Capture parameters
    while [[ $# -gt 0 ]]; do
        key=$1
        case $key in
            -b)
                BOOTSTRAP=1;;
            -d)
                DEBUG=1;;
            -n)
                DRY_RUN=1;;
            -f)
                FORCE=1;;
        esac
        shift
    done

    debug "Dotfiles dir: $DOTFILES"
    debug "Working dir: $WORKDIR"

    create_sym_links
    [[ -n "$BOOTSTRAP" ]] && first_install
}

function create_sym_links() {
    # Load files to ignores
    load_ignores
    # load_ignores ignores
    load_source_files
    debug "Total source files: ${#source_files}"

    for source_file in  "${source_files[@]}" ; do
        target_file=$(echo "$source_file" | sed -E -e 's|dot_|.|g; s|'"$DOTFILES"'|'"$WORKDIR"'|')
        target_dir=$(dirname "$target_file")

        # Create target dir
        if [[ ! -d "$target_dir" ]]; then
            debug "Create dir $target_dir"
            perform mkdir -p "$target_dir"
        fi

        # Backup existing files if force is not activated
        if [[ -z "$FORCE" ]]; then
            if [[ -f "$target_file" ]]; then
                echo "Backup file $target_file"
                perform cp "$target_file" "$target_file".bk
            fi
        fi

        # Create sym links
        perform ln -fs "$source_file" "$target_file"
    done

    echo "Symlinks created"
}

# ----- if bootstrap ----- #

function first_install() {

    # Install important packages?
    echo "Installing packages from $PACKAGE_LIST"
    install_packages

    # Install Rust packages
    echo "Installing rustup and rust toolchain"
    install_rust

    # Install vim plugins
    echo "Installing vim plugins"
    perform nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'

    # Install zsh plugins
    echo "Install zsh plugins running 'zplug install'"

    # Create completions
    local completion_dir=$HOME/.local/share/zsh/functions/Completion
    if [[ ! -d "$completion_dir" ]]; then
        mkdir -p "$completion_dir"
    fi

    # -- Keybase
    curl -fLo "$completion_dir/_keybase" \
        https://raw.githubusercontent.com/fnoris/keybase-zsh-completion/master/_keybase
    # -- rustup
    rustup completions zsh > "$completion_dir/_rustup"

    # Following services must be enabled:
    # - user:
    #   - keybase
    #   - dunst
    #   - geoclue-agent
    #   - redshift
    # - system:
    #   - acpid
    #   - tlp
    #   - tlp-sleep
    # - timer:
    #   - low-battery
    #   - update-alert

}

function install_packages() {
    # Create a `package_list.txt` of the system with `pacman -Qqe > package_list.txt`

    debug "Installing all packages from $PACKAGE_LIST"
    [[ -n $DRY_RUN ]] && return

    # Get the passwd for sudo
    $sudo -v

    # Keep sudo alive through the hole script
    while true; do "$sudo" -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Check if yay is installed and if not, install it
    if ! [ -x "$(command -v yay)" ]; then
        echo "Installing yay..."
        dir=$(pwd)
        cd "$(mktemp -d)" || exit
        $git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin || exit
        if ! $makepkg -si --noconfirm; then
            echo "Error installing yay" >&2
            exit 1
        fi
        cd "$dir" || exit
        echo "yay successfully installed"
    fi

    # Install packages with yay
    perform yay -S --noconfirm --needed "$(comm -12 <(yay -Slq | sort) <(sort package-list-2.txt))"

    # Install diff-so-fancy
    curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > $HOME/bin/diff-so-fancy
    chmod +x $HOME/bin/diff-so-fancy

}

function install_rust() {
    [[ -n $DRY_RUN ]] && return
    # Install rustup if not installed
    if [[ ! -x $(command -v rustup) ]]; then
        sudo pacman -S rustup
    fi

    # Install toolchains
    rustup toolchain add stable
    rustup default stable
    rustup toolchain add nightly

    # Install components
    rustup component add rls rust-analysis rust-src rustfmt clippy

    # Install cargo-update
    if ! cargo install-update --version > /dev/null ; then
        cargo install cargo-update
    fi

    # Install racer
    if [[ ! -x $(command -v cargo) ]]; then
        cargo +nightly install racer
    fi
}

function debug() {
    [[ -n "$DEBUG" ]] && echo "$*"
}

function load_ignores() {
    # TODO: Allow wildcards in .dfignore file
    if [[ -f "$DOTFILES/.dfignore" ]]; then
        while read -r ignore ; do
            if [[ -d "$ignore" ]]; then
                ignores+=("$DOTFILES/$ignore/*")
            elif [[ -f $ignore ]]; then
                ignores+=("$DOTFILES/$ignore")
            fi
        done <"$DOTFILES/.dfignore"
    fi

    [[ -n "$DEBUG" ]] && {
        if [[ ${#ignores[@]} -ne 0 ]]; then
            echo "Ignoring files:"
            printf '\t%s\n' "${ignores[@]/$DOTFILES\//}"
        fi
    }
}

function load_source_files() {
    local exclude_params=()
    for i in "${ignores[@]}"; do
        exclude_params+=('!' '-path' "$i")
    done

    # Load all files to bootstrap
    source_files=()
    while IFS= read -d $'\0' -r source_file ; do
        source_files+=("$source_file")
    done < <(find "$DOTFILES" -type f "${exclude_params[@]}" -print0)
}

function perform() {
    echo "${*/$HOME/\~}"
    [[ -z "$DRY_RUN" ]] && eval "$*"
}

main "$@"
exit

