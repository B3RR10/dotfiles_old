local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach').on_attach

lspconfig.angularls.setup {
  on_attach = on_attach
}