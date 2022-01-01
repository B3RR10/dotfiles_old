local cmd = vim.cmd

cmd 'syntax enable'
cmd 'filetype plugin indent on'

if vim.opt.diff:get() then
  vim.opt.foldopen = ''
else
  vim.opt.foldopen = 'all'
end

vim.opt.swapfile = false
vim.opt.clipboard = 'unnamedplus'
-- Do I want that?
-- vim.opt.cursorcolumn = true
-- vim.opt.cursorline = true
--
vim.opt.encoding = 'utf-8'
vim.opt.visualbell = true
vim.opt.foldcolumn = '0'
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.showbreak = '> '
vim.opt.cpoptions:append('n')
vim.opt.textwidth = 120
vim.opt.formatoptions:remove('j')
vim.opt.lazyredraw = true
vim.opt.incsearch = true
vim.opt.shortmess:append('n')

vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.listchars = {
  tab = '| ',
  trail = '·',
  precedes = '«',
  extends = '»',
  nbsp = '·',
}

vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showtabline = 2
vim.opt.updatetime = 300
vim.opt.splitbelow = true
vim.opt.splitright = true
-- TODO: Fix the optRemove function
vim.opt.sessionoptions:remove('blank')
