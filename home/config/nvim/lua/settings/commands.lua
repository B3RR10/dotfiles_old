local function CloseHiddenBuffers()
  local non_hidden_bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    non_hidden_bufs[vim.api.nvim_win_get_buf(win)] = true
  end

  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if not vim.api.nvim_buf_get_option(buffer, 'modified') and non_hidden_bufs[buffer] == nil then
      vim.cmd('bdelete ' .. buffer)
    end
  end
end

vim.api.nvim_create_user_command('CloseHiddenBuffers', CloseHiddenBuffers, {})
vim.keymap.set('n', '<Leader>c', ':CloseHiddenBuffers<CR>')
