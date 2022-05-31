local M = {}

function M.setup()
  local map = require('settings.utils').map

  require('nvim-tree').setup({
    update_cwd = true,
    update_focused_file = {
      enable = true,
      ignore_list = { '.git', 'node_modules', '.cache' },
    },
    view = {
      width = '20%',
      number = true,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
      highlight_opened_files = 'name',
      highlight_git = true,
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
