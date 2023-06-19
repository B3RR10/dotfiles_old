# reload zsh config
alias zsh!='RELOAD=1 source "$HOME/.zshrc"'

# chezmoi {{{ #
alias cm='chezmoi'
alias cme='chezmoi edit --apply'
# }}} chezmoi #

#  Editor {{{ #
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'
#  }}} Editor #

#  ls aliases {{{ #
alias exa='exa --color=auto --icons --git --group-directories-first'
alias ls='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
alias lt='exa -lT --git-ignore'
alias tree='exa --tree'
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
