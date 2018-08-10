# reload zsh config
alias zsh!='RELOAD=1 source ~/.zshrc'

# Editor
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'

# ls commands
alias -g ls='ls -A --color=auto --group-directories-first'
alias -g ll='ls -l --color=auto --group-directories-first'
alias -g la='ls -lA --color=auto --group-directories-first'
alias -g l='ls -Ax --color=auto --group-directories-first'
alias -g lh='ls -lh --color=auto --group-directories-first'

# Ranger
alias r='ranger'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangedir;cd $(cat $HOME/.config/ranger/rangedir)'

# Open file
function o() {
    for i in "$@"
        do
        xdg-open "$i" > /dev/null 2>&1 &
    done
    i3 scratchpad show > /dev/null 2>&1
}

# vimpager
alias less=/usr/share/nvim/runtime/macros/less.sh

# unalias md
md () {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}


