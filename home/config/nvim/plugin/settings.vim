if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable

set noswapfile

" clipboard
set clipboard+=unnamedplus

" Precision editing
set cursorcolumn
set cursorline

" encoding
set encoding=utf-8

" errorbells
" set noerrorbells
set visualbell

" folding
set foldcolumn=0

if &diff
    set foldopen=
else
    set foldopen=all
endif

" indent
set autoindent
set breakindent
set smartindent

" line break
set linebreak
let &showbreak='> '
set cpoptions+=n
set textwidth=100
" Don't auto-wrap on textwidth
set formatoptions-=t
" Where it makes sense, remove a comment leader when joining lines.
set formatoptions+=j

" performance
set lazyredraw

" searching
set incsearch

" Don't show ins-completion-menu messages
set shortmess+=c

" don't show signcolumn ever
" set signcolumn=no

" tabs
set expandtab
set shiftwidth=0 "use the tabstop value
set tabstop=4

" trails
set list
set listchars=tab:\|\ ,trail:·,precedes:«,extends:»,nbsp:·

" UI
set autoread
set hidden
set number
set relativenumber
set scrolloff=5
set showtabline=2

" Updatetime
set updatetime=300

" Split windows the sane way
set splitbelow
set splitright

" Highlight column 101 to warn for longer lines
highlight OverLength ctermbg=red ctermfg=white guibg=#870000
let w:m2=matchadd('OverLength', '\%101v', -1)

" Match trailing spaces
match ErrorMsg '\s\+$'

" Workspace
set sessionoptions-=blank
