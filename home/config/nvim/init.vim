" init.vim
scriptencoding utf-8

" runtime! archlinux.vim

let $CONFIG_PATH = expand('$HOME/.config/nvim')

let $NVIM_PLUG_SOURCE = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
let $NVIM_PLUG_DIR = expand('$HOME/.local/share/nvim/plugged')

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
Plug 'sainnhe/lightline_foobar.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'

" Highlight word under cursor
Plug 'dominikduda/vim_current_word'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" Show indentation guides
Plug 'nathanaelkane/vim-indent-guides'

"""""""""""""""""""""""""""
"  Linter and Completion  "
"""""""""""""""""""""""""""

" Language Client
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

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

{%@@ if profile == "work" @@%}
" PowerShell
Plug 'PProvost/vim-ps1'

{%@@ endif @@%}
" Python
Plug 'tmhedberg/SimpylFold'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

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
Plug 'tpope/vim-unimpaired'

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

" Ledger
Plug 'ledger/vim-ledger'

" NerdTree
Plug 'preservim/nerdtree'

" Tags
Plug 'liuchengxu/vista.vim'

" Taskwarrior integration.
Plug 'tools-life/taskwiki'

" Wiki
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vimwiki-sync'

" Zettelkasten
Plug 'michal-h21/vim-zettel'

""""""""""
"  Misc  "
""""""""""

" Toggle quickfix with \q and location list with \l
Plug 'milkypostman/vim-togglelist'

" Split the selected text in new window (<C-w>gss)
Plug 'wellle/visual-split.vim'
{%@@ if profile != "work" @@%}

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
            \ 'vim'    : ['vint'],
            \ 'ruby'   : ['solargraph']
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
    autocmd FileType html,css,xml,eruby EmmetInstall
augroup END
" }}} Emmet "

" FZF - Fuzzy finder {{{ "
no <Leader><Space> :Buffers<CR>
no <Leader>f :Files<CR>
no <Leader>F :FZF ~<CR>
no <Leader>g :GFiles<CR>
no <Leader>r :Rg<CR>
no <Leader>t :Tags<CR>
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
endfunction

function! GoyoAfter()
  :Limelight!
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

" nvim-lsp {{{ "
lua << EOF
local ncm2 = require('ncm2')
-- vim
require'lspconfig'.vimls.setup{on_init = ncm2.register_lsp_source}
-- bash
require'lspconfig'.bashls.setup{on_init = ncm2.register_lsp_source}
-- ruby
require'lspconfig'.solargraph.setup{on_init = ncm2.register_lsp_source}
-- python
require'lspconfig'.jedi_language_server.setup{on_init = ncm2.register_lsp_source}
-- rust
require'lspconfig'.rust_analyzer.setup{on_init = ncm2.register_lsp_source}
-- tex
-- require'lspconfig'.texlab.setup{on_init = ncm2.register_lsp_source}
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gF <cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>
nnoremap <silent> <Leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" }}} nvim-lsp "

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
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeCascadeSingleChildDir=1
let g:NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeDirArrows=1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=60
augroup NERDTree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" }}} NERDTree "

" OmniSharp {{{ "
let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_lookup_metadata = 0
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_translate_cygwin_wsl = 1
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
nmap <Leader>T :Vista!!<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_close_on_jump = 1
let g:vista_sidebar_width = 40
let g:vista_fold_toggle_icons = ['▸', '▾']
let g:vista_fzf_preview = ['right:50%']
" }}} Vista "

" vimwiki {{{ "
let wiki = {}
let wiki.path = ''
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.links_space_char = '_'
let wiki.auto_tags = 1
let wiki.auto_diary_index = 1
let wiki.auto_generate_links = 1
" let wiki.auto_generate_tags = 1

let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_conceallevel = 0
let g:vimwiki_auto_chdir = 1

command! Diary VimwikiDiaryIndex

"" Lame adaptation of Josh's buffer file here:
""  https://gist.github.com/dphase/1792d67b4ac06aea11a49ed801f18a7e
function! s:DScratch()
  exe 'edit ~/vimwiki/Scratch Buffer.md'
endfunction
command! Scratch call s:DScratch(<f-args>)
" }}} vimwiki "

" Workspace {{{ "
let g:workspace_autocreate = 0
let g:workspace_session_name = 'session.vim'
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave_ignore = [ 'gitcommit', 'NERD.*', '__vista__' ]
" }}} Workspace "

" vim-zettel {{{ "
let g:zettel_options = [{'front_matter' : [['tags', ''], ['type', 'note']],
            \ 'template' : glob($CONFIG_PATH) . '/zettel.tpl'}]

let g:zettel_fzf_command = 'rg --column --line-number --ignore-case --no-heading --color=always '
let g:zettel_format = '%y%m%d-%H%M-%title'
" }}} vim-zettel "
