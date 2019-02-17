export ZPLUG_HOME=$HOME/.local/share/zplug
export ZDOTDIR=$HOME/.config/zsh

if [[ -d $ZPLUG_HOME ]]; then
    source $ZPLUG_HOME/init.zsh
else
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    RELOAD=1 source $HOME/.zshrc
fi

# Auto manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# From oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/globalias", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

# From Github
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

# --------------- Source ZDOTDIR files... --------------- #

# Files to source
# ~/.dotfiles/config/zsh/alias.zsh
# ~/.dotfiles/config/zsh/auto_ls.zsh
# ~/.dotfiles/config/zsh/completions.zsh
# ~/.dotfiles/config/zsh/env.zsh
# ~/.dotfiles/config/zsh/history.zsh
for config ($ZDOTDIR/**/*.zsh) source $config

compinit
