local M = {}

function M.setup()
  local map = require('settings.utils').map

  vim.g.nvim_tree_highlight_opened_files = 2
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_group_empty = 1

  require('nvim-tree').setup({
    update_cwd = true,
    update_focused_file = {
      enable = true,
      ignore_list = { '.git', 'node_modules', '.cache' },
    },
    view = {
      width = '25%',
      side = 'left',
      number = true,
      relativenumber = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })

  map('n', '<C-p>', ':NvimTreeToggle<CR>')
end

return M
