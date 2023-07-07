local M = {}

function M.setup()
  require('luasnip.loaders.from_snipmate').lazy_load()
  require('luasnip.loaders.from_snipmate').lazy_load({ paths = { './snippets' } })
  require('luasnip.loaders.from_vscode').lazy_load()
end

return M
