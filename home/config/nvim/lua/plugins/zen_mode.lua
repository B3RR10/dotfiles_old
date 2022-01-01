local M = {}

function M.setup()
  require('zen-mode').setup({
    window = {
      options = {
        signcolumn = 'no',
        number = true,
        relativenumber = true,
        cursorline = true,
        cursorcolumn = false,
        foldcolumn = '0',
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = true,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = true },
      kitty = {
        enabled = true,
        font = '+8',
      },
    },
  })

  local map = require('settings.utils').map
  map('n', '<Leader>z', ':ZenMode<CR>', { noremap = true })
end

return M
