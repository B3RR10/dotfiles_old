local lspconfig = require('lspconfig')
local util = require('lsp.util')

lspconfig.sumneko_lua.setup({
  cmd = { '/usr/bin/lua-language-server', '-E', '/usr/share/lua-language-server/main.lua' },
  on_attach = util.on_attach,
  -- capabilities = capabilities(),
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
