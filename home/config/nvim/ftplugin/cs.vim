" Settings {{{"
set foldmethod=syntax
set foldnestmax=5
set foldlevelstart=2
set foldopen=all
set foldclose=all
" }}} Settings"

" autocmd CursorHold *.cs OmniSharpTypeLookup

" OmniSharp maps {{{"
nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <Leader>oi :OmniSharpFindImplementations<CR>
nnoremap <Leader>os :OmniSharpFindSymbol<CR>
nnoremap <Leader>ou :OmniSharpFindUsages<CR>

" Finds members in the current buffer
nnoremap <Leader>om :OmniSharpFindMembers<CR>

nnoremap <Leader>ox :OmniSharpFixUsings<CR>
nnoremap <Leader>ot :OmniSharpTypeLookup<CR>
nnoremap K :OmniSharpDocumentation<CR>
nnoremap <C-\> :OmniSharpSignatureHelp<CR>
inoremap <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
nnoremap [[ :OmniSharpNavigateUp<CR>
nnoremap ]] :OmniSharpNavigateDown<CR>

" Find all code errors/warnings for the current solution and populate the quickfix window
nnoremap <Leader>oc :OmniSharpGlobalCodeCheck<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>or :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>of :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>oss :OmniSharpStartServer<CR>
nnoremap <Leader>osp :OmniSharpStopServer<CR>
" }}} OmniSharp maps"
