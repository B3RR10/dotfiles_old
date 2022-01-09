local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.tailwindcss.setup({
  on_attach = util.on_attach,
})
