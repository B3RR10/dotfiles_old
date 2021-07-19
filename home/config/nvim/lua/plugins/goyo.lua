local map = require('settings.utils').map

map('n', '<Leader>G', ':Goyo<CR>', { noremap = true })

vim.g.goyo_width = 120
vim.g.goyo_height = 100
vim.g.goyo_linenr = 1

vim.cmd([[
    function! GoyoBefore()
      :Limelight
    endfunction

    function! GoyoAfter()
      :Limelight!
    endfunction
]])

vim.g.goyo_callbacks = { [[function('GoyoBefore')]], [[function('GoyoAfter')]] }
