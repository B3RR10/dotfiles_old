local M = {}

function M.setup()
  require('indent_blankline').setup({
    use_treesitter = true,
    show_current_context = true,
    show_trailing_blankline_indent = false,
    filetype_exclude = { 'NvimTree', 'help' },
    buftype_exclude = { 'terminal' },
  })
end

return M