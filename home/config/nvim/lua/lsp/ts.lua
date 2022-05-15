local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.tsserver.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require('lspcontainers').command('tsserver'),
  -- root_dir = util.root_pattern('.git', vim.fn.getcwd()),
})
