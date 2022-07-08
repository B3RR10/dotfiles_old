local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.texlab.setup({
  on_attach = util.on_attach,
  settings = {
    texlab = {
      build = {
        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', "'-shell-escape'", '%f' },
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
      },
    },
  },
})
