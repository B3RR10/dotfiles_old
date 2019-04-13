# Aliases for easy dotfiles management

alias c='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ca='c add'
alias cap='c add -p'

alias cc='c commit -v'
alias 'cc!'='c commit -v --amend'

alias cco='c checkout'
alias cop='c checkout -p'

alias ccp='c cherry-pick'
alias ccpa='c cherry-pick --abort'
alias ccpc='c cherry-pick --continue'

alias cdiff='c diff'
alias cdca='c diff --cached'
alias cds='c diff --staged'

alias clg='c log --graph'
alias clp='c log --stat -p'
alias clola='c log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'

alias cpush='c push'
alias cpv='c push -v'

alias cs='c status'
alias cup='c pull --rebase'

