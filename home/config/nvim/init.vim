" init.vim

" runtime! archlinux.vim

let $CONFIG_PATH = expand('$HOME/.config/nvim')

let $NVIM_PLUG_SOURCE = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
let $NVIM_PLUG_DIR = expand('$HOME/.local/share/nvim/plugged')
let $NVIM_SESSIONS_DIR = expand('$HOME/.local/share/nvim/sessions/')

if empty(glob($NVIM_PLUG_SOURCE))
  silent !curl -fLo $NVIM_PLUG_SOURCE --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup install_plugins
      autocmd!
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

" Pluggins {{{ "
call plug#begin($NVIM_PLUG_DIR)

""""""""""""""""
"  Aesthetics  "
""""""""""""""""

Plug 'romainl/Apprentice', { 'branch' : 'fancylines-and-neovim' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'

" Highlight word under cursor
Plug 'dominikduda/vim_current_word'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Show indentation guides
Plug 'nathanaelkane/vim-indent-guides'

"""""""""""""""""""""""""""
"  Linter and Completion  "
"""""""""""""""""""""""""""

" Language Client
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" Autocompletion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'wellle/tmux-complete.vim'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-vim-lsp'

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
Plug 'matze/vim-tex-fold'

" Markdown
Plug 'tpope/vim-markdown'

{%@@ if profile == "NB-MIB" @@%}
" PowerShell
Plug 'PProvost/vim-ps1'

{%@@ endif @@%}
" Python
Plug 'tmhedberg/SimpylFold'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'racer-rust/vim-racer'

" Toml
Plug 'cespare/vim-toml'

" Vim
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

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
Plug 'SirVer/ultisnips'
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
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-pencil', { 'on': 'Goyo' }

" NerdTree
Plug 'preservim/nerdtree'

" Tags
Plug 'liuchengxu/vista.vim'

" Taskwarrior integration.
Plug 'tools-life/taskwiki'

" Wiki
Plug 'vimwiki/vimwiki'

""""""""""
"  Misc  "
""""""""""

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
            \ 'rust'   : ['analyzer', 'cargo'],
            \ 'sh'     : ['shellcheck', 'language_server'],
            \ 'tex'    : ['chktex', 'lacheck', 'vale'],
            \ 'python' : ['pyls'],
            \ 'cs'     : ['OmniSharp'],
            \ 'vim'    : ['vint']
            \ }
let g:ale_vim_vimls_executable = '$HOME/.local/share/vim-lsp-settings/servers/vim-language-server/vim-language-server'
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

let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_rust_cargo_use_clippy = 1

let g:ale_fix_on_save = 1

nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)
" }}} Ale - Linter "

" Autopairs {{{ "
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutJump = ''
" }}} Autopairs "

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
augroup emmet_install
    autocmd!
    autocmd FileType html,css,xml EmmetInstall
augroup END
" }}} Emmet "

" FZF - Fuzzy finder {{{ "
no <Leader><Space> :Buffers<CR>
no <Leader>f :Files<CR>
no <Leader>F :FZF ~<CR>
no <Leader>g :GFiles<CR>
no <Leader>r :Rg<CR>
no <Leader>w :Windows<CR>
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

let g:gitgutter_signs = 1

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'

let g:gitgutter_grep_command = 'rg'
" }}} Gitgutter "

" Goyo {{{ "
nmap <Leader>G :Goyo<CR>
let g:goyo_width = 120
let g:goyo_height = 100
let g:goyo_linenr = 1

function! GoyoBefore()
  :Limelight
  :PencilSoft
endfunction

function! GoyoAfter()
  :Limelight!
  :PencilOff
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
" }}} Goyo "

" indent-guides {{{ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}} indent-guides "

" Lightline {{{ "
let g:lightline = {}
let g:lightline.colorscheme = 'apprentice'
let g:lightline.component =
            \ {
            \   'gitbranch': '%{fugitive#head()}',
            \ }
let g:lightline.active =
            \ {
            \   'left' :
            \     [
            \       [ 'mode', 'paste' ],
            \       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
            \       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'  ]
            \     ],
            \ }

let g:lightline#bufferline#show_number  = 1
let g:lightline.tabline =
            \ {
            \   'left': [[ 'buffers' ]],
            \   'right': [[ 'statuslinetabs' ]]
            \ }
let g:lightline.component_expand =
            \ {
            \   'buffers': 'lightline#bufferline#buffers',
            \   'statuslinetabs': 'LightlineStatuslineTabs',
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_infos': 'lightline#ale#infos',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \ }
let g:lightline.component_type   =
            \ {
            \   'buffers': 'tabsel',
            \   'linter_checking': 'right',
            \   'linter_infos': 'right',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'right',
            \ }

function! LightlineStatuslineTabs() abort
    return join(map(range(1, tabpagenr('$')),
                \ '(v:val == tabpagenr() ? "[*] " : "[ ] ") . lightline#tab#filename(v:val)'), ' | ')
endfunction
" }}} Lightline "

" vim-lsp {{{ "
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    autocmd!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    autocmd FileType rust setlocal omnifunc=lsp#complete
augroup END

" }}} vim-lsp "

" vim-markdown {{{ "
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1
" }}} vim-markdown "

" ncm2 {{{ "
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <silent> <Plug>(MyCR) <CR><C-R>=AutoPairsReturn()<CR>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<CR>" : "\<CR>\<C-R>=AutoPairsReturn()\<CR>")

set completeopt=noinsert,menuone,noselect

augroup ncm2
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END

let g:ncm2#complete_length = 2
" }}} ncm2 "

" NERDTree {{{ "
nmap <C-p> :NERDTreeToggleVCS<CR>
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeWinSize=60
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
augroup NERDTree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
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

" Ultisnips {{{ "
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsListSnippets = '<c-q>'

let g:UltiSnipsEditSplit='vertical'

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
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build'
            \ }
" }}} vimtex "

" Vista {{{ "
nmap <Leader>t :Vista!!<CR>
nmap <Leader>T :Vista finder<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_close_on_jump = 1
let g:vista_sidebar_width = 40
let g:vista_fold_toggle_icons = ['▸', '▾']
let g:vista_fzf_preview = ['right:50%']
" }}} Vista "

" vimwiki {{{ "
let g:vimwiki_list =
            \ [
            \   { 'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', },
            \ ]
let g:vimwiki_global_ext = 0

function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction

function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction

nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>

command! Diary VimwikiDiaryIndex
"" Lame adaptation of Josh's buffer file here:
""  https://gist.github.com/dphase/1792d67b4ac06aea11a49ed801f18a7e
function! s:DScratch()
  exe 'edit ~/vimwiki/Scratch Buffer.md'
endfunction
command! Scratch call s:DScratch(<f-args>)
" }}} vimwiki "

" Workspace {{{ "
let g:workspace_session_name = 'session.vim'
let g:workspace_autocreate = 1
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave_ignore = [ 'gitcommit', 'NERD.*', '__vista__' ]
" }}} Workspace "
