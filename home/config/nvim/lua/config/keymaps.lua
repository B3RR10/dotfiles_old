local utils = require('settings.utils')
local map = utils.map

-- Escape commands
map('i', 'jk', '<ESC>')
map('i', 'JK', '<ESC>')
map('', '<C-q>', '<ESC>')

-- Moving chars
map('n', 'L', 'xp')
map('n', 'H', 'Xph')

-- Keep visual selection after indent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Copy to end of line
map('', 'Y', 'y$')

-- Close preview window
map('', '<Leader>p', ':pclose<CR>', { silent = true })
