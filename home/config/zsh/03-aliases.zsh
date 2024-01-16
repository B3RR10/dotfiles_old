# reload zsh config
alias zsh!='RELOAD=1 source "$HOME/.zshrc"'

# Dotdrop {{{ #
dt() { dotdrop --cfg=$DOTFILES/config-home.yml --profile={{@@ profile @@}} $@ }
# }}} Dotdrop #

#  Editor {{{ #
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'
#  }}} Editor #

#  ls aliases {{{ #
alias eza='eza --color=auto --icons --git --group-directories-first'
alias ls='eza'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias lt='eza -lT --git-ignore'
alias tree='eza --tree'
#  }}} ls aliases #

#  Open file {{{ #
function o() {
    for i in "$@"; do
        xdg-open "$i" > /dev/null 2>&1 &
    done
}
#  }}} Open file #

#  cd aliases {{{ #
alias tmp='cd $(mktemp -d)'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
#  }}} cd aliases #

#  Git aliases {{{ #
alias g='git rev-parse --is-inside-work-tree > /dev/null && lazygit || git'
alias gs='git status'

alias gprune='git remote prune origin && git fetch -p && git branch -vv | awk '"'"'/: gone]/{print $1}'"'"' | xargs -r git branch -D'

alias vimdiff='nvim -d'
#  }}} Git aliases #

# vim: foldmethod=marker
