local M = {}

function M.setup()
  local map = require('settings.utils').map

  map('n', '<C-p>', ':RnvimrToggle<CR>', { noremap = true, silent = true })
  map('t', '<C-p>', [[<C-\><C-n>:RnvimrToggle<CR>]], { noremap = true, silent = true })
  map('t', '<C-s>', [[<C-\><C-n>:RnvimrResize<CR>]], { noremap = true })

  vim.g.rnvimr_enable_ex = 1
  vim.g.rnvimr_enable_picker = 1
  vim.g.rnvimr_enable_bw = 1
end

return M
