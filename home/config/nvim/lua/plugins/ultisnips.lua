local M = {}

function M.setup()
  vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
  vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
  vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
  vim.g.UltiSnipsListSnippets = '<c-q>'

  vim.g.UltiSnipsRemoveSelectModeMappings = 0

  vim.g.UltiSnipsEditSplit = 'vertical'

  vim.cmd([[set runtimepath+=~/.config/nvim]])
end

return M
