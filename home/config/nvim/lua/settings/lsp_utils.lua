local M = {}

function M.on_attach(client, bufnr)
  local opts = { buffer = bufnr }
  local function bufmap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  bufmap('n', '<space>e', vim.diagnostic.open_float)
  bufmap('n', '[d', vim.diagnostic.goto_prev)
  bufmap('n', ']d', vim.diagnostic.goto_next)
  bufmap('n', '<space>q', vim.diagnostic.setloclist)

  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'gD', vim.lsp.buf.declaration)
  bufmap('n', 'gI', vim.lsp.buf.implementation)
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', '<C-k>', vim.lsp.buf.signature_help)

  bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
  bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
  bufmap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)

  bufmap('n', '<space>D', vim.lsp.buf.type_definition)
  bufmap('n', '<space>rn', vim.lsp.buf.rename)
  bufmap('n', '<space>ca', vim.lsp.buf.code_action)
  bufmap('n', 'gr', vim.lsp.buf.references)
  bufmap('n', '<space>f', vim.lsp.buf.formatting)

  print("'" .. client.name .. "' server attached")
end

return M
