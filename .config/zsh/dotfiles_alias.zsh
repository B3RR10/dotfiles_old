# Aliases for easy dotfiles management

alias dotfiles="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias dhelp="alias | rg -e '^d\w*='"

alias da='dotfiles add'
alias dap='dotfiles add -p'

alias dc='dotfiles commit -v'

alias dco='dotfiles checkout'
alias dop='dotfiles checkout -p'

alias ddiff='dotfiles diff'
alias ddc='dotfiles diff --cached'
alias dds='dotfiles diff --staged'

alias dp='dotfiles push'

alias ds='dotfiles status'
alias dup='dotfiles pull --rebase'

