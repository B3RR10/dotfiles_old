export ZPLUG_HOME=~/.local/share/zplug

if [[ -d ~/.local/share/zplug ]]; then
    source $ZPLUG_HOME/init.zsh
else
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Auto manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# From oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh

# From Github
zplug "djui/alias-tips"
# zplug "wfxr/forgit", defer:1
zplug "zpm-zsh/zpm", use:"plugins/{cd,git,zsh-core}"
zplug "zsh-users/zsh-completions"

# Theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

zplug load

# --------------- Customize to your needs... --------------- #

# Files to source
# ~/.dotfiles/zsh/alias.zsh
# ~/.dotfiles/zsh/env.zsh
# ~/.dotfiles/zsh/git.zsh
# ~/.dotfiles/zsh/history.zsh
# ~/.dotfiles/zsh/key-bindings.zsh
# ~/.dotfiles/zsh/tmux.zsh
export ZSHRC=~/.dotfiles/zsh
for config ($ZSHRC/**/*.zsh) source $config

# -------------------- Auto-ls -------------------- #
auto-ls () {
    if [[ -z $BUFFER ]]; then
        zle && echo ""
        l
        echo ""
        if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
            gst --column=row --short
        fi
        echo ""

        zle && zle redisplay
    else
        zle .$WIDGET
    fi
}
zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls

# -------------------- FZF FuzzyFinder -------------------- #

export FZF_DEFAULT_COMMAND='fd --hidden --follow --type file --exclude .git --exclude .wine'
export FZF_TMUX=1
# export FZF_TMUX_HEIGHT=30\%
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --hidden --follow --type directory --exclude .git'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# unalias md
md () {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

# ------------------------- Zsh fpath config ------------------------- #

# Create directory $HOME/.local/share/zsh/functions/Completion
if [[ ! -d $HOME/.local/share/zsh/functions/Completion ]]; then
    mkdir -p $HOME/.local/share/zsh/functions/Completion
fi

fpath=( "$HOME/.local/share/zsh/functions/Completion" $fpath )

# ------------------------- Completion ------------------------- #

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

compinit
