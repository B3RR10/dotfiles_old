local lspconfig = require('lspconfig')
local util = require('lsp.util')

local env = vim.api.nvim_eval('environ()')
local cargo_path = env.HOME .. '/.cargo'
local cargo_path_volume = cargo_path .. ':' .. '/root/.cargo:ro'

lspconfig.rust_analyzer.setup({
  on_attach = util.on_attach,
  cmd = require('lspcontainers').command('rust_analyzer', {
    extra_volumes = { cargo_path_volume },
  }),
})
