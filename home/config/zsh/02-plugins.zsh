if [[ ! -d ${ZINIT[HOME_DIR]} ]]; then
    mkdir -p ${ZINIT[HOME_DIR]}
    git clone https://github.com/zdharma/zinit.git ${ZINIT[HOME_DIR]}
fi

source ${ZINIT[HOME_DIR]}/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/completion.zsh

zinit snippet OMZ::lib/key-bindings.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice as"completion"
zinit snippet OMZ::plugins/fd/_fd

zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice svn as"completion" source"pip.plugin.zsh" pick"_pip" atpull'zinit creinstall -q .'
zinit snippet OMZ::plugins/pip

zinit ice wait lucid
zinit snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh

zinit ice wait lucid
zinit snippet PZT::modules/completion/init.zsh

zinit ice wait lucid
zinit snippet PZT::modules/rsync/init.zsh

# diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy

zinit ice wait'1' lucid as'completion' aliases
zinit snippet '$DOTREPO/dotdrop/completion/_dotdrop-completion.zsh'

zicompdef _dotdrop-completion.zsh dot
zicompdef _dotdrop-completion.zsh sdot

# git with fzf
zinit ice wait'1' lucid
zinit light wfxr/forgit

zinit ice wait lucid atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-syntax-highlighting
