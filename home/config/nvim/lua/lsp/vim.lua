local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.vimls.setup({
  on_attach = util.on_attach,
})
