-- Highlight yanked text
local yankHighlightGroup = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ on_visual = false })
  end,
  group = yankHighlightGroup,
})

-- Strip trailing spaces and convert tabs in spaces
function StripWhiteSpaces()
  local ft = vim.bo.filetype
  if ft == 'gitcommit' or ft == 'diff' then
    return
  end
  local currentPos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, currentPos)
end

local beforeSaveGroup = vim.api.nvim_create_augroup('BeforeSave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = StripWhiteSpaces,
  group = beforeSaveGroup,
})
vim.api.nvim_create_autocmd('BufWritePre', {
  command = '%retab!',
  group = beforeSaveGroup,
})

-- Show relative numbers in normal mode
local lineNumsGrp = vim.api.nvim_create_augroup('LineNums', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
  command = 'set nornu',
  group = lineNumsGrp,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  command = 'set rnu',
  group = lineNumsGrp,
})

-- Allow comments in json
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  command = [[syntax match Comment +\/\/.\+$+]],
})

-- Disable fold in commit buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  command = 'set nofoldenable',
})
