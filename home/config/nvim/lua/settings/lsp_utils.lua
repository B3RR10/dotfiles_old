local M = {}

function M.on_attach(client, bufnr)
  local function bufmap(mode, lhs, rhs, custom_opts)
    local opts = { buffer = bufnr }
    if custom_opts ~= nil then
      opts = vim.tbl_extend('keep', opts, custom_opts)
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  bufmap('n', '<space>e', vim.diagnostic.open_float, { desc = 'Show diagnostics in a floating window.' })
  bufmap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Move to the previous diagnostic.' })
  bufmap('n', ']d', vim.diagnostic.goto_next, { desc = 'Move to the next diagnostic.' })
  bufmap('n', '<space>q', vim.diagnostic.setqflist, { desc = 'Add buffer diagnostics to quickfix list.' })

  bufmap('n', 'gd', vim.lsp.buf.definition, { desc = 'Jump to definition.' })
  bufmap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Jump to declaration.' })
  bufmap('n', 'gI', vim.lsp.buf.implementation, { desc = 'List all implementations.' })
  bufmap('n', 'K', vim.lsp.buf.hover, { desc = 'Display hover information.' })
  bufmap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Display signature information.' })

  bufmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add folder to workspace folders.' })
  bufmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove folder from workspace folders.' })
  bufmap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = 'List workspace folders.' })

  bufmap('n', '<space>D', vim.lsp.buf.type_definition, { desc = 'Jump to type definition.' })
  bufmap('n', '<space>rn', vim.lsp.buf.rename, { desc = 'Rename all references.' })
  bufmap('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'Select code action.' })
  bufmap('n', 'gr', vim.lsp.buf.references, { desc = 'List all references.' })
  bufmap('n', '<space>f', function()
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Format file.' })

  print("'" .. client.name .. "' server attached")
end

return M
