#  auto_ls {{{ #
LAST_REPO=""
auto-ls () {
    if [[ -z $BUFFER ]]; then
        zle && echo ""
        exa --color=auto --group-directories-first
        echo ""
        if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
            local git_repo="$(basename $(git rev-parse --show-toplevel))"
            if [ "$LAST_REPO" != "$git_repo" ]; then
                onefetch
                git status --column=row --short
                LAST_REPO="$git_repo"
            fi
        else
            LAST_REPO=""
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

# vim: foldmethod=marker
