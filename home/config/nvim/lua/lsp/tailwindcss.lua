local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach').on_attach

lspconfig.tailwindcss.setup {
  on_attach = on_attach
}
