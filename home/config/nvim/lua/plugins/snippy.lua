local M = {}

function M.setup()
  require('snippy').setup({
    hl_group = 'Search',
  })

  vim.cmd([[set runtimepath+=~/.config/nvim]])
end
return M
