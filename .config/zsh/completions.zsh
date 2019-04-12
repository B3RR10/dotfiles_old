# Create directory $HOME/.local/share/zsh/functions/Completion
if [[ ! -d $HOME/.local/share/zsh/functions/Completion ]]; then
    mkdir -p $HOME/.local/share/zsh/functions/Completion
fi

fpath=( "$HOME/.local/share/zsh/functions/Completion" $fpath )

# Keybase Completion
if (( $+commands[keybase] )); then
    if [[ ! -a ~/.local/share/zsh/functions/Completion/_keybase ]]; then
        curl -fLo /home/mberrio/.local/share/zsh/functions/Completion/_keybase https://raw.githubusercontent.com/fnoris/keybase-zsh-completion/master/_keybase
    fi
else
    echo Please install keybase
fi

# Rustup completion
if (( $+commands[rustup] )); then
    if [[ ! -a $HOME/.local/share/zsh/functions/Completion/_rustup ]]; then
        rustup completions zsh > $HOME/.local/share/zsh/functions/Completion/_rustup
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

