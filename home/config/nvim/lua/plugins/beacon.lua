local M = {}

function M.setup()
  local map = require('settings.utils').map

  map('n', 'n', 'n:Beacon<CR>', { noremap = true })
  map('n', 'N', 'N:Beacon<CR>', { noremap = true })
  map('n', '*', '*:Beacon<CR>', { noremap = true })
  map('n', '#', '#:Beacon<CR>', { noremap = true })
end

return M
