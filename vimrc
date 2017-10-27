" init.vim

" runtime! archlinux.vim

" ***** SETTINGS ***** {{{
" }}}

" Plugins {{{
" " "

call plug#begin('$HOME/.vim/plugged')
"--------------------------------------------------"

" UI
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline
Plug 'Lokaltog/powerline-fonts' " Required by airline
Plug 'flazz/vim-colorschemes' " Colorschemes
Plug 'chrisbra/Colorizer'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim',				{ 'for': [ 'html', 'xml', 'handlebars' ] }
Plug 'othree/html5.vim',			{ 'for': 'html' }
Plug 'gregsexton/MatchTag',			{ 'for': [ 'html', 'xml', 'handlebars' ] }
" Plug 'plasticboy/vimcmarkdown',	{ 'for': 'markdown' }
" Plug 'suan/vim-instant-markdown',	{ 'for': 'markdown' }
Plug 'tmhedberg/SimpylFold',		{ 'for': 'python' } " Fold code in Python
Plug 'vim-scripts/indentpython.vim',{ 'for': 'python' }
Plug 'rust-lang/rust.vim',			{ 'for': 'rust' } " Rust filetype *** CHECK OPTIONS ***
Plug 'racer-rust/vim-racer',		{ 'for': 'rust' }
Plug 'timonv/vim-cargo',			{ 'for': 'rust' }
Plug 'cespare/vim-toml',			{ 'for': 'toml' }
Plug 'fatih/vim-go',				{ 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdcommenter' " Commenting operations
Plug 'jiangmiao/auto-pairs'		" Close quotes, parenthesis, brackets, etc automatic
Plug 'majutsushi/tagbar'		" Browse tags of source files
Plug 'tpope/vim-surround'		" Add, change and delete surroundings

if has('nvim')
	Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
else
	Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
endif

if has('nvim')
	Plug 'benekastah/neomake'
else
	Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
endif

" Tools
Plug 'airblade/vim-gitgutter'	" Git integration (Show diff on files)
Plug 'tpope/vim-fugitive',		{ 'as': 'fugitive.vim' } " Git commands
Plug 'junegunn/gv.vim'			" Git commit browser
Plug 'scrooloose/nerdtree',		{ 'on':	'NERDTreeToggle' }
Plug 'simnalamburt/vim-mundo'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'	" Alignment tool
Plug 'godlygeek/tabular'		" Auto indent
Plug 'tpope/vim-repeat'			" Repeat last command (Also when it's a plugin-map)
Plug 'vim-scripts/Rename'		" Rename buffer and file on disk
Plug 'suxpert/vimcaps'			" Turn off caps when change from insert to normal mode
Plug 'easymotion/vim-easymotion' " Easy motions
Plug 'junegunn/fzf',			{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neilagabriel/vim-geeknote'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'

if has('nvim')
	Plug ('Shougo/deoplete.nvim'),			{ 'do': ':UpdateRemotePlugins' } " Code completion
	Plug 'sebastianmarkow/deoplete-rust',	{ 'for': 'rust' }
	Plug 'zchee/deoplete-go', { 'do': 'make'}
else
	Plug 'Valloric/YouCompleteMe',			{ 'do': './install.py --racer-completer' }
endif

" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
"--------------------------------------------------"
call plug#end()
" }}}

" Abbreviations {{{
" " "

au FileType java,c,cpp abbrev if if() {<CR><++><CR>}<CR><++><esc>kkki
au FileType java,c,cpp,perl abbrev while while() {<CR><++><CR>}<CR><++><esc>kkkwa
au FileType java,c,cpp abbrev for for() {<CR><++><CR>}<CR><++><esc>kkka
au FileType java,c,cpp abbrev /*<CR> /*<CR> *<CR> */<esc>kA
au FileType vim abbrev =header= "<CR>" "<esc>kA
" }}}

" Autocommands {{{
" " "

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested :source $MYVIMRC
	autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END

" Autoremove trailing white spaces spaces
autocmd BufWritePre * silent! %s/\s\+$//ge
autocmd BufWritePre * %retab!

au FileType sh,bash,perl,python,ruby nno <leader>ex :! chmod +x %<CR>
" au BufWritePost * execute ':silent ! if git rev-parse --git-dir > /dev/null 2>&1 ; then git add % ; git commit -m "Auto-commit: saved %"; fi > /dev/null 2>&1'
au InsertEnter * set nornu
au InsertLeave * set rnu

" Highlight instances of the word
autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" return to last edit position when opening files
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\ endif

" }}}

" Colorscheme {{{
" " "

set background=dark
colorscheme wombat256i
highlight Comment cterm=italic
" }}}

" Funktions {{{
" " "

" Autohighlight ocurrences of the current word
" " "
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
"	  let @/ = ''
"	  if exists('#auto_highlight')
"		  au! auto_highlight
"		  augroup! auto_highlight
"		  setl updatetime=4000
"		  echo 'Highlight current word: off'
"		  return 0
"		else
"		  augroup auto_highlight
"			  au!
"			  au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"		  augroup end
"		  setl updatetime=500
"		  echo 'Highlight current word: ON'
"		  return 1
"	  endif
" endfunction
"
"
set updatetime=500

function! HighlightWordUnderCursor()
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
		exec 'match' 'underlined' '/\V\<'.expand('<cword>').'\>/'
	else
		match none
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
ino <C-q> <Esc>
nno <C-q> <Esc>
vno <C-q> <Esc>
vno <Space><Space> <Esc>

" Fast commands
nno <leader>w :w<CR>
nno <leader>sw :w !sudo tee %<CR>
" nno <leader>so :so %<cr>
nmap <leader>q :q!<cr>
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>

" Precision editing
nno <leader>rl :set rnu!<CR>
nno <leader>s :set spell!<CR>
"cul! cuc! rnu!
nno <leader>de :set spelllang=de_de<CR>
nno <leader>en :set spelllang=en_us<CR>
nno <leader>es :set spelllang=es_mx<CR>

" Move through buffers
nno <silent> ;j :bn<CR>
nno <silent> ;k :bp<CR>
nno <silent> ;q :bdelete<CR>

" Tabs
nno <silent> ;h :tabp<CR>
nno <silent> ;l :tabn<CR>
nno <Tab> :tabn<CR>
nno <S-Tab> :tabp<CR>

nno <silent> <leader>1 1gt<cr>
nno <silent> <leader>2 2gt<cr>
nno <silent> <leader>3 3gt<cr>
nno <silent> <leader>4 4gt<cr>
nno <silent> <leader>5 5gt<cr>

" Windows
no <leader>vn :vsplit<CR>
no <leader>Vn :vsplit
no <leader>hn :split<CR>
no <leader>Hn :split

no <C-j> <C-W>j
no <C-k> <C-W>k
no <C-h> <C-W>h
no <C-l> <C-W>l

no <leader>j <C-W>j
no <leader>k <C-W>k
no <leader>h <C-W>h
no <leader>l <C-W>l

no <leader>vq <C-W>q
no <leader>vl :vertical resize +10<CR>
no <leader>vh :vertical resize -10<CR>
no <leader>vj :res +10<CR>
no <leader>vk :res -10<CR>

" Moving characters
nno L xp
nno H Xph

" Replace all
nno <leader>ra :%s/

" Open new tab
nno <leader>tn :tabnew<CR>
nno <leader>Tn :tabnew

" Move through wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
nmap <silent> j gj
nmap <silent> k gk
vmap <silent> j gj
vmap <silent> k gk

" Return to visual selection when indenting
vno < <gv
vno > >gv

" Move to next instance of the word
no <Space>j *
no <Space>k #

" Move faster through text
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

" Select all text
map <Space>a ggvG

" Copy until the end of the line
no Y y$

" Clean search highligt
no <silent> <leader>/ :nohlsearch<CR>
no <silent> <Space><Space> :nohlsearch<CR>

" Edit .vimrc
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Folding settings
nno <Space>f za

" Misc
nno K i<CR><Esc>
inoremap <C-j> <Esc>/<+\w*+><CR><Esc>cf>
inoremap <C-k> <Esc>?<+\w*+><CR><Esc>cf>

" }}}

" Settings {{{
" " "

" backups, undos, swaps
set nobackup
set noswapfile

" clipboard
set clipboard+=unnamedplus

" encoding
set encoding=utf-8

" errorbells
set noerrorbells
set visualbell

" folding
set foldmethod=indent
set foldlevel=99

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

" remember info about open buffers on close
" set viminfo^=%

" Required by Latex-Suite
set grepprg=grep\ -nH\ $*		" Required by Latex-Suite
set shellslash					" Required by Latex-Suite

" searching
set ignorecase
set incsearch

" sidescroll
set sidescrolloff=15
set sidescroll=1

" style of divider
autocmd ColorScheme * hi VertSplit cterm=NONE ctermbg=NONE ctermfg=green

" tabs
set ls=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" trails
set list
" set listchars=tab:→\ ,trail:·,precedes:«,extends:»,nbsp:·
set listchars=tab:\|\ ,trail:·,precedes:«,extends:»,nbsp:·

" ui
set autoread
set hidden
set nu
set rnu
set scrolloff=15

" windows
set splitbelow
set splitright

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

let g:airline_theme='wombat'
" }}}

" ctrlp.vim Fuzzy search {{{
" " "
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'Cargo.toml']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}

" DelimitMATE {{{

" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1
" let delimitMate_jump_expansion = 1
" }}}

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

" Fugitive.vim - Git commands {{{
nmap <leader>g :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
" }}}

" FZF - Fuzzy finder {{{
no <C-p> :FZF<CR>
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
\ { 'fg':	   ['fg', 'Normal'],
  \ 'bg':	   ['bg', 'Normal'],
  \ 'hl':	   ['fg', 'Comment'],
  \ 'fg+':	   ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':	   ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':	   ['fg', 'Statement'],
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
	autocmd! BufWritePost,BufEnter * Neomake
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

" Notes Plug {{{
" " "
let g:notes_directories = ['~/Notes']
let g:notes_sufix = '.md'
let g:notes_title_sync = 'change_title'
" }}}

" Python provider for neovim {{{
" " "
let g:python_host_prog	= '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
" }}}

" SimpylFold {{{
let g:SimpylFold_docstring_preview=1
" }}}

" Startify {{{
let g:startify_bookmarks = [
			\ { 'b': '$HOME/.config/polybar/config' },
			\ { 'i': '$HOME/.config/i3/config' },
			\ { 't': '$HOME/.tmux.conf' },
			\ { 'v': '$HOME/.vimrc' },
			\ { 'z': '$HOME/.zshrc' },
			\ ]

hi StartifyHeader  ctermfg=114

let g:startify_change_to_dir = 0
let g:ctrlp_reuse_window = 'startify'

" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" Syntastic {{{
" " "

if !has('nvim')
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_rust_checkers = ['cargo']
	let g:syntastic_aggregate_errors = 1
endif

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

" Vim-mundo {{{
nmap <F5> :MundoToggle<CR>
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
" }}}

" YouCompleteMe {{{
" " "
if !has('nvim')
	  let g:ycm_python_binary_path = 'python'
	  let g:ycm_server_python_interpreter = 'python'
	  let g:ycm_rust_src_path = '/home/mberrio/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
endif

" }}}

" vim:foldmethod=marker:foldlevel=0
