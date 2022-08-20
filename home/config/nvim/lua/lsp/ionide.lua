local util = require('lsp.util')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.g['fsharp#lsp_auto_setup'] = 0

require('ionide').setup({
  on_attach = util.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})
