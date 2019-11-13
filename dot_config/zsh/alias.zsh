# reload zsh config
alias zsh!='RELOAD=1 source "$ZDOTDIR/.zshrc"'

#  Editor {{{ #
alias vim='nvim'
alias vi='nvim'
alias edit='nvim'
#  }}} Editor #

#  ls aliases {{{ #
alias ls='ls -x --color=auto --group-directories-first'
alias l='ls -Ax --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias la='ls -lA --color=auto --group-directories-first'
alias lh='ls -lAh --color=auto --group-directories-first'
#  }}} ls aliases #

#  Open file {{{ #
function o() {
    for i in "$@"
        do
        xdg-open "$i" > /dev/null 2>&1 &
    done
    i3 scratchpad show > /dev/null 2>&1
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
alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch --all'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gco='git checkout'

alias gd='git diff'
alias gda='git diff HEAD'
alias gdc='git diff --cached'
alias gds='git diff --staged'

alias gl='git pull'
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias gloga='git log --oneline --decorate --graph --all'

alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'

alias gp='git push'
alias gpd='git push --dry-run'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbs='git rebase --skip'
alias grm='git rm'

alias gs="git status"
alias gsh='git show'
alias gss='git status --short'
alias gst='git stash save'
alias gsta='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# a simple git rename file function
# git does not track case-sensitive changes to a filename.
function git-rename() {
    git mv $1 "${2}-"
    git mv "${2}-" $2
}

alias git-prune='git remote prune origin && git fetch -p && git branch -vv | awk '"'"'/: gone]/{print $1}'"'"' | xargs git branch -D'
#  }}} Git aliases #

#  tmux aliases {{{ #
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
#  }}} tmux aliases #

# vim: foldmethod=marker
