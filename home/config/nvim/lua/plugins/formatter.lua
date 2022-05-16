local M = {}

local util = require('formatter.util')

function M.setup()
  require('formatter').setup({
    filetype = {
      css = { require('formatter.filetypes.css').prettier },
      html = { require('formatter.filetypes.html').prettier },
      javascript = { require('formatter.filetypes.javascript').prettier },
      json = { require('formatter.filetypes.json').prettier },
      lua = { require('formatter.filetypes.lua').stylua },
      python = {
        require('formatter.filetypes.python').isort,
        require('formatter.filetypes.python').autopep8,
        require('formatter.filetypes.python').yapf,
      },
      ruby = { require('formatter.filetypes.ruby').rubocop },
      rust = { require('formatter.filetypes.rust').rustfmt },
      sh = {
        function()
          return {
            exe = 'shfmt',
            args = {
              '-i',
              vim.api.nvim_buf_get_option(0, 'shiftwidth'),
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
          }
        end,
      },
      typescript = { require('formatter.filetypes.typescript').prettier },
      tex = {
        function()
          return {
            exe = 'latexindent',
            args = { '-g /dev/stderr', '2>/dev/null' },
            stdin = true,
          }
        end,
      },
    },
  })

  local formatGrp = vim.api.nvim_create_augroup('FormatterAutocmd', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*' },
    command = 'FormatWrite',
    group = formatGrp,
  })
end

return M
