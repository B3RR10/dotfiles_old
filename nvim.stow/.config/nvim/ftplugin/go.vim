" Commands {{{ "
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}} Commands "

" Config {{{ "
let g:go_list_type = "quickfix"

" auto reformat code and add imports
let g:go_fmt_command = "goimports"

" Don't show window when errors occur
let g:go_fmt_fail_silently = 1

" Transform tags to camelcase
let g:go_addtags_transform = "camelcase"

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
" }}} Config "

" Functions {{{ "
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
" }}} Functions "

" Mappings {{{ "
nmap <leader>r <Plug>(go-run)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage-toggle)
nmap <leader>i <Plug>(go-info)
nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" }}} Mappings "

" Settings {{{ "
set noexpandtab
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
" }}} Settings "
