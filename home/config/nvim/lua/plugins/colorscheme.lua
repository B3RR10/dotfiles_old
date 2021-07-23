vim.cmd([[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]])
vim.opt.termguicolors = true

-------------------
--  Colorscheme  --
-------------------
vim.cmd 'colorscheme apprentice'

---------------
--  Lualine  --
---------------
local apprentice = require('plugins.apprentice')

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = apprentice,
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename', {'diagnostic', sources = {'nvim_lsp'}}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fzf', 'nvim-tree', 'quickfix', 'fugitive' }
}
