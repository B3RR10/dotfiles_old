export ZSH=$HOME/.oh-my-zsh

if [[ -f ~/.zpm/zpm.zsh ]]; then
    source ~/.zpm/zpm.zsh
else
    git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
    source ~/.zpm/zpm.zsh
fi
if [[ ! -d $ZSH ]]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

autoload -Uz add-zsh-hook

zpm load cd
zpm load git
zpm load ls
zpm load noempty
zpm load oh-my-zsh-wrapper
zpm load path
zpm load title
zpm load user-promt
zpm load zsh-core
zpm load djui/alias-tips
zpm load denysdovhan/spaceship-zsh-theme
zpm load s7anley/zsh-geeknote

plugins=(git colored-man-pages)
source $ZSH/oh-my-zsh.sh

# --------------- Customize to your needs... --------------- #

# Files to source
# ~/new-dotfiles/zsh/alias.zsh
# ~/new-dotfiles/zsh/env.zsh
# ~/new-dotfiles/zsh/git.zsh
# ~/new-dotfiles/zsh/tmux.zsh
export ZSHRC=~/new-dotfiles/zsh
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

# -------------------- Autojump -------------------- #
source /etc/profile.d/autojump.zsh

# -------------------- FZF FuzzyFinder -------------------- #

export FZF_DEFAULT_COMMAND='fd -H "" ~'
export FZF_TMUX=1
# export FZF_TMUX_HEIGHT=30\%
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H -t d'
export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
  )
}

[ -n "$BASH" ] && complete -F _fzf_complete_pass -o default -o bashdefault pass

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

unalias md
md () {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

# ------------------------- Theme ------------------------- #

source $HOME/.local/share/zpm/denysdovhan---spaceship-zsh-theme/spaceship.zsh-theme

# PROMPT
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true

# BATTERY
SPACESHIP_BATTERY_SHOW=false

# EXIT CODE
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOl="✘ "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
