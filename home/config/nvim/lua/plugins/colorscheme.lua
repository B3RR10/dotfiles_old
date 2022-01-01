local M = {}

function M.setup()
  vim.cmd([[
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  ]])
  vim.opt.termguicolors = true

  vim.cmd('colorscheme apprentice')
end

return M
