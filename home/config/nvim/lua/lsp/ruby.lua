local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.solargraph.setup({
  on_attach = util.on_attach,
  cmd = require('lspcontainers').command('solargraph'),
})
