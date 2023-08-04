# bin dirs {{{ #
# scripts from ~/bin
export PATH=$PATH:$HOME/bin
# Local bins (mostly python)
export PATH=$PATH:$HOME/.local/bin
# }}} bin dirs #

# Dotnet {{{ #
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
# }}} Dotnet #

# Rust {{{ #
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# }}} Rust #
