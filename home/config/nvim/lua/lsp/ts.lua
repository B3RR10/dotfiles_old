local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.tsserver.setup({
  on_attach = util.on_attach,
})
