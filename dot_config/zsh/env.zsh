# Local Env Var
export EDITOR=nvim
export BROWSER=/usr/bin/chromium
export GIT_EDITOR=nvim
export VISUAL=nvim
export LESSCHARSET=UTF-8

# Add Scripts to Path
export PATH=$PATH:$HOME/bin
# Cargo env
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# To add completion for rustup, run
# $ rustup completions zsh > ~/.local/share/zsh/functions/Completion/_rustup
fpath=( "$HOME/.local/share/zsh/functions/Completion" $fpath )

# -------------------- FZF FuzzyFinder -------------------- #

export FZF_DEFAULT_COMMAND='fd --hidden --follow --type file --exclude .git --exclude .wine'
export FZF_TMUX=1
# export FZF_TMUX_HEIGHT=30\%
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --hidden --follow --type directory --exclude .git --exclude .wine'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
