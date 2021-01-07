#  auto_ls {{{ #
auto-ls () {
    if [[ -z $BUFFER ]]; then
        zle && echo ""
        ls
        echo ""
        if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
            git status --column=row --short
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
#  }}} auto_ls #

# Vimwiki {{{ #
alias vimwiki='nvim +VimwikiIndex'
alias todo='pushd ~/vimwiki && nvim ~/vimwiki/Todo.md +Goyo && popd'
alias idea='pushd ~/vimwiki && nvim ~/vimwiki/Scratchpad.md +Goyo && popd'
alias diary='pushd ~/vimwiki && nvim +VimwikiMakeDiaryNote +Goyo && popd'
# }}} Vimwiki #

# vim: foldmethod=marker
