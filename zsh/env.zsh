# Local Env Var
export EDITOR=nvim
export BROWSER=/usr/bin/chromium
export GIT_EDITOR=nvim
export VISUAL=nvim
export LESSCHARSET=UTF-8
export TERM=tmux-256color

# Add Scripts to Path
export PATH=$PATH:$HOME/.scripts
# Add Screenlayouts to path
export PATH=$PATH:$HOME/.screenlayout
# Cargo env
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# IntelliJ Idea env
export PATH=$PATH:/opt/idea-IC-171.4694.23/bin
# Local binary path
export PATH=$PATH:$HOME/.local/bin
# Go env
# export PATH=$PATH:$(go env GOPATH)/bin
# export GOPATH=$(go env GOPATH)

# To add completion for rustup, run
# $ rustup completions zsh > ~/.local/share/zsh/functions/Completion/_rustup
fpath=( "$HOME/.local/share/zsh/functions/Completion" $fpath )
