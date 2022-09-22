-- CloseHiddenBuffers
local function CloseHiddenBuffers()
  local non_hidden_bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    non_hidden_bufs[vim.api.nvim_win_get_buf(win)] = true
  end

  local buffers = vim.api.nvim_list_bufs()

  if #buffers == #non_hidden_bufs then
    return
  end

  for _, buffer in ipairs(buffers) do
    if not vim.api.nvim_buf_get_option(buffer, 'modified') and non_hidden_bufs[buffer] == nil then
      vim.cmd('bdelete ' .. buffer)
    end
  end
end

vim.api.nvim_create_user_command('CloseHiddenBuffers', CloseHiddenBuffers, {})
vim.keymap.set('n', '<Leader>C', CloseHiddenBuffers, { desc = 'CloseHiddenBuffers' })

-- CloseCurrentBuffer
local function CloseCurrentBuffer()
  -- Preserve window layout
  local function preserve_window_layout(bufnr)
    local all_windows = vim.api.nvim_list_wins()
    local buffers = vim.tbl_filter(function(buf)
      return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'buflisted')
    end, vim.api.nvim_list_bufs())

    if #buffers < 2 then
      return
    end

    local windows = vim.tbl_filter(function(win)
      return vim.api.nvim_win_get_buf(win) == bufnr
    end, all_windows)

    if #windows == 0 then
      return
    end

    for index, buffer in ipairs(buffers) do
      if buffer == bufnr then
        local new_focus_index = index + 1 > #buffers and #buffers - 1 or index + 1
        for _, win in ipairs(windows) do
          vim.api.nvim_win_set_buf(win, buffers[new_focus_index])
        end
      end
    end
  end

  local bufnr = vim.api.nvim_get_current_buf()
  preserve_window_layout(bufnr)
  vim.cmd('bdelete ' .. bufnr)
end
vim.api.nvim_create_user_command('CloseCurrentBuffer', CloseCurrentBuffer, {})
vim.keymap.set('n', '<Leader>c', CloseCurrentBuffer, { desc = 'CloseCurrentBuffer' })
vim.cmd([[cnoreabbrev <expr> bd getcmdtype() == ':' && getcmdline() == 'bd' ? 'CloseCurrentBuffer' : 'bd']])
