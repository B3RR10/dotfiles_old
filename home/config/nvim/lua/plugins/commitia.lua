local M = {}

local map = require('settings.utils').map

function M.setup()
  vim.g.committia_hooks = {
    edit_open = function(_)
      vim.opt_local.spell = true

      map('i', '<C-d>', '<Plug>(committia-scroll-diff-down-half)')
      map('i', '<C-u>', '<Plug>(committia-scroll-diff-up-half)')
    end,
  }

  -- function vim.g.committia_hooks.edit_open(info)
  --   print('Commitia!!!')
  -- end
end

return M
