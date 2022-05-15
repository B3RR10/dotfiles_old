local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.sumneko_lua.setup({
  on_attach = util.on_attach,
  -- capabilities = capabilities(),
  cmd = require('lspcontainers').command('sumneko_lua'),
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { enable = true, globals = { 'vim', 'use', 'lua' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})
