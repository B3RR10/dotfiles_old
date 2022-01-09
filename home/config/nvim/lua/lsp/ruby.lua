local lspconfig = require('lspconfig')
local util = require('lsp.util')

local workdir = lspconfig.util.root_pattern('Gemfile', '.git', vim.fn.getcwd())

lspconfig.solargraph.setup({
  on_attach = util.on_attach,
  cmd = util.cmd(workdir(vim.fn.getcwd()), 'registry.berrio.dev/solargraph-language-server'),
})
