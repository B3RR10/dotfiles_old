local M = {}

function M.setup()
  local fzf = require('fzf-lua')

  vim.keymap.set('n', '<Leader><Space>', function()
    fzf.buffers()
  end, { noremap = true, desc = 'Fzf Buffers' })
  vim.keymap.set('n', '<Leader>f', function()
    fzf.files()
  end, { noremap = true, desc = 'Fzf Files' })
  vim.keymap.set('n', '<Leader>F', function()
    fzf.files({ cwd = '~/' })
  end, { noremap = true, desc = 'Fzf Files ~' })
  vim.keymap.set('n', '<Leader><Leader>', function()
    fzf.builtin()
  end, { noremap = true, desc = 'Fzf builtin commands' })

  vim.keymap.set('n', '<Leader>r', function()
    fzf.live_grep({ cmd = "rg --color=always --smart-case -g '!{.git,node_modules}/'" })
  end, { noremap = true, desc = 'Fzf RG' })
end

return M
