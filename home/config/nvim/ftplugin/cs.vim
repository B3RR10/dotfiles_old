" Settings {{{"
set foldmethod=syntax
set foldnestmax=5
" }}} Settings"

" autocmd CursorHold *.cs OmniSharpTypeLookup

" OmniSharp maps {{{"
nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <C-l>i :OmniSharpFindImplementations<CR>
nnoremap <C-l>s :OmniSharpFindSymbol<CR>
nnoremap <C-l>u :OmniSharpFindUsages<CR>

" Finds members in the current buffer
nnoremap <C-l>m :OmniSharpFindMembers<CR>

nnoremap <C-l>x :OmniSharpFixUsings<CR>
nnoremap <C-l>t :OmniSharpTypeLookup<CR>
nnoremap K :OmniSharpDocumentation<CR>
nnoremap <C-\> :OmniSharpSignatureHelp<CR>
inoremap <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
nnoremap [[ :OmniSharpNavigateUp<CR>
nnoremap ]] :OmniSharpNavigateDown<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
nnoremap <C-l>c :OmniSharpGlobalCodeCheck<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <C-l><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <C-l><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <C-l>r :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <C-l>f :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <C-l>ss :OmniSharpStartServer<CR>
nnoremap <C-l>sp :OmniSharpStopServer<CR>
" }}} OmniSharp maps"
