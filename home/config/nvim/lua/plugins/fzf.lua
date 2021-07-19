local map = require('settings.utils').map

map('n', '<Leader><Space>', ':Buffers<CR>', { noremap = true })
map('n', '<Leader>f', ':Files<CR>', { noremap = true })
map('n', '<Leader>F', ':FZF ~<CR>', { noremap = true })
map('n', '<Leader>g', ':GFiles<CR>', { noremap = true })
map('n', '<Leader>r', ':Rg<CR>', { noremap = true })
map('n', '<Leader>t', ':Tags<CR>', { noremap = true })
map('n', '<Leader>w', ':Windows<CR>', { noremap = true })

vim.g.fzf_buffers_jump = 1
--vim.api.nvim_command([[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)]])
