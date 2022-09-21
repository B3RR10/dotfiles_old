local M = {}

function M.setup()
  require('mini.bufremove').setup()
  require('mini.comment').setup()
  require('mini.indentscope').setup()
  require('mini.jump').setup()
  require('mini.jump2d').setup()
  require('mini.surround').setup({
    mappings = {
      add = 'ys',
      delete = 'ds',
      replace = 'cs',
      find = 'gs',
      find_left = 'gS', -- Find surrounding (to the left)
      highlight = 'zs', -- Highlight surrounding
      update_n_lines = '', -- Update `n_lines`

      suffix_last = 'l', -- Suffix to search with "prev" method
      suffix_next = 'n', -- Suffix to search with "next" method
    },
  })
  require('mini.trailspace').setup()
end

return M
