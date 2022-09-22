local M = {}

function M.setup()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require('windows').setup()
end

return M
