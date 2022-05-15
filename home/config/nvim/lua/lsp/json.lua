local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.jsonls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require('lspcontainers').command('jsonls', { network = 'bridge' }),
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
  user_commands = {
    {
      name = 'Format',
      command = function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end,
    },
  },
  settings = {
    json = {
      schemas = {
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig',
        },
      },
    },
  },
})
