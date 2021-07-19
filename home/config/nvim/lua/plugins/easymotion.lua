local map = require('settings.utils').map

map('', '<Leader><Leader>', '<Plug>(easymotion-prefix)', { noremap = false })
map('n', 'F', '<Plug>(easymotion-prefix)s', { noremap = false })
