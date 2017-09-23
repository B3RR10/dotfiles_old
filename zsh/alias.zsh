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
alias ranger='ranger --choosedir=$HOME/.rangerdir;cd $(cat $HOME/.rangerdir)'

# Open file
alias o='xdg-open '

alias less='vimpager -u /home/mberrio/.vimrc.more'
alias zless='vimpager -u /home/mberrio/.vimrc.more'

# alias less=$PAGER -u $HOME/.vimrc.more
# alias zless=$PAGER -u $HOME/.vimrc.more
