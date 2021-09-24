local map = require('settings.utils').map

vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_git_hl = 1

map('n', '<C-p>', ':NvimTreeToggle<CR>')
