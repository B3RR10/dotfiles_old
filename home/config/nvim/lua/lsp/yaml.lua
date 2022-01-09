local lspconfig = require('lspconfig')
local util = require('lsp.util')

local workdir = lspconfig.util.root_pattern('.git', vim.fn.getcwd())

lspconfig.yamlls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = util.cmd(workdir(vim.fn.getcwd()), 'registry.berrio.dev/yaml-language-server'),
  root_dir = workdir,
  settings = {
    yaml = {
      schemas = {
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = '**/docker-compose*.{yml,yaml}',
        ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json'] = '/*.k8s.yaml',
      },
    },
  },
})
