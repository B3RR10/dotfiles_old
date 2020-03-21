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
{%@@ if profile == "NB-MIB" @@%}

" Fix clipboard for WSL
function! PasteFromWindows()
    set paste
    exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')
    set nopaste
endfunction

if system('uname -r') =~ "Microsoft"
    noremap "+p :call PasteFromWindows()<CR>
endif
{%@@ endif @@%}
