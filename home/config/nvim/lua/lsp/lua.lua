local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach').on_attach

lspconfig.sumneko_lua.setup {
  cmd = { '/usr/bin/lua-language-server', '-E', '/usr/share/lua-language-server/main.lua' },
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { enable = true, globals = { "vim", "use", "lua" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}
