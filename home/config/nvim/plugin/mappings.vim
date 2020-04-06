" Escape commands
ino jk <Esc>
ino JK <Esc>
cno jk <Esc>
cno JK <Esc>
nno <C-q> <Esc>
vno <C-q> <Esc>

" Moving characters
nno L xp
nno H Xph

" Return to visual selection when indenting
vno < <gv
vno > >gv

" Copy until the end of the line
no Y y$

" Close preview window
nno <silent> <leader>p :pclose<CR>
