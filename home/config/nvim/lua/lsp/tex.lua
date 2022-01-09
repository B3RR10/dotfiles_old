local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.texlab.setup({
  on_attach = util.on_attach,
  settings = {
    texlab = {
      build = {
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
      },
    },
  },
})
