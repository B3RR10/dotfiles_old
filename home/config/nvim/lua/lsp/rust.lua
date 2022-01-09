local lspconfig = require('lspconfig')
local util = require('lsp.util')

local workdir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json', vim.fn.getcwd())

lspconfig.rust_analyzer.setup({
  on_attach = util.on_attach,
  cmd = util.cmd(workdir(vim.fn.getcwd()), 'registry.berrio.dev/rust-analyzer', true),
})
