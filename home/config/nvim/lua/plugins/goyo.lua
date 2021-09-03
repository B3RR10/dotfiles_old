local map = require('settings.utils').map

map('n', '<Leader>G', ':Goyo<CR>', { noremap = true })

vim.g.goyo_width = 120
vim.g.goyo_height = 100
vim.g.goyo_linenr = 1

vim.cmd([[
    function! GoyoEnter()
      Limelight
    endfunction

    function! GoyoLeave()
      Limelight!
    endfunction

    autocmd! User GoyoEnter nested call GoyoEnter()
    autocmd! User GoyoLeave nested call GoyoLeave()
]])
