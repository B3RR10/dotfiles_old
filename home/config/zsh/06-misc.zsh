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
#  }}} Completions #

#  Generate zcompdump if older than 24 hours {{{ #
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi
