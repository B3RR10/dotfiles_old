local M = {}

function M.setup()
  local map = require('settings.utils').map

  vim.g.vista_sidebar_width = 60

  vim.g.vista_default_executive = 'ctags'
  vim.g.vista_executive_for = {
    lua = 'nvim_lsp',
    rust = 'nvim_lsp',
    sh = 'nvim_lsp',
  }

  vim.g.vista_fzf_preview = { 'right:50%' }

  map('n', '<Leader>t', ':Vista!!<CR>')
end

return M
