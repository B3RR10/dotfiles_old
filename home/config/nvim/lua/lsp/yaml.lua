local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.yamlls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require('lspcontainers').command('yamlls', { network = 'bridge' }),
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = '**/docker-compose*.{yml,yaml}',
        ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json'] = '/*.k8s.yaml',
      },
    },
  },
})
