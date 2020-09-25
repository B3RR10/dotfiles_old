#  Completions {{{ #
# set completions directory
completion_dir=$HOME/.local/share/zsh/functions/Completion
if [[ ! -d $completion_dir ]]; then; mkdir -p $completion_dir; fi
fpath=( "$completion_dir" $fpath )

# Add completions
if command -v rustup > /dev/null; then
    if [[ ! -f $completion_dir/_cargo ]]; then
        rustup completions zsh cargo > $completion_dir/_cargo
    fi
    if [[ ! -f $completion_dir/_rustup ]]; then
        rustup completions zsh rustup > $completion_dir/_rustup
    fi
fi

# diesel completions
if command -v diesel > /dev/null; then
    if [[ ! -f $completion_dir/_diesel ]]; then
        diesel completions zsh > $completion_dir/_diesel
    fi
fi

# github-cli completions
if command -v gh > /dev/null; then
    if [[ ! -f $completion_dir/_gh ]]; then
        gh completion -s zsh > $completion_dir/_gh
    fi
fi
#  }}} Completions #

# Make Envs dir if does not exist {{{ #
if [[ ! -d "$WORKON_HOME" ]]; then
    mkdir -p "$WORKON_HOME"
fi
# }}} Make Envs dir if does not exist #

# vim: foldmethod=marker
