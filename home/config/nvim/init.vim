" init.vim

" runtime! archlinux.vim

let $CONFIG_PATH = expand('$HOME/.config/nvim')

let $NVIM_PLUG_SOURCE = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
let $NVIM_PLUG_DIR = expand('$HOME/.local/share/nvim/plugged')
let $NVIM_SESSIONS_DIR = expand('$HOME/.local/share/nvim/sessions')

if empty(glob($NVIM_PLUG_SOURCE))
  silent !curl -fLo $NVIM_PLUG_SOURCE --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Pluggins {{{ "
call plug#begin($NVIM_PLUG_DIR)

" Aesthetics
Plug 'romainl/Apprentice',         { 'branch' : 'fancylines-and-neovim' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Use vim power!
Plug 'takac/vim-hardtime'

" Save persistent sessions on a workspace
Plug 'thaerkh/vim-workspace'

" Auto Headers
Plug 'mnabila/vim-header'

" Highlight word under cursor
Plug 'dominikduda/vim_current_word'

" Show indentation guides
Plug 'nathanaelkane/vim-indent-guides'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" Language Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch'                    : 'next',
    \ 'do'                    : 'bash install.sh',
    \ }

" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'racer-rust/vim-racer'

Plug 'cespare/vim-toml'
Plug 'avakhov/vim-yaml'

" C# - .NET
Plug 'OmniSharp/omnisharp-vim'

" HTML plugins
Plug 'mattn/emmet-vim'

" Markdown plugins
Plug 'tpope/vim-markdown'

" Latex plugins
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'

" Python plugins
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

{%@@ if profile == "NB-MIB" @@%}
" PowerShell
Plug 'PProvost/vim-ps1'

{%@@ endif @@%}
" Add, change and delete surroundings
Plug 'tpope/vim-surround'

" Git integration (Show diff in the sign column - gutter -)
Plug 'airblade/vim-gitgutter'

" To show the branch in ligtline
Plug 'itchyny/vim-gitbranch'

" Git syntax highlight
Plug 'tpope/vim-git'

" A better Vimdiff Git mergetool
Plug 'whiteinge/diffconflicts'

" Easy motions
Plug 'easymotion/vim-easymotion'

" Comments
Plug 'tpope/vim-commentary'

" Close quotes, parenthesis, brackets, etc automatic
Plug 'jiangmiao/auto-pairs'

"Alignment tool
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

" Fuzzy finder
{%@@ if profile == "NB-MIB" @@%}
Plug '~/.fzf'
{%@@ else @@%}
Plug '/usr/bin/fzf'
{%@@ endif @@%}
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Vim syntax
Plug 'Shougo/neco-vim'

" Linter
Plug 'w0rp/ale'

" Code completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-vim'
Plug 'ncm2/ncm2-racer'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-jedi'

" Toggle quickfix with \q and location list with \l
Plug 'milkypostman/vim-togglelist'

" CTAGS
{%@@ if profile == "NB-MIB" @@%}
Plug 'majutsushi/tagbar'
{%@@ else @@%}
Plug 'liuchengxu/vista.vim'
{%@@ endif @@%}

" NerdTree
Plug 'preservim/nerdtree'
{%@@ if profile != "NB-MIB" @@%}

" Turn off caps when change from insert to normal mode
Plug 'suxpert/vimcaps'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
{%@@ endif @@%}

" Split the selected text in new window (<C-w>gss)
Plug 'wellle/visual-split.vim'

" Add more vim objects
Plug 'wellle/targets.vim'

" Swap arguments in parens
Plug 'machakann/vim-swap'

" Focus with :Goyo
Plug 'junegunn/goyo.vim'

call plug#end()
" }}} Pluggins "

" Ale - Linter {{{ "
let g:ale_linters = {
            \ 'rust'   : ['rustup', 'run', 'stable', 'rls'],
            \ 'sh'     : ['shellcheck', 'language_server'],
            \ 'tex'    : ['chktex', 'lacheck', 'vale'],
            \ 'python' : ['pylama'],
            \ 'cs'     : ['OmniSharp'],
            \ }
let g:ale_fixers = {
            \ 'rust'   : ['rustfmt'],
            \ 'sh'     : ['shfmt'],
            \ 'tex'    : ['latexindent'],
            \ 'python' : [
            \     'isort',
            \     'autopep8',
            \     'yapf',
            \     'remove_trailing_lines',
            \   ]
            \ }
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_clippy_options = '--all-targets'
let g:ale_rust_rls_config = {
            \   'rust': {
            \     'clippy_preference': 'on'
            \   }
            \ }

let g:ale_fix_on_save = 1

nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)
" }}} Ale - Linter "

" Autopairs {{{ "
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutJump = ''
" let g:AutoPairsMapCR = 0
" imap <silent><CR> <CR><Plug>AutoPairsReturn
" }}} Autopairs "

{%@@ if profile != "NB-MIB" @@%}
" Clap {{{ "
nmap <C-S-p> :Clap<CR>
let g:clap_popup_input_delay = 0
let g:clap_insert_mode_only = 1
" }}} Clap "

{%@@ endif @@%}
" Colorscheme {{{ "
colorscheme apprentice
" }}} Colorscheme "

" EasyAlign {{{ "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} EasyAlign "

" Easymotion {{{ "
map <leader><leader> <Plug>(easymotion-prefix)
nmap F <Plug>(easymotion-prefix)s
" }}} Easymotion "

" Emmet {{{ "
" Redefine trigger key
let g:user_emmet_leader_key     = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall
" }}} Emmet "

" FZF - Fuzzy finder {{{ "
no <Leader>fb :Buffers<CR>
no <Leader>ff :Files<CR>
no <Leader>fg :GFiles<CR>
no <Leader>fh :FZF ~<CR>
no <Leader>ft :Tags<CR>
let g:fzf_buffers_jump = 1
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}} FZF - Fuzzy finder "

" Gitgutter {{{ "
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hh :GitGutterLineHighlightsToggle<CR>

" Use hunks as objects
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~_'
let g:gitgutter_grep_command = 'rg'
" }}} Gitgutter "

" Goyo {{{ "
nmap <Leader>g :Goyo<CR>
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_linenr = 1
" }}} Goyo "

" Hardtime {{{ "
let g:hardtime_default_on = 1
" }}} Hardtime "

" indent-guides {{{ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}} indent-guides "

" Language Client {{{ "
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust' : ['ra_lsp_server'],
    \ 'sh'   : ['shellcheck', 'language_server'],
    \ 'tex'  : ['texlab'],
    \ }

function! LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <leader>ld :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <leader>lr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <buffer> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <buffer> <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <buffer> <leader>lx :call LanguageClient#textDocument_references()<CR>
        nnoremap <buffer> <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <buffer> <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <buffer> <leader>lh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <buffer> <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <buffer> <leader>lm :call LanguageClient_contextMenu()<CR>
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    endif
endfunction
autocmd FileType * call LC_maps()
" }}} Language Client "

" Lightline {{{ "
let g:lightline = {}
let g:lightline.colorscheme = 'apprentice'
let g:lightline.component_function =
            \ {
            \   'gitbranch' : 'GitBranchName',
            \ }
let g:lightline.active = {
            \ 'left' : [ [ 'mode', 'paste' ],
            \            [ 'gitbranch', 'readonly', 'filename', 'modified' ],
            \            [ 'statuslinetabs' ]
            \          ]
            \ }

function! GitBranchName()
    let b:name = gitbranch#name()
    if b:name != '' && GitGutterGetHunks() != []
        return b:name . "*"
    endif
    return b:name
endfunction

let g:lightline#bufferline#show_number  = 1
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers', 'statuslinetabs': 'LightlineStatuslineTabs',}
let g:lightline.component_type   = {'buffers': 'tabsel'}

function! LightlineStatuslineTabs() abort
    return join(map(range(1, tabpagenr('$')),
                \ '(v:val == tabpagenr() ? "[*] " : "") . lightline#tab#filename(v:val)'), " \u2b81 ")
endfunction
" }}} Lightline "

" ncm2 {{{ "
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
" }}} ncm2 "

" NERDTree {{{ "
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeWinSize=60
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} NERDTree "

" OmniSharp {{{ "
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_path = '/mnt/c/Users/berriom.DMI-MS/scoop/apps/omnisharp/current/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_highlight_types = 2
" }}} OmniSharp "

" Python provider for Neovim {{{ "
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" }}} Python provider for Neovim "

{%@@ if profile == "NB-MIB" @@%}
" Tagbar {{{ "
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>t :TagbarOpen fj<CR>
let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_iconchars = ['▸', '▾']
" }}} Tagbar "

{%@@ endif @@%}
" Ultisnips {{{ "
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets = "<c-q>"

let g:UltiSnipsEditSplit="vertical"

set runtimepath+=~/.config/nvim
let g:UltiSnipsSnippetDirectories = ['snippets/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetDir = "~/.config/nvim/snippets/UltiSnips"
" }}} Ultisnips "

" vim-header {{{ "
let g:header_auto_add_header = 0
let g:header_field_author = 'Miguel Berrio'
let g:header_field_author_email = 'me@miguelberrio.xyz'
map <Leader>ah :AddHeader<CR>
" }}} vim-header "

" vimtex {{{ "
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_conrinuous = 1
" }}} vimtex "

{%@@ if profile != "NB-MIB" @@%}
" Vista {{{ "
nmap <Leader>t :Vista!!<CR>
nmap <Leader>T :Vista finder<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 40
let g:vista_fold_toggle_icons = ['▸', '▾']
let g:vista_fzf_preview = ['right:50%']
" }}} Vista "

{%@@ endif @@%}
" Workspace {{{ "
let g:workspace_session_directory = $NVIM_SESSIONS_DIR
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0
let g:workspace_session_disable_on_args = 1
" }}} Workspace "
