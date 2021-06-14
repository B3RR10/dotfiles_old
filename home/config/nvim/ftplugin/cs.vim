" Settings {{{"
set foldmethod=syntax
set foldnestmax=5
" }}} Settings"

" autocmd CursorHold *.cs OmniSharpTypeLookup

" OmniSharp maps {{{"
nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap gD :OmniSharpFindImplementations<CR>
nnoremap gr :OmniSharpFindUsages<CR>
nnoremap gt :OmniSharpTypeLookup<CR>
nnoremap <leader>rn :OmniSharpRename<CR>
nnoremap K :OmniSharpDocumentation<CR>
nnoremap gF :OmniSharpCodeFormat<CR>

nnoremap g<Space> :OmniSharpGetCodeActions<CR>
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
" Run code actions with text selected in visual mode to extract method
xnoremap g<Space> :call OmniSharp#GetCodeActions('visual')<CR>

nnoremap gx :OmniSharpFixUsings<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
nnoremap <C-l>c :OmniSharpGlobalCodeCheck<CR>

nnoremap [[ :OmniSharpNavigateUp<CR>
nnoremap ]] :OmniSharpNavigateDown<CR>
" }}} OmniSharp maps"
