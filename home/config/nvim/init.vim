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

""""""""""""""""
"  Aesthetics  "
""""""""""""""""

Plug 'romainl/Apprentice', { 'branch' : 'fancylines-and-neovim' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Highlight word under cursor
Plug 'dominikduda/vim_current_word'

" To show the branch in ligtline
Plug 'itchyny/vim-gitbranch'

" Git integration (Show diff in the sign column - gutter -)
Plug 'airblade/vim-gitgutter'

" Show indentation guides
Plug 'nathanaelkane/vim-indent-guides'

"""""""""""""""""""""""
"  Lins and Complete  "
"""""""""""""""""""""""

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-neco'

" Linter
Plug 'w0rp/ale'

"""""""""""""""
"  Filetypes  "
"""""""""""""""

" C# - .NET
Plug 'OmniSharp/omnisharp-vim'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-git'

" HTML
Plug 'mattn/emmet-vim'

" Latex plugins
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'

" Markdown
Plug 'tpope/vim-markdown'

{%@@ if profile == "NB-MIB" @@%}
" PowerShell
Plug 'PProvost/vim-ps1'

{%@@ endif @@%}
" Python
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'racer-rust/vim-racer'

" Toml
Plug 'cespare/vim-toml'

" Vim
Plug 'Shougo/neco-vim'

" Yaml
Plug 'avakhov/vim-yaml'

""""""""""""
"  Editor  "
""""""""""""

" Alignment tool
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

" Comments
Plug 'tpope/vim-commentary'

" Headers
Plug 'mnabila/vim-header'

" Motions
Plug 'easymotion/vim-easymotion'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Snippets
Plug 'honza/vim-snippets'

" Surroundings
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Swap arguments in parens
Plug 'machakann/vim-swap'

" Add more vim objects
Plug 'wellle/targets.vim'

" Save persistent sessions on a workspace
Plug 'thaerkh/vim-workspace'

"""""""""""
"  Tools  "
"""""""""""

" Git mergetool
Plug 'whiteinge/diffconflicts'

" Fuzzy finder
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" Focus with :Goyo
Plug 'junegunn/goyo.vim'

" NerdTree
Plug 'preservim/nerdtree'

" Tags
Plug 'liuchengxu/vista.vim'

""""""""""
"  Misc  "
""""""""""

" Use vim power!
Plug 'takac/vim-hardtime'

" Toggle quickfix with \q and location list with \l
Plug 'milkypostman/vim-togglelist'

" Split the selected text in new window (<C-w>gss)
Plug 'wellle/visual-split.vim'

{%@@ if profile != "NB-MIB" @@%}

" Turn off caps when change from insert to normal mode
Plug 'suxpert/vimcaps'
{%@@ endif @@%}
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
" }}} Autopairs "

" coc.nvim {{{ "
let g:coc_global_extensions = [
            \   'coc-clangd',
            \   'coc-json',
            \   'coc-lists',
            \   'coc-python',
            \   'coc-rust-analyzer',
            \   'coc-snippets',
            \   'coc-texlab',
            \   'coc-vimtex',
            \   'coc-xml',
            \   'coc-yaml',
            \ ]

autocmd TextChangedI * call coc#start()

"Snippets
imap <C-j> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-q> <C-o>:CocList snippets<CR>

nnoremap <silent> <Leader>y :<C-u>CocList -A --normal yank<CR>

" GoTo code navigation
nmap gd <Plug>(coc-definition)
nmap <C-l>t <Plug>(coc-type-definition)
nmap <C-l>i <Plug>(coc-implementation)
nmap <C-l>x <Plug>(coc-references)

nmap <C-l>r <Plug>(coc-rename)

xmap <C-l>f <Plug>(coc-format-selected)
nmap <C-l>f <Plug>(coc-format-selected)

" Code actions
nmap <C-l><Space> <Plug>(coc-codeaction)
" Apply AutoFix to problem on current line
nmap <C-l>a <Plug>(coc-fix-current)

nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

nmap <C-l>c :<C-u>CocList diagnostics<CR>
nmap <C-l>o :<C-u>CocList outline<CR>
nmap <C-l>s :<C-u>CocList -I symbols<CR>
nmap <C-l>l :<C-u>CocListResume<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Create function text objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" }}} coc.nvim "

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
no <Leader>b :Buffers<CR>
no <Leader>f :Files<CR>
no <Leader>F :FZF ~<CR>
no <Leader>g :GFiles<CR>
no <Leader>r :Rg<CR>
let g:fzf_buffers_jump = 1
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}} FZF - Fuzzy finder "

" Gitgutter {{{ "
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nmap <C-h>p <Plug>(GitGutterPreviewHunk)
nmap <C-h>s <Plug>(GitGutterStageHunk)
nmap <C-h>u <Plug>(GitGutterUndoHunk)
nmap <C-h>h :GitGutterLineHighlightsToggle<CR>

" Use hunks as objects
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

let g:gitgutter_signs = 0
let g:gitgutter_highlight_linenrs = 1

highlight link GitGutterAddLineNr GitGutterAdd
highlight link GitGutterChangeLineNr GitGutterChange
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete

let g:gitgutter_grep_command = 'rg'
" }}} Gitgutter "

" Goyo {{{ "
nmap <Leader>G :Goyo<CR>
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_linenr = 1
" }}} Goyo "

" Hardtime {{{ "
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "tagbar" ]
" }}} Hardtime "

" indent-guides {{{ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}} indent-guides "

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

" Vista {{{ "
nmap <Leader>t :Vista!!<CR>
nmap <Leader>T :Vista finder<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 40
let g:vista_fold_toggle_icons = ['▸', '▾']
let g:vista_fzf_preview = ['right:50%']
" }}} Vista "

" Workspace {{{ "
let g:workspace_session_directory = $NVIM_SESSIONS_DIR
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0
let g:workspace_session_disable_on_args = 1
" }}} Workspace "
