export ZSH=$HOME/.oh-my-zsh

if [[ -f ~/.zpm/zpm.zsh ]]; then
	source ~/.zpm/zpm.zsh
else
	git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
	source ~/.zpm/zpm.zsh
fi
if [[ ! -d $ZSH ]]; then
	git clone git://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

autoload -Uz add-zsh-hook

zpm load cd
zpm load git
zpm load ls
zpm load noempty
zpm load oh-my-zsh-wrapper
zpm load path
zpm load title
zpm load user-promt
zpm load zsh-core
zpm load djui/alias-tips
zpm load denysdovhan/spaceship-zsh-theme

plugins=(git colored-man-pages)
source $ZSH/oh-my-zsh.sh

# --------------- Customize to your needs... --------------- #

export ZSHRC=~/.dotfiles/zsh
for config ($ZSHRC/**/*.zsh) source $config

export EDITOR=nvim
export GIT_EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.scripts:/home/mberrio/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export LESSCHARSET=UTF-8

screenfetch

auto-ls () {
  if [[ $#BUFFER -eq 0 ]]; then
	zle && echo ""
	l
	echo ""
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
	  gs --column=row --short
	fi

	zle && zle redisplay
  else
	zle .$WIDGET
  fi
}

zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# --------------- Theme --------------- #

source $HOME/.local/share/zpm/denysdovhan---spaceship-zsh-theme/spaceship.zsh-theme

# PROMPT
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true

# BATTERY
SPACESHIP_BATTERY_SHOW=false

# EXIT CODE
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOl="✘ "
