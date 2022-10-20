local cmd = vim.cmd

cmd('syntax enable')
cmd('filetype plugin indent on')

vim.cmd([[
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  ]])
vim.opt.termguicolors = true

if vim.opt.diff:get() then
  vim.opt.foldopen = ''
else
  vim.opt.foldopen = 'all'
end

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cpoptions:append('n')
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.foldcolumn = '0'
vim.opt.formatoptions:remove('o')
vim.opt.formatoptions:remove('t')
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  tab = '| ',
  trail = '·',
  precedes = '«',
  extends = '»',
  nbsp = '·',
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.sessionoptions:remove('blank')
vim.opt.shiftwidth = 0
vim.opt.shortmess:append('n')
vim.opt.showbreak = '> '
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.textwidth = 120
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300
vim.opt.visualbell = true
