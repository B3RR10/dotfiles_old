" Reload init.vim after any change in the config
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested :source $MYVIMRC
    autocmd BufWritePost $HOME/.config/nvim/**/*.vim nested :source $MYVIMRC
augroup END

" Autoremove trailing white spaces spaces and convert tabs in spaces
function! StripWhiteSpaces()
    if &ft =~ 'gitcommit\|diff'
    return
    endif
    mark s
    %s/\s\+$//e
    's
    delmarks s
endfunction
" autocmd BufWritePre * silent! %s/\s\+$//ge
autocmd BufWritePre * silent! call StripWhiteSpaces()
autocmd BufWritePre * %retab!

" Show relative numbers in normal mode
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

" Allow comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Disable fold in commit buffers
autocmd FileType gitcommit set nofoldenable
