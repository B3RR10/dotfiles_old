local lspconfig = require('lspconfig')
local util = require('lsp.util')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
  on_attach = util.on_attach,
  capabilities = capabilities,
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require('lspcontainers').command('html'),
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
})
