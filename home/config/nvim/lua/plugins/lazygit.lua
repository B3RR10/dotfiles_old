local M = {}

function M.setup()
  vim.keymap.set('n', '<Leader>g', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })
end

return M
