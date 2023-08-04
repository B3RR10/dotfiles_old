local M = {}

local util = require('formatter.util')

function M.setup()
  local filetypes = require('formatter.filetypes')
  require('formatter').setup({
    filetype = {
      cs = { filetypes.cs.dotnetformat },
      css = { filetypes.css.prettier },
      fsharp = {
        function()
          return {
            exe = 'fantomas',
            args = {
              '--stdout',
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
          }
        end,
      },
      html = { filetypes.html.prettier },
      javascript = { filetypes.javascript.prettier },
      json = { filetypes.json.prettier },
      lua = { filetypes.lua.stylua },
      markdown = { filetypes.markdown.prettier },
      python = {
        filetypes.python.isort,
        filetypes.python.autopep8,
        filetypes.python.yapf,
      },
      rust = { filetypes.rust.rustfmt },
      sh = { filetypes.sh.shfmt },
      tex = { filetypes.latex.latexindent },
      toml = { filetypes.toml.taplo },
      typescript = { filetypes.typescript.prettier },
      yaml = {
        filetypes.yaml.prettier,
        filetypes.yaml.yamlfmt,
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
