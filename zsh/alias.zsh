# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Editor
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'

# ls commands
alias -g ls='ls -A --color=auto --group-directories-first'
alias -g ll='ls -l --color=auto --group-directories-first'
alias -g la='ls -lA --color=auto --group-directories-first'
alias -g l='ls -A --color=auto --group-directories-first'
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

# geeknote
# new note
actualNotebook=MaInf
function nnote() {
    echo Params: "$#"
    for i in "$@"; do
        echo $i
    done

    if [[ "$#" -eq 0 ]]; then
        echo first
    fi
    if [[ "$1" == "-h" ]]; then
        echo second
    fi
    if [[ "$#" -ge 4 ]]; then
        echo third
    fi

    if [[ "$#" -eq 0 || "$1" == '-h' || "$#" -ge 4 ]]; then
        [[ "$#" -eq 0 ]]
        [[ "$1" -eq '-h' ]]
        [[ "$#" -ge 4 ]]
        echo "Create new note with Geeknote\nUsage:"
        echo "\tnnote [notebook] [tag] [title]"
        echo "\tnnote [tag] [title] (notebook: $actualNotebook)"
        echo "\tnnote [title] (notebook: $actualNotebook, tag: '')"
    elif [[ "$#" -eq 1 ]]; then
        geeknote create --notebook $actualNotebook --title "$1"
    elif [[ "$#" -eq 2 ]]; then
        geeknote create --notebook $actualNotebook --tag "$1" --title "$2"
    elif [[ "$#" -eq 3 ]]; then
        geeknote create --notebook "$1" --tag "$2" --title "$3"
    fi
}
alias note="geeknote edit --note ''"
alias nsync="gnsync -p /home/mberrio/Notes -f markdown -a -l /home/mberrio/Notes -t"

# vimpager
alias less=/usr/share/nvim/runtime/macros/less.sh

