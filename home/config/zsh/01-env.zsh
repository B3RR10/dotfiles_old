# bat {{{ #
export BAT_THEME="Solarized (dark)"
export BAT_STYLE="full"
# }}} bat #

# bin dirs {{{ #
# scripts from ~/bin
export PATH=$PATH:$HOME/bin
# Local bins (mostly python)
export PATH=$PATH:$HOME/.local/bin
# }}} bin dirs #

# Directories {{{ #
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# }}} Directories #

# Dordrop {{{ #
export DOTFILES=$HOME/dotfiles
# }}} Dotdrop #

# Dotnet {{{ #
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
# }}} Dotnet #

#  Env Programs {{{ #
export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export GIT_EDITOR=nvim
export VISUAL=nvim
export LESSCHARSET=UTF-8
export TERMINAL=alacritty
#  }}} Env Programs #

#  fzf settings {{{ #
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_COMMAND='fd --hidden --follow --type f --exclude .git --exclude .wine'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=30\%
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='command cat <(fd -t d --exclude .git --exclude .wine) <(fd -t d --hidden --follow --exclude .git --exclude .wine . ~)'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#  }}} fzf settings #

# git grab {{{ #
export GRAB_HOME=$HOME/src
#  }}} git grab #

# History {{{ #
[ -z "$HISTFILE" ] && HISTFILE="$XDG_CACHE_HOME/zsh/history"
[ ! -d $(dirname $HISTFILE) ] && mkdir -p $(dirname $HISTFILE)
export HISTSIZE=10000
export SAVEHIST=10000
# }}} History #

# pass {{{ #
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# }}} pass #

# Rust {{{ #
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# }}} Rust #

# Wayland {{{ #
export _JAVA_AWT_WM_NONREPARENTING=1
# }}} Wayland

# z {{{ #
export _Z_DATA=$XDG_CACHE_HOME/z
export _Z_NO_RESOLVE_SYMLINKS=1
# }}} z #

# zk {{{ #
export ZK_NOTEBOOK_DIR=$HOME/Notes
# }}} zk #

# Znap {{{ #
export ZNAP_HOME=$XDG_DATA_HOME/znap/znap
# }}} Znap #

# ZSH config {{{ #
export KEYTIMEOUT=1
export WORDCHARS=''
# }}} ZSH config #

# ZSH options {{{ #
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt INC_APPEND_HISTORY     # add commands to HISTFILE in order of execution
setopt autocd
setopt auto_pushd

unsetopt SHARE_HISTORY
# }}} ZSH options #

# vim: foldmethod=marker
