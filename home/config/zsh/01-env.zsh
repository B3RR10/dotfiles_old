# Misc {{{ #
export KEYTIMEOUT=1
# }}} Misc #

# Directories {{{ #
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# }}} Directories #

# dotdrop {{{ #
export DOTREPO=$HOME/.dotfiles
# Variable to pass to sdot to get current user
export USRNAME=$USER
# }}} dotdrop #

#  Env Programs {{{ #
export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export GIT_EDITOR=nvim
export VISUAL=nvim
export LESSCHARSET=UTF-8
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

# History {{{ #
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.cache/zsh/history"
[ ! -d $(dirname $HISTFILE) ] && mkdir -p $(dirname $HISTFILE)
export HISTSIZE=10000
export SAVEHIST=10000
# }}} History #

# Prompt customization {{{ #
export PURE_PROMPT_SYMBOL="$"
export PURE_PROMPT_VICMD_SYMBOL=">>> "
export PURE_GIT_UP_ARROW=">"
export PURE_GIT_DOWN_ARROW="<"
# }}} Prompt customization #

# Python virtualenvwrapper {{{ #
export WORKON_HOME=$HOME/.envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# }}} Python virtualenvwrapper #

# Rust {{{ #
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# }}} Rust #

# zoxide {{{ #
export _ZO_DATA=$HOME/.cache/zoxide
# }}} zoxide #

# vim: foldmethod=marker
