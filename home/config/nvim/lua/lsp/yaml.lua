local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach').on_attach

lspconfig.yamlls.setup({
  on_attach = on_attach,
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = '**/docker-compose*.{yml,yaml}',
      },
    },
  },
})
