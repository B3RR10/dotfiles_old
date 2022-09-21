local M = {}

local function isSession()
  if vim.v.this_session ~= '' then
    return ''
  else
    return ''
  end
end

function M.setup()
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'kanagawa',
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {},
    },
    sections = {
      lualine_a = { 'mode', isSession },
      lualine_b = { 'branch' },
      lualine_c = {
        'filename',
        { 'diagnostic', sources = { 'nvim_lsp' } },
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { 'fzf', 'nvim-tree', 'quickfix', 'fugitive' },
  })
end

return M
