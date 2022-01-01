local M = {}

function M.setup()
  local map = require('settings.utils').map

  map('n', '<Leader><Space>', ':Buffers<CR>', { noremap = true })
  map('n', '<Leader>f', ':Files<CR>', { noremap = true })
  map('n', '<Leader>F', ':FZF ~<CR>', { noremap = true })
  map('n', '<Leader>g', ':GFiles<CR>', { noremap = true })
  map('n', '<Leader>r', ':Rg<CR>', { noremap = true })
  map('n', '<Leader>t', ':Tags<CR>', { noremap = true })
  map('n', '<Leader>w', ':Windows<CR>', { noremap = true })

  vim.g.fzf_buffers_jump = 1
end

return M
