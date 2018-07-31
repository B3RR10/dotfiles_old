" init.vim

" runtime! archlinux.vim

" ***** SETTINGS ***** {{{
" }}}

" Plugins {{{
" " "

call plug#begin('$HOME/.local/share/nvim/plugged')
"--------------------------------------------------"

" UI
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline' " Statusline
Plug 'Lokaltog/powerline-fonts' " Required by airline
Plug 'chrisbra/Colorizer'
Plug 'romainl/Apprentice',          { 'branch': 'fancylines-and-neovim' }

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim',             { 'for': [ 'html', 'xml', 'handlebars' ] }
Plug 'othree/html5.vim',            { 'for': 'html' }
Plug 'gregsexton/MatchTag',         { 'for': [ 'html', 'xml', 'handlebars' ] }

Plug 'plasticboy/vim-markdown',     { 'for': 'markdown' }

Plug 'tmhedberg/SimpylFold',        { 'for': 'python' } " Fold code in Python
Plug 'vim-scripts/indentpython.vim',{ 'for': 'python' }

Plug 'rust-lang/rust.vim',          { 'for': 'rust' } " Rust filetype *** TODO: CHECK OPTIONS ***
Plug 'racer-rust/vim-racer',        { 'for': 'rust' }
Plug 'timonv/vim-cargo',            { 'for': 'rust' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'cespare/vim-toml',            { 'for': 'toml' }

" Plug 'fatih/vim-go',                { 'for': 'go', 'do': ':GoInstallBinaries' }
"
Plug 'scrooloose/nerdcommenter' " Commenting operations
Plug 'jiangmiao/auto-pairs'     " Close quotes, parenthesis, brackets, etc automatic
Plug 'majutsushi/tagbar'        " Browse tags of source files
Plug 'tpope/vim-surround'       " Add, change and delete surroundings
Plug 'lervag/vimtex'

" Tools
Plug 'airblade/vim-gitgutter'   " Git integration (Show diff on files)
Plug 'tpope/vim-fugitive',      { 'as': 'fugitive.vim' } " Git commands
Plug 'junegunn/gv.vim'          " Git commit browser
Plug 'scrooloose/nerdtree',     { 'on': 'NERDTreeToggle' }
" Plug 'simnalamburt/vim-mundo'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'  " Alignment tool
Plug 'godlygeek/tabular'        " Auto indent
Plug 'tpope/vim-repeat'         " Repeat last command (Also when it's a plugin-map)
Plug 'vim-scripts/Rename'       " Rename buffer and file on disk
Plug 'suxpert/vimcaps'          " Turn off caps when change from insert to normal mode
Plug 'easymotion/vim-easymotion' " Easy motions
" Plug 'junegunn/fzf'            "{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'benekastah/neomake'
Plug ('Shougo/deoplete.nvim'),          { 'do': ':UpdateRemotePlugins' } " Code completion
" Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'sebastianmarkow/deoplete-rust',   { 'for': 'rust' }
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

"--------------------------------------------------"
call plug#end()
" }}}

" Autocommands {{{
" " "

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested :source $MYVIMRC
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END

" Autoremove trailing white spaces spaces and convert tabs in spaces
autocmd BufWritePre * silent! %s/\s\+$//ge
autocmd BufWritePre * %retab!

au InsertEnter * set nornu
au InsertLeave * set rnu

" return to last edit position when opening files
" autocmd BufReadPost *
"             \ if line("'\"") > 0 && line("'\"") <= line("$") |
"             \   exe "normal! g`\"" |
"             \ endif

" }}}

" Colorscheme {{{
" " "
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
colorscheme apprentice
" }}}

" Functions {{{
" " "

au FileType sh,bash,perl,python,ruby nno <leader>ex :! chmod +x %<CR>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nno z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" }}}

" Mappings {{{
" " "

" Escape commands
ino jk <Esc>
ino JK <Esc>
cno jk <Esc>
cno JK <Esc>
nno <C-q> <Esc>
vno <C-q> <Esc>

" Fast commands
nno <leader>w :w<CR>
nno <leader>sw :w !sudo tee %<CR>
nno <leader>so :so %<cr>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>

" Spell
nno <leader>ss :set spell!<CR>
nno <leader>sde :set spelllang=de_de<CR>
nno <leader>sen :set spelllang=en_us<CR>
nno <leader>ses :set spelllang=es_mx<CR>

" Move through buffers
nno <silent> <leader>q :bdelete<CR>
nno <silent> <Tab> :bnext<CR>
nno <silent> <S-Tab> :bprevious<CR>

" Tabs
nno <silent> <leader>h :tabp<CR>
nno <silent> <leader>l :tabn<CR>

" Windows
no <C-j> <C-W>j
no <C-k> <C-W>k
no <C-h> <C-W>h
no <C-l> <C-W>l

no <leader>vq <C-W>q
no <leader>vl :vertical resize +10<CR>
no <leader>vh :vertical resize -10<CR>
no <leader>vj :res +10<CR>
no <leader>vk :res -10<CR>

" Moving characters
nno L xp
nno H Xph

" Move through wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" Return to visual selection when indenting
vno < <gv
vno > >gv

" Move to next instance of the word
no <Space>j *
no <Space>k #

" Move faster through text
" nno <C-e> 5<C-e>
" nno <C-y> 5<C-y>
" vno <C-e> 5<C-e>
" vno <C-y> 5<C-y>

" Select all text
map <Space>a ggVG

" Copy until the end of the line
no Y y$

" Clean search highligt
no <silent> <leader>/ :nohlsearch<CR>
no <silent> <Space><Space> :nohlsearch<CR>

" Edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" In-file navigation with enter and backspace
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

" Open search results in quickfix
nmap <silent> <leader>o :vim // %<CR>:copen<CR>
" }}}

" Settings {{{
" " "

filetype plugin indent on

" backups, undos, swaps
set nobackup
set noswapfile

" clipboard
set clipboard+=unnamedplus

" Precision editing
set cursorcolumn
set cursorline

" encoding
set encoding=utf-8

" errorbells
set noerrorbells
set visualbell

" folding
set foldmethod=syntax
set foldcolumn=1
set nofoldenable

" indent
set breakindent
set autoindent
set smartindent

" line break
set linebreak

" performance
set lazyredraw
set ttyfast

" regex
set magic

" Required by Latex-Suite
" set grepprg=grep\ -nH\ $*       " Required by Latex-Suite
" set shellslash                  " Required by Latex-Suite

" searching
set ignorecase
set incsearch

" sidescroll
set sidescrolloff=15
set sidescroll=1

" style of divider
autocmd ColorScheme * hi VertSplit cterm=NONE ctermbg=NONE ctermfg=green

" tabs
set laststatus=4
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" trails
set list
set listchars=tab:\|\ ,trail:·,precedes:«,extends:»,nbsp:·

" ui
set autoread
set hidden
set nu
set rnu
set scrolloff=5

" Updatetime
set updatetime=500

" windows
set splitbelow
set splitright

" Highlight ugly code
highlight OverLength ctermbg=red ctermfg=white guibg=#870000
" match ErrorMsg '\%81v'
let w:m2=matchadd('OverLength', '\%121v', -1)
match ErrorMsg '\s\+$'

" }}}

" ***** PLUGINS ***** {{{
" }}}

" Airline {{{
" " "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
set laststatus=2

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
" powerline symbols
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_theme='apprentice'
" }}}

" Autopairs {{{ "
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn
" }}} Autopairs "

" Deoplete - Completion framework {{{
if has('nvim')
    let g:deoplete#enable_at_startup = 1

    " Rust
    let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path='$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
    let g:deoplete#sources#rust#show_duplicates=1
    let g:deoplete#sources#rust#disable_keymap=1
    let g:deoplete#sources#rust#documentation_max_height=20
endif

" }}}

" Easymotion {{{ "
map <leader><leader> <Plug>(easymotion-prefix)
nmap F <Plug>(easymotion-prefix)s
" }}} Easymotion "

" Fugitive.vim - Git commands {{{
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
" }}}

" FZF - Fuzzy finder {{{
no <C-Space> :FZF<CR>
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

nno ? :GFiles<CR>

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" }}}

" Gitgutter {{{
nno ]h :GitGutterNextHunk<CR>
nno [h :GitGutterPrevHunk<CR>
nnoremap <Leader>hr :GitGutterRevertHunk<CR>
nnoremap <Leader>ha :GitGutterStageHunk<CR>
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_grep_command = 'rg'
" }}}

" Language Client {{{
set hidden

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" }}}

" Latex-Suite {{{
" " "
let g:tex_flavor='latex'
let g:Tex_Env_figure="\\begin{figure}[<+htpb+>]\<cr>\\centering\<cr>\\includegraphics{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"
autocmd FileType tex let g:Tex_CompileRule_dvi = 'make'
" }}}

" Neomake {{{
" " "

if has('nvim')
    let g:neomake_open_list = 2
    call neomake#configure#automake('rw', 1000)
    " autocmd! BufWritePost,BufEnter * Neomake
endif

" }}}

" NERD Commenter {{{
" " "

nmap <Space>c <leader>c<Space>
vmap <Space>c <leader>c<Space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'handlebars': { 'left': '<!--','right': '-->' } }
let g:NERDCustomDelimiters = { 'hbs': { 'left': '<!--','right': '-->' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" }}}

" Nerdtree {{{
" " "

" Open Nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
" Close nerdtree on file open
let g:NERDTreeQuitOnOpen = 1

" }}}

" Python provider for neovim {{{
" " "
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Rust {{{
let g:rustfmt_autosave = 1
let g:autofmt_autosave = 1
" }}}

" SimpylFold {{{
let g:SimpylFold_docstring_preview=1
" }}}

" Startify {{{
let g:startify_bookmarks = [
            \ { 'b': '$HOME/.config/polybar/config' },
            \ { 'i': '$HOME/.config/i3/config' },
            \ { 'm': '$HOME/.config/mutt/muttrc' },
            \ { 't': '$HOME/.tmux.conf' },
            \ { 'v': '$HOME/.config/nvim/init.vim' },
            \ { 'z': '$HOME/.zshrc' },
            \ ]

hi StartifyHeader  ctermfg=114

let g:startify_change_to_dir = 0
let g:ctrlp_reuse_window = 'startify'

" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" Tagbar {{{
" " "
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoshowtag = 1
" Add support to rust
let g:tagbar_type_rust = {
            \ 'ctagstype' : 'rust',
            \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits,traits',
            \'i:impls,trait implementations',
            \]
            \}
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets = "<c-q>"

let g:UltiSnipsEditSplit="vertical"

set runtimepath+=~/.local/share/nvim
let g:UltiSnipsSnippetDirectories = ['snippets/UltiSnips', 'UltiSnips']
" }}}

" Vim-geeknote {{{
nmap <F9> :Geeknote<CR>
autocmd FileType geeknote setlocal nonumber
let g:GeeknoteScratchDirectory='/home/mberrio/Notes/'
" }}}

" Vim-go {{{
autocmd BufNewFile,BufRead *.go
            \ setlocal
            \ noexpandtab
            \ tabstop=4
            \ shiftwidth=4
            \ foldmethod=syntax

" Alternate between file and file_test
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Mappings
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i <Plug>(go-info)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_list_type = "quickfix"

" auto reformat code and add imports
let g:go_fmt_command = "goimports"

" Don't show window when errors occur
let g:go_fmt_fail_silently = 1

" Transform tags to camelcase
" let g:go_addtags_transform = "camelcase"

" Highlight code
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go Metalinter for error checking
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['golint']
let go_metalinter_deadline = "2s"

" Show information of function
let g:go_auto_type_info = 1

" Highlight identifiers
let g:go_auto_sameids = 1
" }}}

" Vim-hardtime {{{ "
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:hardtime_showmsg = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "Tagbar", "Help" ]
let g:hardtime_maxcount = 1
" }}} Vim-hardtime "

" Vimtex {{{ "
" let g:vimtex_latexmk_options = '-pdf -verbose -bibtex -file-line-error -synctex=1 --interaction=nonstopmode'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
" }}} Vimtex "

" Vim-markdown {{{ "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
" }}} Vim-markdown "

" Vim-mundo {{{
" nmap <F5> :MundoToggle<CR>
" Enable persistent undo so that undo history persists across vim sessions
" set undofile
" set undodir=~/.vim/undo
" }}}

" Vim-polyglot {{{ "
let g:polyglot_disabled = ['latex']
" }}} Vim-polyglot "

" vim:foldmethod=marker:foldlevel=0
