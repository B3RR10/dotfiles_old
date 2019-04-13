completion_dir=$HOME/.local/share/zsh/functions/Completion

# Create directory $completion_dir
if [[ ! -d "$completion_dir" ]]; then
    mkdir -p "$completion_dir"
fi

fpath=( "$completion_dir" $fpath )

# Keybase Completion
if (( $+commands[keybase] )); then
    if [[ ! -a "$completion_dir/_keybase" ]]; then
        curl -fLo "$completion_dir/_keybase" https://raw.githubusercontent.com/fnoris/keybase-zsh-completion/master/_keybase
    fi
else
    echo Please install keybase
fi

# Rustup completion
if (( $+commands[rustup] )); then
    if [[ ! -a "$completion_dir/_rustup" ]]; then
        rustup completions zsh > "$completion_dir/_rustup"
    fi
else
    echo Please install rustup
fi

# FZF completion
if (( $+commands[fzf] )); then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
else
    echo Please install fzf
fi

