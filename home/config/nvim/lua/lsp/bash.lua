local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.bashls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require('lspcontainers').command('bashls'),
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
})
