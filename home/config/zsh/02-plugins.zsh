[[ -f $ZNAP_HOME/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $ZNAP_HOME

source $ZNAP_HOME/znap.zsh

znap source ohmyzsh/ohmyzsh \
    lib/{git,completion,key-bindings} \
    plugins/{asdf,colored-man-pages,fzf,git}

znap source sorin-ionescu/prezto modules/completion

znap source rupa/z

znap source zsh-users/zsh-completions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

#################
#  Completions  #
#################
# dotdrop
znap function _dotdrop dot \
    'eval "$( cat $DOTREPO/dotdrop/completion/_dotdrop-completion.zsh )"'
compdef _dotdrop dot
compdef _dotdrop sdot

# pip
znap function _pip_completion pip 'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

# frum
znap function _frum frum 'eval "$( frum completions -s zsh )"'
compdef       _frum frum

# cargo & rustup
if command -v rustup > /dev/null; then
    znap function _cargo cargo 'eval "$( rustup completions zsh cargo )"'
    compctl -K    _cargo cargo

    znap function _rustup rustup 'eval "$( rustup completions zsh rustup )"'
    compctl -K    _rustup rustup
fi

# diesel completions
if command -v diesel > /dev/null; then
    znap function _diesel diesel 'eval "$( diesel completions zsh )"'
    compctl -K    _diesel diesel
fi

# github-cli completions
if command -v gh > /dev/null; then
    znap function _gh gh 'eval "$( gh completion -s zsh )"'
    compctl -K    _gh gh
fi
