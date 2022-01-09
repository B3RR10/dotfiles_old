local lspconfig = require('lspconfig')
local util = require('lsp.util')

local workdir = lspconfig.util.root_pattern('.git', vim.fn.getcwd())

lspconfig.jsonls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = util.cmd(workdir(vim.fn.getcwd()), 'registry.berrio.dev/json-language-server'),
  root_dir = workdir,
  commands = {
    Format = {
      function()
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
