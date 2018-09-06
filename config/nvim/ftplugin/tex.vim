" Neomake {{{ "
let g:neomake_tex_enabled_makers=['chktex']
" }}} Neomake "

" Vimtex {{{ "
" let g:vimtex_latexmk_options = '-pdf -verbose -bibtex -file-line-error -synctex=1 --interaction=nonstopmode'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

let g:vimtex_view_method = 'zathura'

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" }}} Vimtex "

