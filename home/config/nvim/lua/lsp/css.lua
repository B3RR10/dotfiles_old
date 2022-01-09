local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.cssls.setup({
  on_attach = util.on_attach,
})
