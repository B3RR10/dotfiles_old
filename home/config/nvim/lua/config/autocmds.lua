local function augroup(name)
  return vim.api.nvim_create_augroup('nde_' .. name, { clear = true })
end

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup('highlight_yank'),
})

-- Show relative numbers only in normal mode
local lineNumsGrp = augroup('line_numbers')
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

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "OverseerForm",
    "OverseerList",
    "checkhealth",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
    "neoai-input",
    "neoai-output",
    "notify",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = augroup "auto_format_options",
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})
