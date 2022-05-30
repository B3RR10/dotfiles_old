local map = require('settings.utils').map

vim.api.nvim_create_user_command('CloseAllBuffers', 'execute "%bdelete|edit#|bdelete#"', {})
map('n', '<Leader>c', ':CloseAllBuffers<CR>')
