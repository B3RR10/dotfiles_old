" Config {{{ "
let g:rustfmt_autosave = 1
let g:autofmt_autosave = 1
" }}} Config "

" Deoplete - Completion framework {{{ "
let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20
" }}} Deoplete - Completion framework "

" Mappings {{{ "
nmap <leader>r :CargoRun<CR>
nmap <leader>t :CargoTest<CR>
nmap <leader>b :CargoBuild<CR>
" }}} Mappings "

" Settings {{{ "
set foldmethod=syntax
" }}} Settings "

" Tagbar {{{ "
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
" }}} Tagbar "
