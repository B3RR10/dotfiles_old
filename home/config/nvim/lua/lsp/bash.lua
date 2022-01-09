local lspconfig = require('lspconfig')
local util = require('lsp.util')

local workdir = lspconfig.util.root_pattern('.git', vim.fn.getcwd())

lspconfig.bashls.setup({
  on_attach = util.on_attach,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = util.cmd(workdir(vim.fn.getcwd()), 'registry.berrio.dev/bash-language-server'),
  root_dir = workdir,
})
