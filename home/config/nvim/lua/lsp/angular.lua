local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.angularls.setup({
  on_attach = util.on_attach,
})
