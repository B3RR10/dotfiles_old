local M = {}

local function on_attach(client, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = false }
  -- Open the link under the caret.
  map('n', '<CR>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

  -- Create a new note after asking for its title.
  -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
  map('n', '<leader>zn', "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
  -- Create a new note in the same directory as the current buffer, using the current selection for title.
  map('v', '<leader>znt', ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
  -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
  map(
    'v',
    '<leader>znc',
    ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    opts
  )

  -- Open notes linking to the current buffer.
  map('n', '<leader>zb', '<Cmd>ZkBacklinks<CR>', opts)
  -- Alternative for backlinks using pure LSP and showing the source context.
  --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Open notes linked by the current buffer.
  map('n', '<leader>zl', '<Cmd>ZkLinks<CR>', opts)

  -- Preview a linked note.
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- Open the code actions for a visual selection.
  map('v', '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)

  print("'" .. client.name .. "' server attached")
end

function M.setup()
  require('zk').setup({
    picker = 'fzf',
    lsp = {
      config = {
        on_attach = on_attach,
      },
    },
  })

  local opts = { noremap = true, silent = false }
  -- Create a new note after asking for its title.
  vim.api.nvim_set_keymap('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

  -- Open notes.
  vim.api.nvim_set_keymap('n', '<leader>zo', '<Cmd>ZkNotes<CR>', opts)
  -- Open notes associated with the selected tags.
  vim.api.nvim_set_keymap('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)

  -- Search for the notes matching a given query.
  vim.api.nvim_set_keymap('n', '<leader>zf', "<Cmd>ZkNotes { match = vim.fn.input('Search: ') }<CR>", opts)
  -- Search for the notes matching the current visual selection.
  vim.api.nvim_set_keymap('v', '<leader>zf', ":'<,'>ZkMatch<CR>", opts)
end

return M