local map = require('settings.utils').map

map('n', '<Leader><Space>', '<CMD>Telescope buffers<CR>')
map('n', '<Leader>f', '<CMD>Telescope find_files<CR>')
map('n', '<Leader>g', '<CMD>Telescope git_filesj<CR>')
map('n', '<Leader>r', '<CMD>Telescope live_grep<CR>')
map('n', '<Leader>t', '<CMD>Telescope help_tags<CR>')
